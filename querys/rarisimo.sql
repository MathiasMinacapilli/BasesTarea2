SELECT * 
from obras o 
natural join obra_autor oa
natural join obra_tema ot
where cod_obra = 80022 and o.pais = 'ARG' 
	and not exists(SELECT obr.cod_obra
		FROM obras obr
			natural join obra_autor oaut
			natural join obra_tema otem
		where oa.cod_autor = oaut.cod_autor
			and ot.cod_tema not in (SELECT obrtem.cod_tema
				FROM obras obrs
					natural join obra_tema obrtem
				where obrs.cod_obra = obr.cod_obra)) 
/*
group by cod_obra
having count(distinct oa.cod_autor) = 1*/