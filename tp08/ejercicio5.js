const fs = require("fs");
const rawdata = fs.readFileSync("./departamentos.json","utf8");
var departamentos = JSON.parse(rawdata);

function getEmpleado (arreglo,puesto) {
    for(var i=0; i<arreglo[puesto].length; i++ ){        
        console.log(arreglo["tecnologia"][i]["nombre"]+" " + arreglo ["tecnologia"][i][puesto] );
    }
}
getEmpleado(departamentos, "tecnologia");