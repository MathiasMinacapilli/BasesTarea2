--CONSULTA: Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.

--Agrupa por editorial y cuenta cuantas obras distintas hay en cada una, luego las ordena en forma descendente y se queda con la primera.

SELECT e.cod_editorial, 
	e.nombre_editorial
FROM editoriales e
	natural join obras o
	natural join obra_editorial oe
where o.edicion like '%1ª%'
	or o.edicion like '%1a%'

group by e.cod_editorial, e.nombre_editorial

order by count (o.cod_obra) desc

limit(1)
