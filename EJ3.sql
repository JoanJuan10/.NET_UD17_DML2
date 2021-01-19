/* 1 */
SELECT *
FROM almacenes;

/* 2 */
SELECT *
FROM cajas
WHERE VALOR > 150;

/* 3 */
SELECT DISTINCT CONTENIDO 
FROM cajas;

/* 4 */
SELECT AVG(Valor)
FROM cajas;

/* 5 */
SELECT AVG(valor)
FROM cajas c
GROUP BY ALMACEN;

/* 6 */
SELECT ALMACEN, AVG(Valor)
FROM cajas c
GROUP BY ALMACEN 
HAVING AVG(c.VALOR) > 150;

/* 7 */
SELECT c.NUMREFERENCIA , a.LUGAR 
FROM cajas c
JOIN almacenes a ON c.ALMACEN = a.CODIGO;

/* 8 */
SELECT a2.CODIGO ,COUNT(*)
FROM cajas c2
JOIN almacenes a2 ON c2.ALMACEN = a2.CODIGO
GROUP BY a2.CODIGO ;

/* 9 */
SELECT a2.CODIGO,a2.CAPACIDAD ,COUNT(*) AS 'Cantidad Cajas'
FROM cajas c2
JOIN almacenes a2 ON c2.ALMACEN = a2.CODIGO
GROUP BY a2.CODIGO, a2.CAPACIDAD
HAVING COUNT(*) > a2.capacidad;

/* 10 */
SELECT c.NUMREFERENCIA 
FROM cajas c 
JOIN almacenes a ON c.ALMACEN = a.CODIGO
WHERE a.LUGAR = 'Bilbao';

/* 11 */
INSERT INTO almacenes (CODIGO ,CAPACIDAD,LUGAR) VALUES (8,3,'Barcelona');

/* 12 */
INSERT INTO cajas (NUMREFERENCIA,CONTENIDO,VALOR,ALMACEN) VALUES ('H5RT', 'Papel', 200, 2);

/* 13 */
UPDATE cajas SET VALOR = VALOR * 0.85;

/* 14 */
UPDATE cajas SET VALOR = VALOR * 0.80 WHERE VALOR > (
	SELECT AVG(VALOR)
	FROM cajas
);
/* 15 */
DELETE FROM cajas WHERE VALOR < 100;

/* 16*/
DELETE FROM cajas WHERE ALMACEN IN (
	SELECT Codigo
	FROM almacenes
	WHERE CAPACIDAD < (
		SELECT COUNT(*)
		FROM cajas
		WHERE ALMACEN = Codigo
	)
);