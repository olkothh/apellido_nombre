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
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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
ADD id_localidad INT UNSIGNED NOT NULL,
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

insert into departamentos values ("01","Obera","01");
insert into departamentos values ("01","Iguazu","02");
insert into departamentos values ("01","San Ignacio","03");
insert into departamentos values ("01","Eldorado","04");
insert into departamentos values ("01","Apostoles","05");

insert into localidades values ("01","25 de Mayo","01");
insert into localidades values ("02","Azara","02");
insert into localidades values ("03","Candelaria","03");
insert into localidades values ("04","Colonia Aurora","04");
insert into localidades values ("05","Cerro Cora","05");

-- 5 Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE

rename table pedidos to movimientos;

