--Devolver título e isbn de las obras que tienen cantidad de editoriales mayor que 2 y cantidad de autores menor que 4

SELECT o.cod_obra, o.titulo, o.isbn 
FROM obras o


	natural join obra_editorial oe
	natural join obra_autor oa
GROUP BY o.cod_obra, o.titulo, o.isbn
HAVING (count(distinct cod_editorial) > 2) and (count(distinct cod_autor) < 4)


/*GROUP BY o.cod_obra, o.titulo, o.isbn
having (SELECT count(distinct oe1.cod_editorial)
	     FROM obras o1
		  natural join obra_editorial oe1
		  where o1.cod_obra = o.cod_obra) > 2
	and

	(SELECT count(distinct oa1.cod_autor)
	     FROM obras o2
		  natural join obra_autor oa1
		  where o2.cod_obra = o.cod_obra) < 4*/