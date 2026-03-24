-- análise 1: tipos de recebimento de pallets com média

select
	tipo_entrada.nome as tipo,
	count (recebimento.numero_laudo) as qtde_laudos,
	sum (recebimento.qtde_fisico) as qtde_pallets,
	round(avg(recebimento.qtde_fisico), 2) as media_recebimento
from recebimento
join tipo_entrada
	on tipo_entrada.id_tipo_entrada = recebimento.id_tipo_entrada
group by tipo_entrada.nome
order by qtde_laudos desc;

-- análise 2: quantidade de pallets por responsável

select
    resp_descarga.nome as responsavel,
    count(numero_laudo) as qtde_laudos,
    sum(qtde_fisico) as qtde_pallets
from recebimento
join resp_descarga
    on recebimento.id_resp_descarga = resp_descarga.id_resp_descarga
group by responsavel
order by qtde_pallets desc;
