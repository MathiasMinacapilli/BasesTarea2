﻿--Devolver codigo de autor y nombre de los autores que 
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
			and aut.cod_autor = a.cod_autor
	)
	--and a.nombre_autor like '%Ercole%'
--group by a.cod_autor

--¿Como hacer para chequear cada valor de la columna f.cod_funcion en la bolsa?
--having max(f.cod_funcion) = 1 --cod_funcion 1 es el codigo de la funcion de autor

--El resultado es 1037

--Chequear casos en los que puede haber repetidos, ordenar lexicograficamente