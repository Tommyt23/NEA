import pandas as pd

csvData = pd.read_csv("scores.csv")

print(csvData.keys())

csvData = csvData.rename(columns={' Score': 'Score'})
csvData = csvData.sort_values('Score', ascending=False)

csvData.to_csv("scores.csv", index=False)
