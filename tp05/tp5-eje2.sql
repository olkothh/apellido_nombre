DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
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
id_cliente INT UNSIGNED NOT NULL,id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',
100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',
200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',
NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',
200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',
100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1','Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3','Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);

-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select fecha, cantidad from pedidos order by fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor
select * from pedidos order by cantidad desc limit 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinctrow id_cliente from pedidos where cantidad >0 order by id_cliente asc;
-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya
-- cantidad total sea superior a $500.
select cantidad, fecha from pedidos where fecha >= "2022-01-01" and cantidad > 500;

-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión
-- entre 0.05 y 0.11.
select nombre, apellido, comisión from vendedores where comisión between 0.05 and 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
select max(comisión) from vendedores limit 1;
select comisión from vendedores order by comisión desc limit 1;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
select id, nombre, apellido, cuitcuil from clientes where cuitcuil is not null;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado
-- alfabéticamente.
select nombre from clientes where nombre like "A%" or nombre like "P%" order by nombre asc;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá
-- estar ordenado alfabéticamente
select nombre from clientes where nombre not like "A%" order by nombre asc;

-- 10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en
-- cuenta que se deberán eliminar los nombres repetidos.
select nombre from vendedores where nombre like "%el" or nombre like "o";

-- 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
-- realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar
-- los elementos repetidos.
select distinct c.id,c.nombre,c.apellido from pedidos as p inner join clientes as c on c.id = p.id_cliente order by nombre asc; 
 
--  12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
--  debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
-- los clientes ordenados alfabéticamente.
select p.*, c.* FROM pedidos p INNER JOIN clientes c ON p.id_cliente = c.id ORDER BY c.nombre ASC;

-- 13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
-- resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
-- mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT p.*, v.* FROM pedidos p INNER JOIN vendedores v ON p.id_vendedor = v.id;
 
-- 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido.
SELECT c.*, p.*, v.* FROM clientes c INNER JOIN pedidos p ON c.id = p.id_cliente INNER JOIN vendedores v ON v.id = p.id_vendedor;

-- 15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo
-- monto esté entre $300 y $1000.
SELECT c.*, p.fecha FROM pedidos p INNER JOIN clientes c ON p.id_cliente = c.id WHERE fecha LIKE '%2022%' AND cantidad BETWEEN 300 AND 1000;

-- 16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
-- realizado por María Santana. 
SELECT v.nombre, v.apellido FROM vendedores v left JOIN clientes c 
ON v.id = c.id where c.nombre='María';
-- 17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor
-- Daniel Sáez.
SELECT c.nombre, c.apellido FROM clientes c left JOIN  vendedores v
ON c.id = v.id where v.nombre='Daniel';
-- 18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
select c.nombre, c.apellido, p.fecha, p.cantidad from clientes c left join pedidos p on c.id = p.id where p.cantidad >= 0  order by c.nombre, c.apellido asc;

-- 19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los vendedores que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los
-- vendedores.
select v.nombre, v.apellido, p.fecha, p.cantidad from vendedores v left join pedidos p on v.id = p.id where p.cantidad >= 0 
order by v.nombre, v.apellido asc;

-- 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
select c.apellido,c.nombre from pedidos p right join clientes c on p.id= c.id where p.id is null;

-- 21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún
-- pedido.
select v.nombre, v.apellido from vendedores v inner join pedidos p on v.id = p.id where p.cantidad =0;

-- 22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
-- el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.

select c.id,c.apellido,c.nombre,p.*from ventas.pedidos p right  join ventas.clientes c on p.id= c.id where p.id is null;

 select concat_ws(c.nombre, c.apellido) nombre_cliente,  concat_ws(v.nombre, v.apellido) nombre_vendedor  from clientes c inner join vendedores v  on c.id = v.id
 inner join pedidos p on c.id = p.id where p.cantidad = 0 order by  nombre_cliente, nombre_vendedor asc;

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(cantidad) as total from pedidos;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(cantidad) as total from pedidos;

-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
select count(*) from vendedores;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
select count(*) from clientes;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(cantidad) as max_cantidad from pedidos;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(cantidad) as min_cantidad from pedidos;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente.
select max(categoría) as max_categoría from clientes;

-- 30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
select s.nombre , p.fecha, max(cantidad) COMPRA_MAX 
from clientes s , pedidos p
where s.id = p.id_cliente
group by s.nombre , p.fecha;

-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de $2000 .
select s.nombre , p.fecha, max(cantidad) COMPRA_MAX 
from clientes s , pedidos p
where cantidad >="2000" and s.id = p.id_cliente
group by s.nombre , p.fecha;

-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
select v.id,v.apellido,v.nombre , p.fecha, max(cantidad) COMPRA_MAX 
from vendedores v , pedidos p
where v.id = p.id_cliente and p.fecha = "2021-08-17"
group by v.nombre , p.fecha;

-- 33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
select distinct c.id, c.nombre,c.apellido, count(p.cantidad) total from clientes c, pedidos p where c.id=p.id_cliente and p.cantidad >= "0"
group by c.id,c.nombre,c.apellido,p.cantidad;

select distinct c.id, c.nombre,c.apellido, count(*) total from clientes c, pedidos p where c.id=p.id_cliente 
group by c.id,c.nombre,c.apellido,p.cantidad;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020.
select c.id,c.nombre,c.apellido, count(p.cantidad) from pedidos p, clientes c  where year(p.fecha)=2020 and c.id=p.id_cliente 
group by c.id, c.nombre,c.apellido,p.cantidad;
 
-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select max(cantidad) total, fecha from pedidos where fecha between "2018-01-01" and "2022-12-12" 
group by fecha, cantidad;

-- 36.Devuelve el número total de pedidos que se han realizado cada año.
select count(cantidad) total, fecha from pedidos where fecha between "2018-01-01" and "2022-12-12" 
group by cantidad;

select count(*) total, fecha from pedidos where fecha between "2018-01-01" and "2022-12-12" 
group by cantidad;

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
select * from pedidos where id_cliente=(select id from clientes where nombre = "Adela" and apellido ="Salas");

-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáez. (Sin utilizar INNER JOIN)
select count(*)  from vendedores where id=(select id from vendedores where nombre="Daniel" and apellido="Sáez");

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select * from clientes where id=(select id_cliente from pedidos where cantidad=(select max(cantidad) from pedidos where year(fecha)=2020));

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

Select fecha, cantidad from clientes inner join pedidos on clientes.id = pedidos.id_cliente where clientes.nombre= 'Pepe' and apellido = 'Ruiz' and 
pedidos.cantidad = (select MIN(cantidad) from clientes inner join pedidos on clientes.id = pedidos.id_cliente where clientes.nombre = 'Pepe' and apellido= 'Ruiz');

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from clientes where id not in (select id_cliente from pedidos);

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from vendedores where id not in (select id_vendedor from pedidos);

-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from clientes where not exists (select id_cliente from pedidos where clientes.id = pedidos.id_cliente);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from vendedores where not exists (select id_vendedor from pedidos where vendedores.id = pedidos.id_vendedor);
