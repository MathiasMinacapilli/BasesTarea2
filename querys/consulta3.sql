--Devolver el nombre de los autores que editaron todas sus 
--obras en mas de una editorial.

SELECT distinct a.nombre_autor
FROM autores a
	natural join obra_autor oa
	natural join obra_editorial oe
group by a.cod_autor, oa.cod_obra
having count(distinct oe.cod_editorial) > 1
/*
(SELECT count(distinct edi.cod_editorial)
	FROM autores aut
		natural join obra_autor oaut
		natural join obras obr
		natural join obra_editorial oedi
		natural join editoriales edi
	where aut.cod_autor = a.cod_autor
	group by obr.cod_obra
	) > 1
*/
--podemos sacar el editoriales pues el codigo editorial esta en obra_editorial

--300