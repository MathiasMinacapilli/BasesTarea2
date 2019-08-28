--Devolver código y nombre de la editorial con mayor cantidad de obras que son una primera edicion.
SELECT e.cod_editorial, e.nombre_editorial as "edicion"
FROM (editoriales e
	natural join obras o 
	natural join obra_editorial oe
WHERE o.edicion like '%1ª%'
GROUP BY e.cod_editorial)
HAVING COUNT(*) = (SELECT MAX(contador)
		   FROM ( SELECT cod_obras, COUNT(cod_obras) contador
                               FROM T GROUP BY cod_obras
                        ) AS T1
                  ) AS T2
--Tendria que dar FIN DE SIGLO