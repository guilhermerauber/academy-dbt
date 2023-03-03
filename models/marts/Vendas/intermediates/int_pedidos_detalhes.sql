with
    pedidos_detalhes as (
        select
            id_pedido
            , id_pedido_detalhes
            , id_produto
            , quantidade
            , preco_unitario

        from {{ ref('stg_erp__pedidos_detalhes') }}
    )

    , pedidos as (
        select
            id_pedido
            , data_do_pedido
            , status
            , id_do_cliente
            , id_do_vendedor
            , id_territorio
            , id_cartao_de_credito
            , subtotal
            , endereco_de_envio
            , endereco_de_cobranca

        from {{ ref('stg_erp__pedidos') }}
    )

    /* Fazendo o fan-out da tabela de pedidos_detalhes com a de pedidos. */
    , joined as (
        select
           pedidos_detalhes.id_pedido_detalhes
            , pedidos_detalhes.id_pedido
            , pedidos_detalhes.id_produto
            , pedidos_detalhes.quantidade
            , pedidos_detalhes.preco_unitario
            , pedidos.data_do_pedido
            , pedidos.status
            , pedidos.id_do_cliente
            , pedidos.id_territorio
            , pedidos.id_cartao_de_credito
            , pedidos.subtotal
            , pedidos.endereco_de_envio
            , pedidos.endereco_de_cobranca

        from pedidos_detalhes
        left join pedidos on pedidos_detalhes.id_pedido = pedidos.id_pedido
    )

select *
from joined
order by id_pedido_detalhes