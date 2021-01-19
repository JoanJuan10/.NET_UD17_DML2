/* 1 */
SELECT NOMBRE 
FROM peliculas;

/* 2 */
SELECT DISTINCT CALIFICACIONEDAD 
FROM peliculas p;

/* 3 */
SELECT Codigo, Nombre
FROM peliculas p 
WHERE CALIFICACIONEDAD IS NULL;

/* 4 */
SELECT *
FROM Salas
WHERE PELICULA IS NULL;

/* 5 */
SELECT *
FROM salas s 
LEFT JOIN peliculas p ON s.PELICULA = p.CODIGO;

/* 6 */
SELECT *
FROM peliculas p 
LEFT JOIN salas s ON s.PELICULA = p.CODIGO;

/* 7 */
SELECT p.NOMBRE 
FROM peliculas p
WHERE p.CODIGO NOT IN (
	SELECT s.PELICULA 
	FROM salas s
	WHERE s.PELICULA IS NOT NULL
);

/* 8 */
INSERT INTO peliculas (Codigo,Nombre,CALIFICACIONEDAD) VALUES (123,'Uno, Dos, Tres','PG-7');

/* 9 */
UPDATE peliculas SET CALIFICACIONEDAD = 'PG-13' WHERE CALIFICACIONEDAD = '13';

/* 10 */
DELETE FROM salas WHERE PELICULA IN (
	SELECT CODIGO 
	FROM peliculas
	WHERE CALIFICACIONEDAD = 'G'
)



