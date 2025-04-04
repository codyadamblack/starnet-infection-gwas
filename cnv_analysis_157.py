import os
import subprocess
import pandas as pd
import numpy as np

# Paths
working_dir = "/home/nefarious_aquarius/CNV/"
fastq_dir = os.path.join(working_dir, "starnet_157_fastq/STARnet_157_fastq")
output_dir = os.path.join(working_dir, "CNV_output")
os.makedirs(output_dir, exist_ok=True)

# MLST locus_tags
mlst_gene_ids = [
    "SAOUHSC_02965", "SAOUHSC_01699", "SAOUHSC_01276",
    "SAOUHSC_01176", "SAOUHSC_00574", "SAOUHSC_00797", "SAOUHSC_00336"
]

# Initialize a dataframe to store CNV results for all samples
all_cnv_results = pd.DataFrame()

# Function to read and process read depth files
def process_read_depth(sample_name, sorted_bam_file):
    depth_file = os.path.join(output_dir, f"{sample_name}_read_depth.txt")
    with open(depth_file, "w") as depth_out:
        subprocess.run(["bedtools", "genomecov", "-ibam", sorted_bam_file, "-dz"], stdout=depth_out)

    read_depth = pd.read_csv(depth_file, sep="\t", header=None, names=["chrom", "position", "depth"])
    
    # Read BED file and filter by gene start and end positions
    bed_file = os.path.join(working_dir, "8325_gff3_locus.bed")
    bed_data = pd.read_csv(bed_file, sep="\t", header=None, names=["chrom", "start", "end", "locus_tag", "score", "strand"])

    # Adjust for 1-based end positions in BED file
    bed_data['end'] = bed_data['end'] - 1  # Convert to 0-based exclusive end position

    # Merge read depth with BED data
    merged_data = pd.merge_asof(read_depth.sort_values('position'), bed_data.sort_values('start'), by='chrom', left_on='position', right_on='start')
    merged_data = merged_data[(merged_data['position'] >= merged_data['start']) & (merged_data['position'] <= merged_data['end'])]

    # Average read depth for each locus tag
    locus_avg_depth = merged_data.groupby('locus_tag')['depth'].mean().reset_index()

    # Filter for MLST genes
    mlst_genes_depth = locus_avg_depth[locus_avg_depth['locus_tag'].isin(mlst_gene_ids)]

    if mlst_genes_depth.empty:
        print(f"No MLST genes found in sample {sample_name}.")
        return pd.DataFrame()

    # Save MLST genes and their average depths
    mlst_genes_depth_summary = mlst_genes_depth.rename(columns={"depth": "avg_depth"})
    mlst_genes_depth_summary.to_csv(
        os.path.join(output_dir, f"{sample_name}_housekeeping_genes.csv"),
        index=False
    )

    # Calculate the average depth of MLST genes
    avg_housekeeping_depth = mlst_genes_depth_summary['avg_depth'].mean()

    # Calculate CNV for all genes using the average housekeeping depth as baseline
    locus_avg_depth['raw_cnv'] = locus_avg_depth['depth'] / avg_housekeeping_depth
    locus_avg_depth['cnv_category'] = np.where(locus_avg_depth['raw_cnv'].between(0.8, 1.2), "Normal", 
                                               np.where(locus_avg_depth['raw_cnv'] > 1.2, "Amplified", "Deleted"))
    locus_avg_depth['sample'] = sample_name

    return locus_avg_depth

# Function to process each sample
def process_sample(sample_name):
    r1_fastq = os.path.join(fastq_dir, f"{sample_name}_R1.gz")
    r2_fastq = os.path.join(fastq_dir, f"{sample_name}_R2.gz")
    sam_file = os.path.join(output_dir, f"{sample_name}.sam")
    bam_file = os.path.join(output_dir, f"{sample_name}.bam")
    sorted_bam_file = os.path.join(output_dir, f"{sample_name}_sorted.bam")

    # Step 1: Align reads using BWA and generate SAM file
    subprocess.run([
        "bwa", "mem", "-t", "8", "-o", sam_file, "/home/nefarious_aquarius/CNV/8325_fasta.fasta", r1_fastq, r2_fastq
    ])

    # Step 2: Convert SAM to BAM
    subprocess.run(["samtools", "view", "-Sb", sam_file, "-o", bam_file])

    # Step 3: Sort the BAM file
    subprocess.run(["samtools", "sort", "-o", sorted_bam_file, bam_file])

    # Step 4: Remove intermediate files (SAM and unsorted BAM)
    os.remove(sam_file)
    os.remove(bam_file)

    # Step 5: Index the sorted BAM file
    subprocess.run(["samtools", "index", sorted_bam_file])

    # Step 6: Generate read depth file using Bedtools
    return sorted_bam_file, process_read_depth(sample_name, sorted_bam_file)

# Process each sample in the directory
for sample_file in os.listdir(fastq_dir):
    if sample_file.endswith("_R1.gz"):
        sample_name = sample_file.split("_R1.gz")[0]
        print(f"Processing {sample_name}...")
        try:
            sorted_bam_file, sample_cnv_results = process_sample(sample_name)
            all_cnv_results = pd.concat([all_cnv_results, sample_cnv_results], ignore_index=True)
        except Exception as e:
            print(f"Error processing {sample_name}: {e}")

# Save the combined CNV results for all samples
all_cnv_results.to_csv(
    os.path.join(working_dir, "all_samples_cnv_results.csv"),
    index=False
)

print("CNV analysis completed successfully.")