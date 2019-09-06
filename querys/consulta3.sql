--Devolver el nombre de los autores que editaron todas sus 
--obras en mas de una editorial.

SELECT distinct a.nombre_autor
FROM autores a
where exists(SELECT 1 
		FROM autores aut 
			natural join obra_autor oaut
			where aut.cod_autor = a.cod_autor) and 
								not exists(SELECT 1
										FROM autores auth
										natural join obra_autor oa
										natural join obra_editorial oe
										where auth.cod_autor=a.cod_autor
										group by oa.cod_obra
										having count(*) = 1)


--queremos que tenga al menos una obra y que no haya editado ninguna obra en una sola editorial  


--podemos sacar el editoriales pues el codigo editorial esta en obra_editorial

--276 o 277