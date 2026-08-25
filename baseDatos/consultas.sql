------------------------------------------------------------------------------
------------------------------CONSULTAS BASICAS---------------------------
------------------------------------------------------------------------------

--Ejercicio 1: Muestra todos los datos de la tabla clientes.
SELECT * FROM clientes;
--Ejercicio 2: Muestra únicamente el nombre y el precio de venta actual de todos los productos.
SELECT nombre, precio_venta_actual FROM productos;
--Ejercicio 3: Obtén el nombre, la descripción y el stock mínimo de alerta de los productos.
SELECT nombre, descripcion, stock_minimo_alerta FROM productos;
--Ejercicio 4: Muestra el nombre completo, cargo y correo de todos los empleados.
SELECT nombre_completo, cargo, correo FROM empleados;


--Ejercicio 1: Muestra todos los clientes que estén activos.
SELECT * FROM clientes WHERE activo = TRUE;
--Ejercicio 2: Muestra los productos cuyo precio sea mayor a 25.
SELECT * FROM productos WHERE precio_venta_actual > 25;
--Ejercicio 3: Muestra los empleados cuyo cargo sea 'Cajero'.
SELECT * FROM empleados WHERE cargo='Cajero';
--Ejercicio 4: Muestra las promociones cuyo porcentaje de descuento sea mayor a 20.
SELECT * FROM promociones WHERE porcentaje_descuento > 20;


--Ejercicio 1: Ordena los productos por nombre de forma ascendente.
SELECT * FROM productos ORDER BY nombre ASC;
--Ejercicio 2: Ordena los productos por precio de venta de mayor a menor.
SELECT * FROM productos ORDER BY precio_venta_actual DESC;
--Ejercicio 3: Ordena los empleados por fecha de contratación, desde el más antiguo hasta el más reciente.
SELECT * FROM empleados ORDER BY fecha_contratacion ASC;
--Ejercicio 4: Ordena los clientes por nombre completo de forma descendente.
SELECT * FROM clientes ORDER BY nombre_completo DESC;


--Ejercicio 1: Muestra los primeros 5 clientes.
SELECT * FROM clientes LIMIT 5;
--Ejercicio 2: Muestra los primeros 10 productos.
SELECT * FROM productos LIMIT 10;
--Ejercicio 3: Obtén las primeras 3 facturas.
SELECT * FROM facturas LIMIT 3;
--Ejercicio 4: Muestra los primeros 8 proveedores.
SELECT * FROM proveedores LIMIT 8;


--Ejercicio 1: Cuenta cuántos productos hay por categoría.
SELECT id_categoria, count(id_producto) as "Cantidad de productos por categoria" FROM productos  GROUP BY id_categoria;
--Ejercicio 2: Cuenta cuántos empleados existen por cargo.
SELECT cargo, COUNT(id_empleado) as "Cantidad de empleados por cargo" FROM empleados GROUP BY cargo;
--Ejercicio 3: Cuenta cuántas facturas existen por sucursal.
SELECT id_sucursal, COUNT(id_factura) as "Cantidad de facturas por sucursal" FROM facturas GROUP BY id_sucursal;
--Ejercicio 4: Cuenta cuántos productos hay registrados en cada sucursal dentro de la tabla inventarios.
SELECT id_sucursal, COUNT(id_producto) as "Cantidad de productos por categoria en la tabla inventarios" FROM inventarios GROUP BY id_sucursal;


--Ejercicio 1: Muestra los cargos que tengan más de 2 empleados.
SELECT cargo, COUNT(*) as "Total"
FROM empleados 
GROUP BY cargo
HAVING  COUNT(*) >2;
--Ejercicio 2: Muestra las categorías que tengan más de 5 productos.
SELECT id_categoria, COUNT(*) as "Total"
FROM productos
GROUP BY id_categoria
HAVING COUNT(*) > 5;
--Ejercicio 3: Muestra las sucursales que tengan más de 20 productos en inventario.
SELECT id_sucursal,
       COUNT(*) AS "Productos"
FROM inventarios
GROUP BY id_sucursal
HAVING COUNT(*) > 20;
--Ejercicio 4: Muestra los clientes que tengan más de una factura registrada.
SELECT id_cliente, COUNT(*) as "Total"
FROM facturas
GROUP BY id_cliente
HAVING COUNT(*) > 1;


--Ejercicio 1:  Muestra el nombre del producto y crea una columna llamada Estado, donde:
--1.	Si el precio es mayor a 100 → "Caro" 
--2.	En caso contrario → "Económico" 
SELECT nombre,
	CASE
		WHEN precio_venta_actual > 100 THEN 'CARO'
		ELSE 'ECONOMICO'
	END AS "Estado"
FROM productos;

--Ejercicio 2: Muestra el nombre del empleado y clasifica su estado:
--1.	activo = TRUE → "Activo" 
--2.	activo = FALSE → "Inactivo" 
SELECT nombre_completo, activo,
	CASE
		WHEN activo = TRUE THEN 'Activo'
		ELSE 'Inactivo'
	END AS "Estado"
FROM empleados;

--Ejercicio 3: Muestra el nombre de la promoción y clasifica:
--1.	porcentaje_descuento >= 50 → "Descuento Alto" 
--2.	porcentaje_descuento >= 20 → "Descuento Medio" 
--3.	En otro caso → "Descuento Bajo" 
SELECT nombre_campana,
	 CASE 
	 	WHEN porcentaje_descuento >=50 THEN 'Descuento Alto'
		WHEN porcentaje_descuento >=20 THEN 'Descuento Medio'
		ELSE 'Descuento Bajo' 
	END AS "Descuentos"
FROM promociones;

--Ejercicio 4: Muestra el número de factura y crea una columna que indique:
--1.	total_pagar > 500 → "Compra Grande" 
--2.	En otro caso → "Compra Normal" 
SELECT numero_factura,
	CASE
		WHEN total_pagar > 500 THEN 'Compra grande'
		ELSE 'Compra normal'
	END AS "Compra"
FROM facturas;


--"Quiero ver cuántos productos tenemos catalogados como 'CARO' y cuántos como 'ECONOMICO'" 
SELECT 
    CASE
        WHEN precio_venta_actual > 25 THEN 'CARO'
        ELSE 'ECONOMICO'
    END AS "Clasificacion",
    COUNT(*) AS "Total_Productos"
FROM productos
GROUP BY 
    CASE
        WHEN precio_venta_actual > 25 THEN 'CARO'
        ELSE 'ECONOMICO'
    END;

-- la tabla empleados con las columnas nombre, departamento y salario.

--El Reto: Clasificación de Nómina
--cuánto dinero se gasta en salarios (es decir, la suma de los sueldos) dividiendo a los empleados en tres categorías según lo que ganan:

--Si el salario es mayor a 3000 → 'Sueldo Alto'
--Si el salario está entre 1500 y 3000 (inclusive) → 'Sueldo Medio'
--En cualquier otro caso (menor a 1500) → 'Sueldo Bajo'

SELECT 
    CASE
        WHEN salario > 3000 THEN 'Sueldo Alto'
        WHEN salario BETWEEN 1500 AND 3000 THEN 'Sueldo Medio'
        ELSE 'Sueldo Bajo'
    END AS "Categoria_Sueldo", -- <-- ¡Cerramos con END y agregamos la coma!
    SUM(salario) AS "Dinero total gastado"
FROM empleados
GROUP BY 1;


--Ejercicio 1: Muestra los distintos cargos registrados en la tabla empleados.
SELECT DISTINCT cargo FROM empleados;
--Ejercicio 2: Muestra los distintos métodos de pago registrados.
SELECT DISTINCT nombre FROM metodos_pago;
--Ejercicio 3: Muestra los distintos estados de los despachos.
SELECT DISTINCT estado FROM despachos_sucursales;
--Ejercicio 4: Muestra los distintos usuarios que aparecen como creado_por en la tabla productos.
SELECT DISTINCT creado_por FROM productos;


--Ejercicio 1: Cuenta el número total de clientes.
SELECT COUNT(*) AS "Total de clientes" FROM clientes;
--Ejercicio 2: Obtén el precio más alto de los productos.
SELECT MAX(precio_venta_actual) AS "Precio mas alto" FROM productos;
--Ejercicio 3: Calcula el precio promedio de todos los productos.
SELECT AVG(precio_venta_actual) AS "Promedio de precio" FROM productos;
--Ejercicio 4: Calcula la suma total del campo total_pagar de todas las facturas.
SELECT SUM(total_pagar) AS "Total a pagar de todas las facturas" FROM facturas;


--Muestra los 5 productos más caros. 
SELECT nombre, precio_venta_actual AS "Precio_mayor"
FROM productos
ORDER BY precio_venta_actual DESC
LIMIT 5;

--Cuenta cuántos productos hay por categoría y muestra únicamente las categorías con más de 10 productos. 
SELECT id_categoria, COUNT(*) as "Mas de 10 productos"
FROM productos
GROUP BY id_categoria 
HAVING COUNT(*) > 10;

--Muestra el nombre del producto, su precio y una columna que indique "Premium" si cuesta más de 80 y "Normal" en caso contrario. 
SELECT nombre, precio_venta_actual,
	CASE
		WHEN precio_venta_actual > 80 THEN 'Premium'
		ELSE 'Normal'
	END AS "Producto"
FROM productos;

--Muestra los distintos cargos de empleados ordenados alfabéticamente. 
SELECT DISTINCT (cargo) 
FROM empleados 
ORDER BY cargo ASC;

--Obtén el promedio del precio de los productos activos.
SELECT AVG(precio_venta_actual) AS "Promedio productos activos" 
FROM productos
WHERE activo = 'TRUE';


----------------------------------------------------------------------------------
------------------------------CONSULTAS INTERMEDIAS-------------------------------
----------------------------------------------------------------------------------
-- 	INNER JOIN 
--Ejercicio 1: Muestra el nombre del producto, el precio de venta y el nombre de la categoría a la que pertenece.
SELECT p.nombre, p.precio_venta_actual, c.nombre 
FROM productos p 
INNER JOIN categorias c 
ON c.id_categoria = p.id_categoria;

--Ejercicio 2: Muestra el número de factura, la fecha de emisión y el nombre completo del cliente.
SELECT f.numero_factura, f.fecha_emision, c.nombre_completo
FROM facturas f
INNER JOIN clientes c
ON c.id_cliente = f.id_cliente

--Ejercicio 3: Muestra el nombre del producto, la cantidad vendida y el precio unitario histórico de cada detalle de factura.
SELECT p.nombre, df.cantidad, df.precio_unitario_historico
FROM productos p
INNER JOIN detalles_facturas df
ON p.id_producto = df.id_producto;
Ejercicio 4: Muestra el nombre del usuario del sistema, el rol y el nombre completo del empleado al que pertenece.
SELECT us.username, us.rol, e.nombre_completo
FROM usuarios_sistema us
INNER JOIN empleados e
ON e.id_empleado = us.id_empleado;

--LEFT JOIN
--Ejercicio 1: Muestra todos los clientes y, si tienen una tarjeta de fidelización, muestra también el código de su tarjeta.
SELECT c.*, tf.codigo_tarjeta
FROM clientes c
LEFT JOIN tarjetas_fidelizacion tf
ON c.id_cliente = tf.id_cliente;

--Ejercicio 2: Muestra todas las categorías junto con los productos que pertenecen a cada una, incluyendo las categorías que no tengan productos.
SELECT c.nombre AS "Categoria", p.nombre AS "Producto"
FROM categorias c
LEFT JOIN productos p
ON c.id_categoria = p.id_categoria;

--Ejercicio 3: Muestra todos los productos y, si tienen promociones asignadas, muestra el nombre de la campaña.
SELECT p.nombre, pr.nombre_campana
FROM productos p
LEFT JOIN productos_promociones pp
ON p.id_producto = pp.id_producto
LEFT JOIN promociones pr
ON pr.id_promocion = pp.id_promocion;

--Ejercicio 4: Muestra todas las sucursales y los inventarios registrados en cada una, incluso si alguna sucursal no tiene inventario.
SELECT s.nombre, i.id_inventario
FROM sucursales s
LEFT JOIN inventarios i
ON s.id_sucursal = i.id_sucursal;

--RIGHT JOIN
--Ejercicio 1: Muestra todos los clientes y sus facturas, incluyendo aquellos clientes que todavía no tengan ninguna factura.
SELECT c.nombre_completo, f.numero_factura
FROM facturas f
RIGHT JOIN clientes c
ON f.id_cliente = c.id_cliente;

--Ejercicio 2: Muestra todas las categorías y los productos relacionados, usando RIGHT JOIN.
SELECT c.nombre AS "Categoria", p.nombre AS "Producto"
FROM productos p
RIGHT JOIN categorias c
ON p.id_categoria = c.id_categoria;

--Ejercicio 3: Muestra todos los empleados y sus usuarios del sistema, incluyendo empleados que aún no tengan usuario.
SELECT e.nombre_completo, u.username
FROM usuarios_sistema u
RIGHT JOIN empleados e
ON u.id_empleado = e.id_empleado;

--Ejercicio 4: Muestra todos los productos y sus promociones utilizando RIGHT JOIN.
SELECT p.nombre, pr.nombre_campana
FROM productos p
RIGHT JOIN productos_promociones pp
ON p.id_producto = pp.id_producto
RIGHT JOIN promociones pr
ON pr.id_promocion = pp.id_promocion;

--FULL JOIN 
--Ejercicio 1: Muestra todos los clientes y todas las tarjetas de fidelización, incluso si alguno no tiene relación con el otro.
SELECT c.nombre_completo, t.codigo_tarjeta
FROM tarjetas_fidelizacion t
FULL JOIN clientes c
ON t.id_cliente = c.id_cliente;

--Ejercicio 2: Muestra todas las categorías y todos los productos, existan o no relaciones entre ellos.
SELECT c.nombre, p.nombre
FROM categorias c
FULL JOIN productos p
ON c.id_categoria = p.id_categoria;

--Ejercicio 3: Muestra todos los empleados y todos los usuarios del sistema.
SELECT e.nombre_completo, u.username
FROM empleados e
FULL JOIN usuarios_sistema u
ON e.id_empleado = u.id_empleado;

--Ejercicio 4: Muestra todos los productos y todas las promociones.
SELECT p.nombre, pr.nombre_campana
FROM productos p
FULL JOIN productos_promociones pp
ON p.id_producto = pp.id_producto
FULL JOIN promociones pr
ON pr.id_promocion = pp.id_promocion;	

--Subconsultas 
--Ejercicio 1: Muestra los productos cuyo precio sea mayor que el precio promedio de todos los productos.
SELECT nombre, precio_venta_actual
FROM productos
WHERE precio_venta_actual > (
    SELECT AVG(precio_venta_actual) 
    FROM productos
);

--Ejercicio 2: Muestra los clientes que hayan realizado la factura con el monto más alto.
SELECT c.nombre_completo, f.numero_factura, f.total_pagar
FROM facturas f
INNER JOIN clientes c ON f.id_cliente = c.id_cliente
WHERE f.total_pagar = (
    SELECT MAX(total_pagar)
    FROM facturas
);

--Ejercicio 3: Muestra los empleados cuya fecha de contratación sea la más antigua.
SELECT nombre_completo, fecha_contratacion
FROM empleados
WHERE fecha_contratacion = (
      SELECT MIN(fecha_contratacion)
      FROM empleados
);

--Ejercicio 4: Muestra los productos cuyo precio sea igual al precio más alto registrado.
SELECT nombre, precio_venta_actual
FROM productos
WHERE precio_venta_actual = (
      SELECT MAX(precio_venta_actual)
      FROM productos
);

--EXISTS 
--Ejercicio 1: Muestra los clientes que tengan al menos una factura registrada.
SELECT c.nombre_completo, c.correo_electronico
FROM clientes c
WHERE EXISTS (
    SELECT 1 
    FROM facturas f
    WHERE f.id_cliente = c.id_cliente 
);

--Ejercicio 2: Muestra las categorías que tengan al menos un producto.
SELECT c.nombre
FROM categorias c
WHERE EXISTS (
      SELECT 1
      FROM productos p
      WHERE p.id_categoria = c.id_categoria
);

--Ejercicio 3: Muestra las sucursales que tengan inventario registrado.
SELECT s.nombre
FROM  sucursales s
WHERE EXISTS (
        SELECT 1
        FROM inventarios i
        WHERE i.id_sucursal = s.id_sucursal
);

--Ejercicio 4: Muestra los productos que hayan sido vendidos al menos una vez.
SELECT p.nombre
FROM  productos p
WHERE EXISTS (
      SELECT 1
      FROM detalles_facturas d
      WHERE d.id_producto = p.id_producto
);


--IN 
--Ejercicio 1: Muestra los productos cuya categoría sea 1, 3 o 5.
SELECT * 
FROM productos
WHERE id_categoria IN (1,3,5);

--Ejercicio 2: Muestra las facturas realizadas en las sucursales 2, 4 y 6.
SELECT *
FROM facturas
WHERE id_sucursal IN (2,4,6);

--Ejercicio 3: Muestra los empleados cuyo cargo sea "Cajero", "Administrador" o "Supervisor".
SELECT *
FROM empleados
WHERE cargo IN ('Cajero', 'Admistrador', 'Supervisor');

--Ejercicio 4: Muestra las promociones cuyo porcentaje de descuento sea 10, 20 o 50.
SELECT *
FROM promociones
WHERE porcentaje_descuento IN (10,20,50);


--ANY 
--Ejercicio 1: Muestra los productos cuyo precio sea mayor que el precio de al menos un producto de la categoría 1.
SELECT nombre, precio_venta_actual
FROM productos
WHERE precio_venta_actual > ANY (
    SELECT precio_venta_actual
    FROM productos
    WHERE id_categoria = 1
);

--Ejercicio 2: Muestra las facturas cuyo total a pagar sea mayor que alguna factura emitida en la sucursal 2.
SELECT numero_factura, id_sucursal, total_pagar
FROM facturas
WHERE total_pagar > ANY (
	SELECT total_pagar
	FROM facturas 
	WHERE id_sucursal = 2
);

--Ejercicio 3: Muestra los productos cuyo precio sea menor que algún producto de la categoría 3.
SELECT nombre, precio_venta_actual, id_categoria
FROM productos
WHERE precio_venta_actual < ANY (
	SELECT precio_venta_actual
	FROM productos
	WHERE id_categoria = 3
);

--Ejercicio 4: Muestra las promociones cuyo porcentaje sea mayor que algún descuento existente.
SELECT nombre_campana, porcentaje_descuento
FROM promociones
WHERE  porcentaje_descuento > ANY (
	SELECT monto_descuento_fijo
	FROM promociones
);
 	
--ALL 
--Ejercicio 1: Muestra los productos cuyo precio sea mayor que todos los productos de la categoría 2.
SELECT nombre, precio_venta_actual, id_categoria
FROM productos
WHERE precio_venta_actual > ALL (
	SELECT precio_venta_actual
	FROM productos
	WHERE id_categoria =2
);

--Ejercicio 2: Muestra las facturas cuyo total sea mayor que todas las facturas emitidas en la sucursal 1.
SELECT numero_factura, total_pagar, id_sucursal
FROM facturas
WHERE total_pagar > ALL (
	SELECT total_pagar
	FROM facturas
	WHERE id_sucursal = 1
);

--Ejercicio 3: Muestra los productos cuyo precio sea menor que todos los productos de la categoría 5.
SELECT nombre, precio_venta_actual, id_categoria
FROM productos
	WHERE precio_venta_actual < ALL (
	SELECT precio_venta_actual
	FROM productos
	WHERE id_categoria = 5
	);
	
--Ejercicio 4: Muestra las promociones cuyo porcentaje de descuento sea mayor que todos los descuentos menores a 30%.
SELECT nombre_campana, porcentaje_descuento
FROM promociones
WHERE porcentaje_descuento > ALL (
	SELECT porcentaje_descuento
	FROM promociones
	WHERE porcentaje_descuento < 30
);

	 
--UNION 
--Ejercicio 1: Muestra una lista con los nombres de todos los clientes y todos los empleados, eliminando duplicados.
SELECT nombre_completo
FROM clientes
UNION 
SELECT nombre_completo 
FROM empleados;

--Ejercicio 2: Muestra todos los correos electrónicos de clientes y proveedores sin repetir valores.
SELECT correo_electronico
FROM clientes
UNION 
SELECT correo
FROM proveedores;

--Ejercicio 3: Muestra todas las direcciones registradas en clientes y sucursales.
SELECT direccion
FROM clientes
UNION 
SELECT direccion 
FROM sucursales;

--Ejercicio 4: Muestra todos los teléfonos registrados en clientes y empleados.
SELECT telefono
FROM clientes
UNION 
SELECT telefono 
FROM empleados;


--UNION ALL 
--Ejercicio 1: Muestra todos los nombres de clientes y empleados, permitiendo registros repetidos.
SELECT nombre_completo
FROM clientes
UNION ALL
SELECT nombre_completo 
FROM empleados;

--Ejercicio 2: Muestra todos los teléfonos de clientes y proveedores, incluyendo duplicados.
SELECT telefono
FROM clientes
UNION ALL
SELECT telefono 
FROM proveedores;

--Ejercicio 3: Muestra todos los correos de empleados y proveedores.
SELECT correo
FROM empleados
UNION ALL
SELECT correo
FROM proveedores;

--Ejercicio 4: Muestra todas las direcciones de clientes y proveedores.
SELECT direccion
FROM clientes
UNION ALL
SELECT direccion 
FROM proveedores;

--CTE (WITH) 
--Ejercicio 1: Crea una CTE llamada productos_caros que contenga los productos con precio mayor a 25 y luego muestra todos sus datos.
WITH productos_caros AS (
    SELECT nombre, precio_venta_actual
    FROM productos
    WHERE precio_venta_actual > 25
)
SELECT *
FROM productos_caros;

--Ejercicio 2: Crea una CTE que calcule el total de facturas por cliente y muestra únicamente aquellos clientes con más de 5 facturas.
WITH total_facturas AS (
	SELECT id_cliente, COUNT(id_factura) as "total"
	FROM facturas
	GROUP BY id_cliente
)
SELECT *
FROM total_facturas
WHERE total > 5;

--Ejercicio 3: Crea una CTE que calcule el promedio del precio de los productos y luego muestra los productos cuyo precio sea superior a ese promedio.
WITH promedio_general AS (
    SELECT AVG(precio_venta_actual) AS promedio
    FROM productos
)
SELECT p.nombre, p.precio_venta_actual
FROM productos p, promedio_general pg
WHERE p.precio_venta_actual > pg.promedio;

--Ejercicio 4: Crea una CTE que cuente cuántos productos existen por categoría y muestra únicamente las categorías con más de 10 productos.
WITH productos_categoria AS(
	SELECT id_categoria, COUNT(*) as "total_productos"	
	FROM productos
	GROUP BY id_categoria
	)
SELECT id_categoria, total_productos
FROM productos_categoria
WHERE total_productos > 10;

----------------------------------------------------------------------------------
------------------------------CONSULTAS AVANZADAS---------------------------------
----------------------------------------------------------------------------------
-- 	ROW_NUMBER 
--Ejercicio 1: Numera todos los productos ordenados por precio de venta, del más caro al más barato.
SELECT nombre, precio_venta_actual,
ROW_NUMBER() OVER (
    ORDER BY precio_venta_actual DESC
) AS posicion
FROM productos;

--Ejercicio 2: Numera las facturas de cada cliente según la fecha de emisión, comenzando desde 1 para cada cliente.
SELECT id_cliente, numero_factura, fecha_emision,
    ROW_NUMBER() OVER (
        PARTITION BY id_cliente         
        ORDER BY fecha_emision ASC       
    ) AS numeracion
FROM facturas;

--Ejercicio 3: Numera los productos dentro de cada categoría ordenándolos por nombre.
SELECT id_producto, nombre, id_categoria,
	ROW_NUMBER() OVER (
		PARTITION BY id_categoria
		ORDER BY nombre ASC
	) AS numeracion
FROM productos;

--Ejercicio 4: Numera los empleados según su fecha de contratación, del más antiguo al más reciente.
SELECT nombre_completo, fecha_contratacion,
	ROW_NUMBER() OVER(
		ORDER BY fecha_contratacion ASC
	) AS numeracion_empleados
FROM empleados;

--Ejercicio 5: Numera las compras realizadas por cada proveedor ordenadas por fecha de compra.
SELECT id_compra, fecha_compra, id_proveedor,
	ROW_NUMBER() OVER(
		PARTITION BY id_proveedor
		ORDER BY fecha_compra ASC
	) AS compras_realizadas
FROM compras;


-- 	RANK
--Ejercicio 1: Asigna un ranking a los productos según su precio, del mayor al menor.
SELECT 
    id_producto, nombre, precio_venta_actual,
    RANK() OVER (
        ORDER BY precio_venta_actual DESC
    ) AS ranking
FROM productos;

--Ejercicio 2: Obtén el ranking de las facturas según el total a pagar.
SELECT
	numero_factura, total_pagar,
	RANK() OVER (
		ORDER BY total_pagar DESC
	) AS ranking_facturas
FROM facturas;

--Ejercicio 3: Asigna un ranking a los clientes según la cantidad de facturas que poseen.
SELECT 
    id_cliente,
    COUNT(*) AS cantidad_facturas,
    RANK() OVER (
        ORDER BY COUNT(*) DESC 
    ) AS ranking_clientes
FROM facturas
GROUP BY id_cliente;

--Ejercicio 4: Obtén el ranking de las promociones según el porcentaje de descuento.
SELECT 
    id_promocion,
    nombre_campana,
    porcentaje_descuento,
    RANK() OVER (
        ORDER BY porcentaje_descuento DESC
    ) AS ranking_promociones
FROM promociones;

--Ejercicio 5: Asigna un ranking a las sucursales según el total de productos registrados en inventario.
SELECT 
    id_sucursal,
    SUM(stock_actual) AS total_inventario,
    RANK() OVER (
        ORDER BY SUM(stock_actual) DESC 
    ) AS ranking_sucursales
FROM inventarios
GROUP BY id_sucursal;

-- 	DENSE_RANK 
--Ejercicio 1: Asigna un ranking sin saltos a los productos según el precio.
SELECT id_producto, nombre, precio_venta_actual,
	DENSE_RANK() OVER(
		ORDER BY 	precio_venta_actual DESC
	) AS sin_saltos
FROM productos;

--Ejercicio 2: Clasifica las promociones según su descuento utilizando DENSE_RANK.
SELECT id_promocion, nombre_campana, porcentaje_descuento,
	DENSE_RANK() OVER (
		ORDER BY porcentaje_descuento DESC
	)AS descuento
FROM promociones;

--Ejercicio 3: Obtén un ranking de clientes según el número de facturas.
SELECT  id_cliente, count(*),
	DENSE_RANK() OVER(
		ORDER BY count(*) DESC
	) AS factura
FROM facturas
GROUP BY id_cliente;

--Ejercicio 4: Clasifica las categorías según la cantidad de productos.
SELECT id_categoria, COUNT(*),
	DENSE_RANK() OVER(
	ORDER BY COUNT(*) DESC
	)AS clasificacion
FROM productos
GROUP BY id_categoria;

--Ejercicio 5: Obtén un ranking de proveedores según el número de compras realizadas.
SELECT id_proveedor, COUNT(*),
	DENSE_RANK() OVER(
	ORDER BY COUNT(*) DESC
	)AS proveedoresRANK
FROM compras
GROUP BY id_proveedor;

-- 	LAG 
--Ejercicio 1: Para cada factura, muestra el total a pagar y el total de la factura inmediatamente anterior.
SELECT id_factura, numero_factura, total_pagar,
LAG(total_pagar, 1, 0) OVER (
    ORDER BY id_factura ASC
) AS facturaAnterior
FROM facturas;

--Ejercicio 2: Para cada compra de un proveedor, muestra la fecha de compra anterior.
SELECT id_compra, id_proveedor, fecha_compra,
LAG(fecha_compra, 1) OVER (
	PARTITION BY id_proveedor
    ORDER BY  fecha_compra ASC
) AS fechaAnterior
FROM compras;

--Ejercicio 3: Para cada producto ordenado por precio, muestra el precio del producto anterior.
SELECT 
    id_producto, nombre, precio_venta_actual,
    LAG(precio_venta_actual, 1, 0) OVER (
        ORDER BY precio_venta_actual ASC
    ) AS precio_producto_anterior
FROM productos;

--Ejercicio 4: Para cada empleado ordenado por fecha de contratación, muestra la fecha del empleado contratado anteriormente.
SELECT 
    id_empleado, nombre_completo, fecha_contratacion,
    LAG(fecha_contratacion, 1) OVER (
        ORDER BY fecha_contratacion ASC
    ) AS fecha_contratacion_anterior
FROM empleados;

--Ejercicio 5: Para cada promoción ordenada por fecha de inicio, muestra la promoción anterior.
SELECT 
    id_promocion, nombre_campana, fecha_inicio,
    LAG(nombre_campana, 1) OVER (
        ORDER BY fecha_inicio ASC
    ) AS promocion_anterior
FROM promociones;

-- 	LEAD
--Ejercicio 1: Muestra el total de cada factura y el total de la siguiente factura.
SELECT 
	id_factura, total_pagar,
	LEAD(total_pagar, 1, 0) OVER(
		ORDER BY id_factura ASC
	) AS Total
FROM facturas;

--Ejercicio 2: Muestra cada compra junto con la fecha de la siguiente compra del mismo proveedor.
SELECT 
    id_compra, id_proveedor, fecha_compra,
    LEAD(fecha_compra, 1) OVER (
        PARTITION BY id_proveedor 
        ORDER BY fecha_compra ASC
    ) AS siguiente_fecha_compra
FROM compras;

--Ejercicio 3: Para cada producto, muestra el precio del siguiente producto ordenado por precio.
SELECT 
    id_producto,
    nombre,
    precio_venta_actual,
    LEAD(precio_venta_actual, 1, 0) OVER (
        ORDER BY precio_venta_actual ASC
    ) AS siguiente_precio
FROM productos;

--Ejercicio 4: Muestra cada promoción junto con la fecha de inicio de la siguiente promoción.
SELECT 
    id_promocion,
    nombre_campana,
    fecha_inicio,
    LEAD(fecha_inicio, 1) OVER (
        ORDER BY fecha_inicio ASC
    ) AS siguiente_fecha_inicio
FROM promociones;

--Ejercicio 5: Para cada empleado, muestra la fecha de contratación del siguiente empleado.
SELECT 
    id_empleado,
    nombre_completo,
    fecha_contratacion,
    LEAD(fecha_contratacion, 1) OVER (
        ORDER BY fecha_contratacion ASC
    ) AS siguiente_fecha_contratacion
FROM empleados;


-- 	OVER 
--Ejercicio 1: Muestra cada producto junto con el precio promedio de todos los productos.
SELECT 
    id_producto,
    nombre,
    precio_venta_actual,
    AVG(precio_venta_actual) OVER () AS precio_promedio_global
FROM productos;

--Ejercicio 2: Muestra cada factura junto con el total acumulado de ventas.
SELECT 
    id_factura,
    fecha_emision,
    total_pagar,
    SUM(total_pagar) OVER (
        ORDER BY fecha_emision ASC -- 👈 Va sumando en orden cronológico
    ) AS total_ventas_acumulado
FROM facturas;

--Ejercicio 3: Muestra cada producto junto con el precio máximo existente en toda la tabla.
SELECT 
    id_producto,
    nombre,
    precio_venta_actual,
    MAX(precio_venta_actual) OVER () AS precio_maximo_global
FROM productos;

--Ejercicio 4: Muestra cada compra junto con el promedio del total pagado.
SELECT 
    id_compra,
    total_pagado,
    AVG(total_pagado) OVER () AS promedio_compras_global
FROM compras;

--Ejercicio 5: Muestra cada empleado junto con la cantidad total de empleados.
SELECT 
    id_empleado,
    nombre_completo,
    COUNT(*) OVER () AS total_empleados_empresa
FROM empleados;



--8. CONSULTAS ANALÍTICAS 
--Ejercicio 1: Para cada factura muestra:
--•	Número de factura 
--•	Cliente 
--•	Total, a pagar 
--•	Promedio de compra del cliente 
--•	Diferencia entre esa factura y el promedio del cliente. 
SELECT 
    numero_factura,
    id_cliente,
    total_pagar,
    -- 1. Promedio de compras de ESTE cliente:
    AVG(total_pagar) OVER (
        PARTITION BY id_cliente
    ) AS promedio_cliente,
    -- 2. Diferencia (Factura Actual - Promedio):
    total_pagar - AVG(total_pagar) OVER (
        PARTITION BY id_cliente
    ) AS diferencia_vs_promedio
FROM facturas;

--Ejercicio 2: Para cada producto muestra:
--•	Nombre 
--•	Precio 
--•	Ranking dentro de su categoría 
--•	Precio promedio de la categoría. 
SELECT 
    nombre,
    precio_venta_actual AS precio,
    -- 1. Ranking de precio dentro de su categoría:
    DENSE_RANK() OVER (
        PARTITION BY id_categoria 
        ORDER BY precio_venta_actual DESC
    ) AS ranking_categoria,
    -- 2. Precio promedio de la categoría:
    AVG(precio_venta_actual) OVER (
        PARTITION BY id_categoria
    ) AS promedio_categoria
FROM productos;


--Ejercicio 3: Para cada sucursal muestra:
--•	Producto 
--•	Stock 
--•	Stock total de la sucursal 
--•	Porcentaje que representa ese producto respecto al inventario total de la sucursal. 
SELECT 
    id_producto,
    id_sucursal,
    stock_actual AS stock,
    -- 1. Stock total acumulado en la sucursal:
    SUM(stock_actual) OVER (
        PARTITION BY id_sucursal
    ) AS stock_total_sucursal,
    -- 2. Porcentaje que representa respecto a la sucursal:
    ROUND(
        (stock_actual::numeric / SUM(stock_actual) OVER (PARTITION BY id_sucursal)) * 100, 
        2
    ) AS porcentaje_inventario
FROM inventarios;

--Ejercicio 4: Para cada proveedor muestra:
--•	Compra 
--•	Total, pagado 
--•	Compra anterior 
--•	Diferencia respecto a la compra anterior. 
SELECT 
    id_compra,
    id_proveedor,
    total_pagado,
    -- 1. Monto pagado en la compra anterior de este mismo proveedor:
    LAG(total_pagado, 1) OVER (
        PARTITION BY id_proveedor 
        ORDER BY fecha_compra ASC
    ) AS compra_anterior,
    -- 2. Diferencia respecto a la compra anterior:
    total_pagado - LAG(total_pagado, 1) OVER (
        PARTITION BY id_proveedor 
        ORDER BY fecha_compra ASC
    ) AS diferencia_compra_anterior
FROM compras;

--Ejercicio 5: Para cada cliente muestra:
--•	Número de facturas 
--•	Monto total comprado 
--•	Ranking de clientes por monto comprado 
--•	Porcentaje del total de ventas que representa ese cliente. 
SELECT 
    id_cliente,
    -- 1. Cantidad de facturas del cliente:
    COUNT(id_factura) AS numero_facturas,
    -- 2. Monto total comprado por el cliente:
    SUM(total_pagar) AS total_comprado,
    -- 3. Ranking de clientes por monto total comprado:
    DENSE_RANK() OVER (
        ORDER BY SUM(total_pagar) DESC
    ) AS ranking_cliente,
    -- 4. Porcentaje que representa sobre la venta total global de la empresa:
    ROUND(
        (SUM(total_pagar) / SUM(SUM(total_pagar)) OVER ()) * 100, 
        2
    ) AS porcentaje_ventas_global
FROM facturas
GROUP BY id_cliente;


 
------------------------------------------------------------------------
---------------------------------INDICES--------------------------------
------------------------------------------------------------------------

CREATE INDEX idx_clientes_nombre
ON clientes (nombre_completo);

CREATE INDEX idx_inventarios_productos
ON inventarios (id_producto);

CREATE INDEX idx_facturas_clientes_fecha
ON facturas (id_cliente, fecha_emision);

DROP INDEX idx_clientes_nombre;

-------------------------------------------------------------------------
--------------------------------EXPLAIN----------------------------------
-------------------------------------------------------------------------

EXPLAIN
SELECT *
FROM productos
WHERE nombre = 'Leche';

-------------------------------------------------------------------------
--------------------------------EXPLAIN ANALIZE--------------------------
-------------------------------------------------------------------------
EXPLAIN ANALYZE
SELECT *
FROM productos
WHERE nombre = 'Leche';




--Respaldo de la BD completa
--pg_dump -U postgres -d datamart360 -f backup_julio.sql


--Respaldo de tabla
--pg_dump -U postgres -d datamart360 -t clientes -f clientes.sql

--Respaldo de esquema
--pg_dump -U postgres -d datamart360 --schema-only -f esquema.sql


--Respaldo de datos
--pg_dump -U postgres -d datamart360 --data-only -f datos.sql

--Restaurar un respaldo
--psql -U postgres -d datamart360 -f backup.sql

--FORMATO PERSONALIZADOS, custom format (Es mas profesional, es mas rápido, comprime los datos y permite hacer restauraciones parciales)

--pg_dump -U postgres -d datamart360 -F c -f backup.backup

--Restaurarlo
--pg_restore -U postgres -d datamart360 backup.backup




























