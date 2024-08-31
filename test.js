const fs = require('fs');

// fs.appendFile('test.txt', '', (err) => {
//     if (err) {
//         throw err;
//     }
//     console.log('Saved!');
// })

const file = fs.readFileSync('obs.txt', 'utf-8')
console.log(file)