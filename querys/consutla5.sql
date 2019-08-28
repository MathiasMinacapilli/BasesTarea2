--Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.
SELECT e.cod_editorial, e.nombre_editorial count(*) as 'cantidad'
FROM editoriales e
	natural join obras o 
	natural join obra_editorial oe
GROUP BY e.cod_editorial
HAVING MAX (cantidad)
FROM editoriales e
	(SELECT e.cod_editorial
	FROM obras odos
	WHERE odos.edicion like as '%PRIMERA EDICION%'))