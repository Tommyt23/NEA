let csvContentsPromise = fetch('scores.csv')
  .then(response => response.text())
  .then(contents => {
    csvContents = contents;
    console.log(csvContents);
    // You can use csvContents here or pass it to another function
    useCsvContents(csvContents);
  })
  .catch(error => {
    console.error(error);
  });

// Define a function that uses the csvContents variable
function useCsvContents(csvContents) {
  console.log(csvContents);
  let rows = csvContents.split("\n");
  let tableBody = document.getElementById("tableBody");

  // Loop through each row and add it to the table
  for (let i = 0; i < rows.length; i++) {
    let columns = rows[i].split(",");
    let newRow = tableBody.insertRow();
    for (let j = 0; j < (columns.length + 1); j++) {
      if (j === 0){
        let newCell = newRow.insertCell();
        newCell.appendChild(document.createTextNode(i+1))
      }
      else{
        let newCell = newRow.insertCell();
        newCell.appendChild(document.createTextNode(columns[j-1]));
      }
    }
  }
}

// Wait for the contents of the CSV file to be available
csvContentsPromise.then(csvContents => {
  console.log(csvContents);
  // Assign the contents to a global variable
  window.csvContents = csvContents;
});