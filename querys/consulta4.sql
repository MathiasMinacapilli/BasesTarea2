SELECT o.titulo, o.isbn
FROM obras o
	natural join obra_editorial oe
	natural join obra_autor oa
GROUP BY o.cod_obra, o.titulo, o.isbn
HAVING count(distinct cod_editorial) > count(distinct cod_autor)
