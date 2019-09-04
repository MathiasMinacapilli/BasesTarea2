--Devolver ćodigo de obra de las obras de Argentina, que tienen un solo autor, y que cumplen que todas lasotras obras de su autor comparten al menos un tema con ella.

SELECT *
FROM obras o 
	natural join obra_autor oa
	natural join funciones f
where o.pais = 'ARG' and count(f.funcion = 'autor')