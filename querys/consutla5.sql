--Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.

--Todas las editoriales (cod_editorial) tal que EDITORIAL(e) and !Existe(EDITORIAL(edi) and count(edi.cant_obras) > edi.cant_obras)
SELECT e.cod_editorial, e.nombre_editorial as "edicion"
FROM editoriales e
	natural join obras o
	natural join obra_editorial oe
where o.edicion like '%1ª%'
group by e.cod_editorial
having not exists (SELECT 1
	FROM editoriales edi
		natural join obras ob
		natural join obra_editorial oedi
	where ob.edicion like '%1ª%'
	group by e.cod_editorial
	having count(e.*) < count(edi.*)
	)
/*
SELECT e.cod_editorial, e.nombre_editorial as "edicion"
FROM editoriales e
	natural join obras o 
	natural join obra_editorial oe
where o.edicion like '%1ª%'
group by e.cod_editorial
having count(*) 
	and not exists (
		SELECT *
		FROM editoriales edi
			natural join obras ob
			natural join obra_editorial oedi
		where 
	)
*/
--Tendria que dar FIN DE SIGLO