'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
// stringify lo esta leyendo de manera asincrona de esta manera trae todos los datos a la vez y en formato Json de esta manera 
// muestra {"type":"buffer", "data":[ y aca va el encoding]}
console.log(data);
// está imprimiendo el encoding data 
});