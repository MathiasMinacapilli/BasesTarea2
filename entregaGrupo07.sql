--CONSULTA 1: Devolver el título, edicion y cantidad de temas de 
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



--CONSULTA 2: Devolver codigo de autor y nombre de los autores que 
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



--CONSULTA 3: Devolver el nombre de los autores que editaron todas sus 
--obras en mas de una editorial.

SELECT distinct a.nombre_autor
FROM autores a
      --queremos que tenga al menos una obra 
where exists(SELECT 1 
		FROM autores aut 
			natural join obra_autor oaut
			where aut.cod_autor = a.cod_autor) 
	--y que no haya editado ninguna obra en una sola editorial  
	and not exists(SELECT 1
		FROM autores auth
		natural join obra_autor oa
		natural join obra_editorial oe
		where auth.cod_autor=a.cod_autor
		group by oa.cod_obra
		having count(*) = 1)



--CONSULTA 4: Devolver título e isbn de las obras que tienen mayor cantidad de editoriales que de autores

--Agrupa por código de obra, y se queda con aquellas que tengan mayor cantidad de distintas editoriales que de distintos autores.
SELECT o.titulo, o.isbn
FROM obras o
	natural join obra_editorial oe
	natural join obra_autor oa
GROUP BY o.cod_obra, o.titulo, o.isbn
HAVING count(distinct cod_editorial) > count(distinct cod_autor)



--CONSULTA 5: Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.

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



--CONSULTA 6: Devolver ćodigo de obra de las obras de Argentina, 
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
