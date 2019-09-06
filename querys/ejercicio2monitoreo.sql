--Devolver la cantidad de obras para cada par (tema, forma de ingreso), para aquellos que tienen más de un ejemplar

SELECT count(distinct cod_obra) as "Cant obras",
	ot.cod_tema,
	i.cod_forma_ingreso
FROM inventario i
	natural join obra_tema ot

GROUP BY ot.cod_tema, i.cod_forma_ingreso
having count(i.cod_obra) > 1

order by "Cant obras" desc

--un count en el select, y hay que agrupar por tema y forma de ingresa

/*SELECT count (distinct ii.cod_obra)
		from inventario ii
			natural join obra_tema ott
		where ii.cod_obra = ott.cod_obra*/