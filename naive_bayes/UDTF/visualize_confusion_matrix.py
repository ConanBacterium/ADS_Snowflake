import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read the CSV file
df = pd.read_csv('naive_bayes_confusion_result.csv')

# Create a pivot table for the confusion matrix
confusion_matrix = df.pivot(index='Actual Label', 
                          columns='Predicted Label', 
                          values='Count')

# Create a figure with a larger size
plt.figure(figsize=(10, 8))

# Create heatmap
sns.heatmap(confusion_matrix, 
            annot=True, 
            fmt='g',  # Use general format for integers
            cmap='Blues',  # Use a blue color scheme
            cbar_kws={'label': 'Count'},
            square=True)  # Make cells square

# Add labels and title
plt.title('Test Set Confusion Matrix (UDTF)', pad=20)
plt.ylabel('Actual Label')
plt.xlabel('Predicted Label')

# Rotate x-axis labels if needed
plt.xticks(rotation=0)
plt.yticks(rotation=0)

# Adjust layout
plt.tight_layout()

# Save the plot
plt.savefig('confusion_matrix.png', dpi=300, bbox_inches='tight')

# Display the plot
plt.show()

# Calculate and print accuracy
total = df['Count'].sum()
correct = df[df['Actual Label'] == df['Predicted Label']]['Count'].sum()
accuracy = correct / total * 100

print(f'\nOverall Accuracy: {accuracy:.2f}%')