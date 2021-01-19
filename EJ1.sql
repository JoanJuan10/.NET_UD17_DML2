/* 1 */
SELECT nombre
FROM articulos;

/* 2 */
SELECT nombre, precio
FROM articulos;

/* 3 */
SELECT nombre
FROM articulos
WHERE PRECIO >= 200;

/* 4 */
SELECT *
FROM articulos
WHERE PRECIO BETWEEN 60 AND 120;

/* 5 */
SELECT nombre, precio*166.386 AS 'PRECIO (PESETAS)'
FROM articulos;

/* 6 */
SELECT AVG(Precio) AS 'Media de Precios'
FROM articulos;

/* 7 */
SELECT AVG(Precio) AS 'Media de Precios (FABRICANTE 2)'
FROM articulos
WHERE FABRICANTE = 2;

/* 8 */
SELECT COUNT(*)
FROM articulos
WHERE PRECIO >= 180;

/* 9 */
SELECT nombre, precio
FROM articulos
WHERE PRECIO >= 180
ORDER BY PRECIO DESC, NOMBRE;

/* 10 */
SELECT *
FROM articulos a
JOIN fabricantes f 
ON a.FABRICANTE = f.CODIGO;

/* 11 */
SELECT a.NOMBRE , a.PRECIO , f.NOMBRE
FROM articulos a
JOIN fabricantes f
ON a.FABRICANTE = f.CODIGO;

/* 12 */
SELECT AVG(PRECIO) AS 'Media Precio',f.CODIGO 
FROM articulos a
JOIN fabricantes f 
ON a.FABRICANTE = f.CODIGO 
GROUP BY f.CODIGO;

/* 13 */
SELECT AVG(PRECIO) AS 'Media Precio',f.NOMBRE 
FROM articulos a
JOIN fabricantes f 
ON a.FABRICANTE = f.CODIGO 
GROUP BY f.NOMBRE;

/* 14 */
SELECT f.NOMBRE 
FROM articulos a 
JOIN fabricantes f 
ON a.FABRICANTE = f.CODIGO 
GROUP BY f.NOMBRE 
HAVING AVG(a.PRECIO) >= 150;

/* 15 */
SELECT NOMBRE , PRECIO 
FROM articulos a 
WHERE precio = (SELECT MIN(PRECIO) FROM articulos);

/* 16 */
SELECT a.NOMBRE , a.PRECIO , f.NOMBRE 
FROM articulos a 
JOIN fabricantes f
ON f.CODIGO = a.FABRICANTE AND A.PRECIO = (
	SELECT MAX(Precio)
	FROM articulos
	WHERE FABRICANTE = F.CODIGO );

/* 17 */
INSERT INTO articulos (CODIGO,NOMBRE,PRECIO,FABRICANTE) VALUES (11,'Impresora 3D',300,2);

/* 18 */
UPDATE articulos SET FABRICANTE = 2 WHERE CODIGO = 8;

/* 19 */
UPDATE articulos SET PRECIO = PRECIO * 0.9;

/* 20 */
UPDATE articulos SET PRECIO = PRECIO - 10 WHERE PRECIO >= 120;