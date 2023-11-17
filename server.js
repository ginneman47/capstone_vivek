const express = require('express');
const fs = require('fs');

const app = express();
const port = 3000;

app.get('/', (req, res) => {
  fs.readFile('data.txt', 'utf8', (err, data) => {
    if (err) {
      res.status(500).send('Error reading the file.');
    } else {
      const complexNumbers = data.trim().split('\n');

      let counter = 0;

      const interval = setInterval(() => {
        if (counter < complexNumbers.length) {
          const complex = complexNumbers[counter];
          const [real, imaginary] = complex.split('-').map(part => parseFloat(part));
          const formattedNumber = `${real.toFixed(4)} ${imaginary < 0 ? '-' : '+'} ${Math.abs(imaginary).toFixed(4)}i`;

          res.write(`<html><body>${formattedNumber}<br></body></html>`);
          counter++;
        } else {
          clearInterval(interval);
          res.end();
        }
      }, 1000); // 1000 milliseconds (1 second) delay
    }
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
