const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));
// con JSON.parse se mostró el archivo tal cual esta representado
// en cambio con JSON.stringify