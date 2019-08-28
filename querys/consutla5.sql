--Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.
SELECT e.cod_editorial, e.nombre_editorial, o.edicion as "edicion"
FROM editoriales e
	natural join obras o 
	natural join obra_editorial oe
	WHERE o.edicion like '%1a%'
GROUP BY e.cod_editorial, o.cod_obra


--Tendria que dar FIN DE SIGLO