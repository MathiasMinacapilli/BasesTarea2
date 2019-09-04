--Devolver ćodigo de obra de las obras de Argentina, 
--que tienen un solo autor,
--y que cumplen que todas las otras obras de su 
--autor comparten al menos un tema con ella.

SELECT *--o.cod_obra, o.titulo,  o.pais
FROM obras o
	natural join obra_autor oa
	natural join obra_tema ot
where o.pais = 'ARG'
group by o.cod_obra
having count(oa.cod_autor) = 1
	--No existe una obra de su mismo autor
	--que no comparten ninguna tema
	and not exists(SELECT otem.cod_tema
		FROM obras obr
			natural join obra_autor oaut
			natural join obra_tema otem
		where oa.cod_autor = oaut.cod_autor
			and ot.cod_tema not in (SELECT obrtem.cod_tema
				FROM obras obrs
					natural join obra_tema obrtem
				where obrs.cod_obra = obr.cod_obra)

/*group by o.cod_obra
having count(oa.cod_autor) = 1*/

--group by oa.cod_autor

