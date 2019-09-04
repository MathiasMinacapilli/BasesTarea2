--Devolver ćodigo de obra de las obras de Argentina, que tienen un solo autor,
--y que cumplen que todas las otras obras de su autor comparten al menos un tema con ella.
SELECT o.cod_obra--o.cod_obra, o.titulo,  o.pais
FROM obras o
	natural join obra_autor oa
where o.pais = 'ARG'
group by o.cod_obra
having count(oa.cod_autor) = 1

--group by oa.cod_autor

