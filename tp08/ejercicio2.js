'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
//está imprimiendo JsonData de manera asincrona convirtiendo en un objeto Json
console.log(JSON.parse(jsonData));
// está emitiendo un error al no poder parsear el formato Json