import pandas as pd
import xgboost as xgb
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, roc_auc_score, confusion_matrix, ConfusionMatrixDisplay, roc_curve
import matplotlib.pyplot as plt
from xgboost import plot_importance
from matplotlib.backends.backend_pdf import PdfPages

# Load the dataset
file_path = '/home/nefarious_aquarius/pyseer_starnet/pyseer/within_gene/XGBOOST/metabolic_unitigs_matrix_with_cellulitis.txt'
data = pd.read_csv(file_path, sep='\t')

# Extract features and labels
X = data.iloc[:, 2:]  # Exclude 'sample' and 'cellulitis' columns
y = data['cellulitis']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Initialize and train the XGBoost model
model = xgb.XGBClassifier(eval_metric='logloss')
model.fit(X_train, y_train)

# Make predictions on the test set
y_pred = model.predict(X_test)
y_pred_proba = model.predict_proba(X_test)[:, 1]

# Evaluate the model
accuracy = accuracy_score(y_test, y_pred)
roc_auc = roc_auc_score(y_test, y_pred_proba)

# Print accuracy and ROC AUC
print(f'Accuracy: {accuracy:.4f}')
print(f'ROC AUC: {roc_auc:.4f}')

# Create a multi-page PDF
pdf_file_path = "/home/nefarious_aquarius/pyseer_starnet/pyseer/within_gene/XGBOOST/xgboost_results.pdf"
pdf = PdfPages(pdf_file_path)

# Feature Importance Plot
plt.figure(figsize=(12, 10))  # Increase the figure size
plot_importance(model, max_num_features=20)
plt.title('Top 20 Feature Importances')
plt.tight_layout()  # Adjust layout to fit labels
pdf.savefig()  # Save feature importance plot to PDF
plt.close()

# ROC Curve Plot
fpr, tpr, _ = roc_curve(y_test, y_pred_proba)
plt.figure(figsize=(10, 8))
plt.plot(fpr, tpr, color='blue', lw=2, label=f'ROC curve (area = {roc_auc:.2f})')
plt.plot([0, 1], [0, 1], color='gray', linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Receiver Operating Characteristic (ROC)')
plt.legend(loc="lower right")
pdf.savefig()  # Save ROC curve to PDF
plt.close()

# Confusion Matrix Plot
cm = confusion_matrix(y_test, y_pred)
disp = ConfusionMatrixDisplay(confusion_matrix=cm)
plt.figure(figsize=(10, 8))
disp.plot(cmap=plt.cm.Blues)
plt.title('Confusion Matrix')
plt.tight_layout()  # Adjust layout to fit labels
pdf.savefig()  # Save confusion matrix plot to PDF
plt.close()

# Close the PDF file
pdf.close()

print(f"Results have been saved to {pdf_file_path}")