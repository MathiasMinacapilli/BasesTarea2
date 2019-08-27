--Devolver el nombre de los autores que editaron todas sus 
--obras en mas de una editorial.

SELECT a.nombre_autor
FROM autores a
	natural join obra_autor oa
	natural join obras o
	natural join obra_editorial oe
	natural join editoriales e
group by a.cod_autor
having count(distinct e.cod_editorial) > 1