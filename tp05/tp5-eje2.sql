DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id_cliente INT UNSIGNED ,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id_vendedor INT UNSIGNED ,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED ,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
-- (id,nombre, cp,id_provincia). Tener en cuenta que:
-- ●En un país hay muchas provincias.
-- ●En una provincia hay muchas localidades.
CREATE TABLE paises (
id_pais INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);
;CREATE TABLE provincias (
id_provincia INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
id_pais INT UNSIGNED NOT NULL
);
CREATE TABLE localidades (
id_localidad INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
CP varchar(30) NOT NULL,
id_provincia INT UNSIGNED NOT NULL
);
-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- ●direccion (varchar)
-- ●id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- ●email
-- ●telefono
-- ●fecha_ingreso
-- ●tms (timestamp)

ALTER TABLE empleados
ADD direccion VARCHAR(100),
ADD id_localidad INT UNSIGNED NOT NULL primary key,
ADD email VARCHAR(30),
ADD telefono VARCHAR(30),	
ADD fecha_ingreso DATE,
ADD tms TIMESTAMP;

-- 3. Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos:
-- ●gasto (double)
-- ●tms (timestamp)

ALTER TABLE departamentos
ADD gasto DOUBLE,
ADD tms TIMESTAMP;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,
-- empleados.

insert into paises values ("01", "Argentina");
insert into paises values ("02","Peru");
insert into paises values ("03","Uruguay");
insert into paises values ("04","Brasil");
insert into paises values ("05","Colombia");

insert into provincias values ("01","Buenos Aires","01");
insert into provincias values ("02","Misiones","02");
insert into provincias values ("03","Corrientes","03");
insert into provincias values ("04","Chaco","04");
insert into provincias values ("05","San juan","05");

insert into departamentos values ("01","Obera","01","30.000","1","15.000","");
insert into departamentos values ("01","Iguazu","02","50.000","0","30.000","");
insert into departamentos values ("01","San Ignacio","03","80.000","1","20.000","");
insert into departamentos values ("01","Eldorado","04","60.000","1","50.000","");
insert into departamentos values ("01","Apostoles","05","70.000","0","36.000","");

insert into localidades values ("01","25 de Mayo","01");
insert into localidades values ("02","Azara","02");
insert into localidades values ("03","Candelaria","03");
insert into localidades values ("04","Colonia Aurora","04");
insert into localidades values ("05","Cerro Cora","05");

-- 5 Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE

rename table pedidos to movimientos;

-- 6. Agregar las entidades:

-- ●Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
CREATE TABLE productos (
id_productos INT UNSIGNED,
nombre VARCHAR(30) NOT NULL,
descripcion varchar(100) NOT NULL,
id_marca INT UNSIGNED NOT NULL,
FOREIGN KEY (id_marca) REFERENCES marcas(id),
stock varchar(100),
precio varchar(100),
estado boolean,
tms timestamp 
);
-- ●Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
CREATE TABLE marcas (
id_marca INT UNSIGNED,
nombre VARCHAR(30) NOT NULL,
descripcion varchar(100) NOT NULL,
id_proveedor INT UNSIGNED NOT NULL,
estado boolean,
tms timestamp
);
-- ●Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),
-- cuit,id_localidad fk, estado,tms)
CREATE TABLE Proveedores (
id_Proveedor INT UNSIGNED,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
naturaleza VARCHAR(30) NOT NULL,
cuit VARCHAR(30) NOT NULL,
razon_social varchar (100),
id_localidad INT UNSIGNED NOT NULL,
FOREIGN KEY (id_localidad) REFERENCES localidades(id),
estado boolean,
tms timestamp
);
-- ●Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
CREATE TABLE cajas (
id_caja INT UNSIGNED,
horainicio datetime,
horacierre datetime, 
estado boolean,
tms timestamp
);
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
-- Un proveedor está en una localidad.

-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
-- secuencialmente y no fallar.

insert into productos values ("01","repelente","repelente para insectos","01","20","70","true","2020-01-09 03:14:07");
insert into productos values ("02","desodorante de ambiente","desodorante de ambiente","02","15","50","true",'2038-01-09 03:15:07');
insert into productos values ("03","cafe","infusion a base de cafe","03","30","80","true","");
insert into productos values ("04","azucar","producto alimenticio","04","26","35","true","" );
insert into productos values ("05","chocolate","producto alimenticio","05","12","70","true","");

insert into marcas values ("01","off","repelente","01","true","");
insert into marcas values ("02","glade","aromatisante","02","true","");
insert into marcas values ("03","nestcafe","alimento",03,"true","");
insert into marcas values ("04","ledezma","alimento","04","true","");
insert into marcas values ("05","milkaut","alimento","05","true","");

insert into proveedores values ("01","juan","sotelo","fisica","15-12.951-987-4","proveedor1","01","true","");
insert into proveedores values ("01","pedro","baez","juridica","65-65.987.548-8","proveedor2","02","true","");
insert into proveedores values ("01","cintia","lopez","fisica","22-32-654.852-8","proveedor3","03","true","");
insert into proveedores values ("01","carlos","perez","juridica","25-65.954.951-9","proveedor4","04","true","");
insert into proveedores values ("01","laura","martinez","fisica","32-15.321.999-9","proveedor5","05","true","");

insert into cajas values ("01","2020-01-09","2020-06-09","true"," ");
insert into cajas values ("02","2020-01-09","2020-05-09","true"," ");
insert into cajas values ("03","2020-01-09","2020-03-09","true"," ");
insert into cajas values ("04","2020-01-09","2020-09-09","true"," ");
insert into localidades values ("05","2020-01-09","2020-07-09","true"," ");

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.

select nombre, presupuesto, gastos from departamentos  where  estado = "1" and (select sum(presupuesto) - sum(gasto) where  estado = "1");

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre
-- del pais y el nombre de la localidad

select L.nombre, P.nombre from localidades L, paises P where L.id=P.id_localidad;

-- 10. Modificar (UPADTE):
-- ●el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ●el fecha_ingreso y la localidad de otro empleado.

UPDATE empleados
SET telefono = 3764-263963
WHERE id_empleado = id_cliente;

UPDATE empleados
SET fecha_ingreso = "2020-12-01"
WHERE id_empleado = id_cliente ;
