--Devolver codigo de autor y nombre de los autores que 
--solamente tuvieron función de autor en todas sus obras.

SELECT distinct a.cod_autor,
	a.nombre_autor
FROM autores a
	natural join obra_autor oa


where oa.cod_funcion = 1
	and not exists (SELECT a.cod_autor
		FROM autores aut
			natural join obra_autor oaut
		where oaut.cod_funcion != 1

where 'autor' in (SELECT distinct func.funcion 
		FROM autores auts 
			natural join obra_autor oaut 
			natural join funciones func 
		where auts.cod_autor=a.cod_autor)
	and not exists (SELECT distinct a.cod_autor
		FROM autores aut
			natural join obra_autor oaut
		where 'autor' not in (SELECT distinct func.funcion 
				FROM autores auts 
					natural join obra_autor oaut 
					natural join funciones func 
				where aut.cod_autor=a.cod_autor)

			and aut.cod_autor = a.cod_autor
	)

--Me fijo que el autor tenga al menos una obra en la que es autor, y luego me fijo que no exista ninguna otra en la que no sea autor. 


--El resultado es 1037

--Chequear casos en los que puede haber repetidos, ordenar lexicograficamente

--El resultado es 1037 NOP, atenti al distinct en el cod_autor del select!

