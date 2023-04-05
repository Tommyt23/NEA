const express = require('express');
const app = express();
const fs = require('fs');

let count = 0;
if (fs.existsSync('./count.txt')) {
  count = parseInt(fs.readFileSync('./count.txt', 'utf-8'), 10);
}

app.get('/', (req, res) => {
  count++;
  fs.writeFileSync('./count.txt', count.toString(), 'utf-8');
  res.send(`${count}`);
});

app.listen(3000, () => {
  console.log('Server listening on port 3000');
});