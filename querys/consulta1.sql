--Devolver el título, edicion y cantidad de temas de 
--las obras de Uruguay que tratan como máximo 3 temas

--Al hacer el group by por codigo obra tenemos en cada
--grupo las obras con el mismo codigo pero distintos temas.
--Entonces al hacer el count de la cantidad de tuplas en
--cada conjunto chequeamos cuantos temas tiene cada obra.distinct t.tema
SELECT o.titulo as "Titulo",
	o.edicion as "Edicion",
    count(*) as "Cantidad de temas"
FROM obras o
	natural join obra_tema ot
	natural join temas t
where o.pais = 'URY'
group by o.cod_obra
having count(*) <= 3