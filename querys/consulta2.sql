--Devolver codigo de autor y nombre de los autores que 
--solamente tuvieron funci ´ on de autor en todas sus ´obras.

SELECT a.cod_autor,
	a.nombre_autor
FROM autores a
	natural join obra_autor oa
	natural join funciones f
where f.cod_funcion = 1 --cod_funcion 1 es el codigo de la funcion de autor
group by a.cod_autor