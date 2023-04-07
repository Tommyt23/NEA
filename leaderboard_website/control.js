let csvContentsPromise = fetch('scores.csv')
  .then(response => response.text())
  .catch(error => {
    console.error(error);
  });

// Define a function that uses the csvContents variable
function useCsvContents(csvContents) {
  
  // Use csvContents here
}

// Wait for the contents of the CSV file to be available
csvContentsPromise.then(csvContents => {
  // Assign the contents to a global variable
  window.csvContents = csvContents;
  // Call the function that uses the csvContents variable
  useCsvContents(csvContents);
});