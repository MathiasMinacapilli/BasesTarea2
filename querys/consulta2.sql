--CONSULTA: Devolver codigo de autor y nombre de los autores que 
--solamente tuvieron función de autor en todas sus obras.

SELECT distinct a.cod_autor,
	a.nombre_autor
FROM autores a
	natural join obra_autor oa

where --oa.cod_funcion = 1 and  // esto es lo mismo que poner el existe del final
	 not exists (SELECT a.cod_autor
		FROM autores aut
			natural join obra_autor oaut
		where oaut.cod_funcion <> 1
			and aut.cod_autor = a.cod_autor
	)
	and exists (SELECT 1
		FROM autores auts
			natural join obra_autor obraauts
		where auts.cod_autor = a.cod_autor)