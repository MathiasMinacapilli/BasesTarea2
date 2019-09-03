--Devolver título e isbn de las obras que tienen mayor cantidad de editoriales que de autores.
SELECT o.titulo, o.isbn
FROM obras o 
	natural join obra_editorial oe
	natural join obra_autor oa
GROUP BY o.cod_obra, o.titulo, o.isbn
HAVING count(distinct cod_editorial) > count(distinct cod_autor)

--Si sacas el distinct no retorna nada, es porque siempre aparece en cada registro cod_editorial y cod_autor

--ATENCION: Por lo que dijeron en el teórico TODOS los atributos del GROUP BY tienen que estar en el SELECT y viceversa (???????