--CONSULTA: Devolver título e isbn de las obras que tienen mayor cantidad de editoriales que de autores

--Agrupa por código de obra, y se queda con aquellas que tengan mayor cantidad de distintas editoriales que de distintos autores.
SELECT o.titulo, o.isbn
FROM obras o
	natural join obra_editorial oe
	natural join obra_autor oa
GROUP BY o.cod_obra, o.titulo, o.isbn
HAVING count(distinct cod_editorial) > count(distinct cod_autor)
