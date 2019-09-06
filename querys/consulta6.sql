--CONSULTA: Devolver ćodigo de obra de las obras de Argentina, 
--que tienen un solo autor,
--y que cumplen que todas las otras obras de su 
--autor comparten al menos un tema con ella.


SELECT distinct o.cod_obra, o.titulo,  o.pais
FROM obras o
	natural join obra_autor oa
	natural join obra_tema ot


where o.pais = 'ARG' 
	--Tiene un unico autor
	and exists (SELECT ow1.cod_obra
	FROM obras ow1
		natural join obra_autor oaw1
	where ow1.cod_obra = o.cod_obra			
	group by ow1.cod_obra 
	having count(distinct cod_autor) = 1)
	--Que el autor tenga al menos alguna otra obra para comparar los temas
	and exists (SELECT obrh.cod_obra
			FROM obras obrh
				natural join obra_autor oauth
				natural join obra_tema otemh
			where obrh.cod_obra <> o.cod_obra
				and oauth.cod_autor = oa.cod_autor)
	--No existe una obra de su mismo autor
	--que no comparta ninguna tema
	and not exists(SELECT obr.cod_obra
		FROM obras obr
			natural join obra_autor oaut
			natural join obra_tema otem
		where oa.cod_autor = oaut.cod_autor
			and ot.cod_tema not in (SELECT obrtem.cod_tema
				FROM obras obrs
					natural join obra_tema obrtem
				where obrs.cod_obra = obr.cod_obra))
