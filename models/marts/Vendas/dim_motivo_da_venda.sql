with
    motivo_da_venda as (
        select *
        from {{ ref('stg_erp__motivo_da_venda') }}
    )

    , pedidos_motivo as (
        select *
        from {{ ref('stg_erp__pedidos_motivo') }}
    )

    , uniao_tabelas as (
        select
            motivo_da_venda.id_motivo_da_venda
            , motivo_da_venda.nome_motivo_da_venda
            , pedidos_motivo.id_pedido


        from pedidos_motivo
        left join motivo_da_venda on pedidos_motivo.id_motivo_da_venda = motivo_da_venda.id_motivo_da_venda
    )

    , transformed as (
        select
            row_number() over (order by id_motivo_da_venda) as sk_motivo_da_venda
            , *
        from uniao_tabelas

    )

select *
from transformed