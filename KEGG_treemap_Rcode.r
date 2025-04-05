# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800
# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM
# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes
# Set the working directory if necessary
setwd("C:/Users/juice/OneDrive/Postdoc/Publications/staphgwasmanuscript/pyseer_infection_n156/STARnet_157_snps_table/NSNV_infect/DAVID_n=500_NSNV/n=524_genes/KEGG");
# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.
revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0006508","proteolysis",4.8034934497816595,12,0.7753037678001504,0,"proteolysis"),
c("GO:0000162","tryptophan biosynthetic process",0.3572846367606193,5,0.6840952209890333,0.18825282,"proteolysis"),
c("GO:0000724","double-strand break repair via homologous recombination",0.07939658594680428,2,0.7661586788286757,0.55376741,"proteolysis"),
c("GO:0000725","recombinational repair",0.23818975784041285,2,0.7457980976272452,0.59993227,"proteolysis"),
c("GO:0002143","tRNA wobble position uridine thiolation",0.03969829297340214,1,0.7573799950569039,0.66591758,"proteolysis"),
c("GO:0002939","tRNA N1-guanine methylation",0.03969829297340214,1,0.7573799950569039,0.66591758,"proteolysis"),
c("GO:0005975","carbohydrate metabolic process",7.344184200079397,3,0.8808106474548898,0.14652958,"proteolysis"),
c("GO:0006071","glycerol metabolic process",0.43668122270742354,2,0.7900389130972404,0.44140105,"proteolysis"),
c("GO:0006090","pyruvate metabolic process",0.7939658594680429,1,0.7686712751773527,0.33477177,"proteolysis"),
c("GO:0006094","gluconeogenesis",0.39698292973402144,2,0.758594063121316,0.34539395,"proteolysis"),
c("GO:0006106","fumarate metabolic process",0.03969829297340214,1,0.8167401643884032,0.54246158,"proteolysis"),
c("GO:0006108","malate metabolic process",0.11909487892020643,1,0.80148100656974,0.59019457,"proteolysis"),
c("GO:0006139","nucleobase-containing compound metabolic process",18.618499404525604,1,0.8652440502925878,0.19278012,"proteolysis"),
c("GO:0006260","DNA replication",1.8261214767764984,2,0.7652335568829478,0.68193841,"proteolysis"),
c("GO:0006268","DNA unwinding involved in DNA replication",0.19849146486701072,3,0.7610610159880198,0.53425223,"proteolysis"),
c("GO:0006285","base-excision repair, AP site formation",0.15879317189360856,1,0.7554810947065604,0.5228662,"proteolysis"),
c("GO:0006289","nucleotide-excision repair",0.3175863437872171,1,0.7416820677095097,0.59886356,"proteolysis"),
c("GO:0006298","mismatch repair",0.23818975784041285,1,0.7475935950749979,0.5841061,"proteolysis"),
c("GO:0006302","double-strand break repair",0.3572846367606193,2,0.7391813145968866,0.56676233,"proteolysis"),
c("GO:0006307","DNA alkylation repair",0.11909487892020643,1,0.7607851312404242,0.50888407,"proteolysis"),
c("GO:0006310","DNA recombination",1.7864231838030966,5,0.7657300286550226,0.26632234,"proteolysis"),
c("GO:0006313","DNA transposition",0.07939658594680428,3,0.812878217485483,0.49040096,"proteolysis"),
c("GO:0006400","tRNA modification",1.3100436681222707,3,0.6812478394733906,0.46138668,"proteolysis"),
c("GO:0006412","translation",4.208019055180627,2,0.6906512406039831,0.59582588,"proteolysis"),
c("GO:0006413","translational initiation",0.15879317189360856,1,0.7669564021074966,0.38987959,"proteolysis"),
c("GO:0006421","asparaginyl-tRNA aminoacylation",0.03969829297340214,1,0.7162248830659853,0.61579149,"proteolysis"),
c("GO:0006432","phenylalanyl-tRNA aminoacylation",0.07939658594680428,1,0.7022136698223732,0.60457924,"proteolysis"),
c("GO:0006526","arginine biosynthetic process",0.5160778086542279,2,0.6792782706272119,0.53683346,"proteolysis"),
c("GO:0006629","lipid metabolic process",5.518062723302898,1,0.8848861917350023,0.15021871,"proteolysis"),
c("GO:0006693","prostaglandin metabolic process",0.7938451921750899,1,0.7126053339583108,0.63820214,"proteolysis"),
c("GO:0006749","glutathione metabolic process",0.11909487892020643,1,0.8052005616436866,0.68099132,"proteolysis"),
c("GO:0006779","porphyrin-containing compound biosynthetic process",0.8733624454148471,1,0.8010032037203787,0.25823436,"proteolysis"),
c("GO:0008610","lipid biosynthetic process",3.8110361254466056,1,0.7748406337617042,0.6949221,"proteolysis"),
c("GO:0008652","amino acid biosynthetic process",5.438666137356093,7,0.7540399836183733,0.54413844,"proteolysis"),
c("GO:0009058","biosynthetic process",34.140531957125845,2,0.90717581523599,0.10459922,"proteolysis"),
c("GO:0009089","lysine biosynthetic process via diaminopimelate",0.43668122270742354,2,0.6439823809288368,0.65874783,"proteolysis"),
c("GO:0009094","L-phenylalanine biosynthetic process",0.03969829297340214,1,0.7366517145908281,0.65017862,"proteolysis"),
c("GO:0009098","L-leucine biosynthetic process",0.23818975784041285,3,0.699785091017831,0.48599495,"proteolysis"),
c("GO:0009231","riboflavin biosynthetic process",0.4763795156808257,2,0.7426341540098356,0.34539395,"proteolysis"),
c("GO:0009234","menaquinone biosynthetic process",0.39698292973402144,4,0.771726387301726,0.33649313,"proteolysis"),
c("GO:0009247","glycolipid biosynthetic process",0.3572846367606193,2,0.721910236886531,0.61351545,"proteolysis"),
c("GO:0009313","oligosaccharide catabolic process",0.3175863437872171,1,0.8193399794320024,0.42894088,"proteolysis"),
c("GO:0009423","chorismate biosynthetic process",0.3175863437872171,3,0.738387627092238,0.40963431,"proteolysis"),
c("GO:0009432","SOS response",0.6351726875744342,1,0.8824310126602052,0.62722491,"proteolysis"),
c("GO:0009436","glyoxylate catabolic process",0.32887308965743534,1,0.7285781957022044,0.55600021,"proteolysis"),
c("GO:0010027","thylakoid membrane organization",3.49351135114582,1,0.9114496715042147,0.68925955,"proteolysis"),
c("GO:0015074","DNA integration",0.39698292973402144,2,0.7953850707386609,0.57301254,"proteolysis"),
c("GO:0016042","lipid catabolic process",0.9130607383882492,3,0.7768987952749983,0.58823206,"proteolysis"),
c("GO:0016117","carotenoid biosynthetic process",0.9945147677159871,3,0.7427253923788953,0.18882117,"proteolysis"),
c("GO:0019303","D-ribose catabolic process",0.07939658594680428,1,0.7878227347986217,0.62786335,"proteolysis"),
c("GO:0019464","glycine decarboxylation via glycine cleavage system",0.15879317189360856,1,0.6920469355481932,0.4743455,"proteolysis"),
c("GO:0019856","pyrimidine nucleobase biosynthetic process",0.3572846367606193,1,0.7130555123676803,0.28325616,"proteolysis"),
c("GO:0030259","lipid glycosylation",0.03969829297340214,1,0.8394959222050381,0.48454987,"proteolysis"),
c("GO:0032447","protein urmylation",0.13875378902584617,1,0.8184246354840541,0.55909024,"proteolysis"),
c("GO:0034514","mitochondrial unfolded protein response",0.5904687715306791,1,0.8855776172679564,0.58592014,"proteolysis"),
c("GO:0035999","tetrahydrofolate interconversion",0.15879317189360856,2,0.812225137011178,0.17215141,"proteolysis"),
c("GO:0042128","nitrate assimilation",0.39698292973402144,1,0.7855472808100024,0.30798501,"proteolysis"),
c("GO:0043137","DNA replication, removal of RNA primer",0.07939658594680428,1,0.7412151110140042,0.58827629,"proteolysis"),
c("GO:0043686","co-translational protein modification",0.11909487892020643,1,0.8205208490524151,0.53576904,"proteolysis"),
c("GO:0044281","small molecule metabolic process",24.136562127828505,1,0.9120527037080798,0.17224935,"proteolysis"),
c("GO:0045226","extracellular polysaccharide biosynthetic process",0.3175863437872171,1,0.7772425279576336,0.67373469,"proteolysis"),
c("GO:0046279","3,4-dihydroxybenzoate biosynthetic process",0.03969829297340214,1,0.7569779238114429,0.5447738,"proteolysis"),
c("GO:0046474","glycerophospholipid biosynthetic process",0.3572846367606193,1,0.7193396730445815,0.61351545,"proteolysis"),
c("GO:0046506","sulfolipid biosynthetic process",0.5988701965559293,2,0.7409576906432015,0.64608846,"proteolysis"),
c("GO:0051085","chaperone cofactor-dependent protein refolding",0.15879317189360856,1,0.779197268302282,0.67547932,"proteolysis"),
c("GO:0051603","proteolysis involved in protein catabolic process",0.19849146486701072,1,0.7587837895773983,0.46446764,"proteolysis"),
c("GO:0071586","CAAX-box protein processing",0.19849146486701072,1,0.77389442939701,0.39927676,"proteolysis"),
c("GO:0006518","peptide metabolic process",1.3894402540690751,1,0.9384632151251036,0.05880069,"peptide metabolic process"),
c("GO:0007049","cell cycle",1.349741961095673,2,0.9740670705713843,0.02506385,"cell cycle"),
c("GO:0007059","chromosome segregation",0.55577610162763,2,0.9656612871154915,0.02240994,"chromosome segregation"),
c("GO:0051304","chromosome separation",0.03969829297340214,1,0.9714116475292286,0.65219427,"chromosome segregation"),
c("GO:0007155","cell adhesion",0.19849146486701072,3,0.9783092039570183,0.01995774,"cell adhesion"),
c("GO:0007623","circadian rhythm",22.677649861055976,1,1,-0,"circadian rhythm"),
c("GO:0008360","regulation of cell shape",1.945216355696705,6,0.9382173254379196,-0,"regulation of cell shape"),
c("GO:0006449","regulation of translational termination",0.8548229413247177,1,0.9568552586481205,0.3749133,"regulation of cell shape"),
c("GO:0050870","positive regulation of T cell activation",1.685747991063069,1,0.9443107206153006,0.36221585,"regulation of cell shape"),
c("GO:0015675","nickel cation transport",0.35809480600497445,8,0.9284530087929627,-0,"nickel cation transport"),
c("GO:0003333","amino acid transmembrane transport",1.349741961095673,1,0.9184231504828034,0.33906564,"nickel cation transport"),
c("GO:0006811","monoatomic ion transport",5.279872965462485,1,0.9348246548742818,0.5630131,"nickel cation transport"),
c("GO:0006814","sodium ion transport",0.9924573243350536,2,0.9259105809266233,0.64942632,"nickel cation transport"),
c("GO:0006817","phosphate ion transport",0.4763795156808257,1,0.944589393078522,0.25770766,"nickel cation transport"),
c("GO:0006824","cobalt ion transport",0.19849146486701072,2,0.9082137148972265,0.68346781,"nickel cation transport"),
c("GO:0006865","amino acid transport",2.9773719730051607,3,0.9388031608037218,0.31356211,"nickel cation transport"),
c("GO:0015628","protein secretion by the type II secretion system",0.07939658594680428,1,0.9024903094059766,0.52199864,"nickel cation transport"),
c("GO:0015724","formate transport",0.07939658594680428,1,0.9494203070450002,0.20760854,"nickel cation transport"),
c("GO:0015771","trehalose transport",0.15879317189360856,1,0.9500194700939117,0.21952357,"nickel cation transport"),
c("GO:0015833","peptide transport",0.7145692735212386,5,0.9212151741165336,0.25075111,"nickel cation transport"),
c("GO:0015990","electron transport coupled proton transport",0.23818975784041285,1,0.9122077024495213,0.56049944,"nickel cation transport"),
c("GO:0017038","protein import",0.03969829297340214,1,0.9135563884354528,0.49209834,"nickel cation transport"),
c("GO:0055085","transmembrane transport",17.070265978562922,10,0.8946019723054139,0.50195089,"nickel cation transport"),
c("GO:0071577","zinc ion transmembrane transport",0.15879317189360856,1,0.9098211451545715,0.67084003,"nickel cation transport"),
c("GO:0071805","potassium ion transmembrane transport",0.15879317189360856,1,0.9131456480372742,0.55088511,"nickel cation transport"),
c("GO:0016310","phosphorylation",2.0643112346169117,7,0.8049938755844472,0.06216655,"phosphorylation"),
c("GO:0006189","'de novo' IMP biosynthetic process",0.55577610162763,2,0.6477177757509408,0.45181987,"phosphorylation"),
c("GO:0009061","anaerobic respiration",0.15879317189360856,1,0.8734162842399577,0.67451043,"phosphorylation"),
c("GO:0009435","NAD biosynthetic process",0.23818975784041285,1,0.6951682813627335,0.64337078,"phosphorylation"),
c("GO:0015936","coenzyme A metabolic process",0.19849146486701072,1,0.7051893622604574,0.59991282,"phosphorylation"),
c("GO:0016311","dephosphorylation",0.07939658594680428,1,0.8531650375349077,0.3720292,"phosphorylation"),
c("GO:0019693","ribose phosphate metabolic process",3.6125446605795952,1,0.7511144436946676,0.56926217,"phosphorylation"),
c("GO:0042773","ATP synthesis coupled electron transport",0.277888050813815,3,0.8621667264520614,0.10768877,"phosphorylation"),
c("GO:0046167","glycerol-3-phosphate biosynthetic process",0.03969829297340214,1,0.8063644795010493,0.35001151,"phosphorylation"),
c("GO:0046380","N-acetylneuraminate biosynthetic process",2.1519897263087504,1,0.6012957218574213,0.54534308,"phosphorylation"),
c("GO:0070813","hydrogen sulfide metabolic process",0.277888050813815,1,0.8593707662450693,0.10768877,"phosphorylation"),
c("GO:1901137","carbohydrate derivative biosynthetic process",7.066296149265582,1,0.774752667999363,0.67928641,"phosphorylation"),
c("GO:1902758","bis(molybdopterin guanine dinucleotide)molybdenum biosynthetic process",0.4632420733504718,1,0.6666697799062911,0.60579588,"phosphorylation"),
c("GO:2001059","D-tagatose 6-phosphate catabolic process",0.551011120041048,1,0.7231763882580845,0.45139148,"phosphorylation"),
c("GO:0019290","siderophore biosynthetic process",0.11909487892020643,2,0.874687088212777,0.04401307,"siderophore biosynthetic process"),
c("GO:0017000","antibiotic biosynthetic process",1.9849146486701073,1,0.8631225852876181,0.13288433,"siderophore biosynthetic process"),
c("GO:0043171","peptide catabolic process",0.03969829297340214,1,0.8299292533031327,0.57905422,"siderophore biosynthetic process"),
c("GO:0044249","cellular biosynthetic process",26.716951171099645,1,0.7790378095094994,0.27017323,"siderophore biosynthetic process"),
c("GO:0032259","methylation",2.1834061135371177,6,0.9354240402477969,0.06267483,"methylation"),
c("GO:0046677","response to antibiotic",1.8658197697499008,3,0.9288186400669312,-0,"response to antibiotic"),
c("GO:0006355","regulation of DNA-templated transcription",10.00396982929734,7,0.9419828502411552,0.59540902,"response to antibiotic"),
c("GO:0006950","response to stress",5.835649067090115,1,0.9301055270214647,0.45054811,"response to antibiotic"),
c("GO:0007165","signal transduction",3.8110361254466056,2,0.8506461162064141,0.56572365,"response to antibiotic"),
c("GO:0009408","response to heat",0.277888050813815,2,0.9133260025263373,0.30038091,"response to antibiotic"),
c("GO:0010043","response to zinc ion",0.11909487892020643,1,0.9439007708276431,0.47171168,"response to antibiotic"),
c("GO:0016036","cellular response to phosphate starvation",0.03969829297340214,1,0.903222275885787,0.39007361,"response to antibiotic"),
c("GO:0030420","establishment of competence for transformation",2.3818975784041285,2,0.899385544770324,0.38398892,"response to antibiotic"),
c("GO:0034599","cellular response to oxidative stress",0.277888050813815,2,0.8823632796406589,0.51221772,"response to antibiotic"),
c("GO:0046685","response to arsenic-containing substance",0.19849146486701072,2,0.9415832596574886,0.495327,"response to antibiotic"),
c("GO:0051301","cell division",2.1040095275903137,5,0.9728322117147565,0.02664242,"cell division"),
c("GO:0051715","cytolysis in another organism",0.11909487892020643,3,0.9636097320619433,0.01893005,"cytolysis in another organism"),
c("GO:0085032","symbiont-mediated perturbation of host NF-kappaB cascade",0.08055924805951967,1,0.9824143949279283,0.65329224,"cytolysis in another organism"),
c("GO:0071555","cell wall organization",4.128622469233823,10,0.9164120454998005,-0,"cell wall organization"),
c("GO:0006415","translational termination",0.11909487892020643,1,0.7432623244001153,0.67054403,"cell wall organization"),
c("GO:0016226","iron-sulfur cluster assembly",0.277888050813815,2,0.9317894541575721,0.46990299,"cell wall organization"),
c("GO:0051259","protein complex oligomerization",0.19849146486701072,1,0.9278909027779718,0.57042834,"cell wall organization"),
c("GO:0071973","bacterial-type flagellum-dependent cell motility",1.2703453751488685,1,0.9742269109311389,0.02486268,"bacterial-type flagellum-dependent cell motility"),
c("GO:0090609","single-species submerged biofilm formation",0.07939658594680428,1,0.9798774460597355,0.01818671,"single-species submerged biofilm formation"));
stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;
stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );
# by default, outputs to a PDF file
pdf( file="revigo_treemap_v3.pdf", width=16, height=9 ) # width and height are in inches
# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
stuff,
index = c("representative","description"),
vSize = "value",
type = "categorical",
vColor = "representative",
title = "Biological Process Clusters of Staphyloccus aureus Variant Genes",
inflate.labels = TRUE,      # set this to TRUE for space-filling group labels - good for posters
lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
bg.labels = "#CCCCCCAA",   # define background color of group labels
# "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
position.legend = "none"
)
dev.off()
