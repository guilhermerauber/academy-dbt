with
    clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , tipo_de_cartao as (
        select *
        from {{ ref('dim_tipo_de_cartao') }}
    )

    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , motivo_da_venda as (
        select *
        from {{ ref('dim_motivo_da_venda') }}
    )

    , pedidos_detalhes as (
        select *
        from {{ ref('int_pedidos_detalhes') }}
    )

    , joined as (
        select
            clientes.sk_entidade_comercial as fk_entidade_comercial
            , tipo_de_cartao.sk_cartao_de_credito as fk_cartao_de_credito
            , produtos.sk_produto as fk_produto
            , motivo_da_venda.sk_motivo_da_venda as fk_motivo_da_venda
            , pedidos_detalhes.id_pedido_detalhes
            , pedidos_detalhes.id_pedido
            , pedidos_detalhes.id_produto
            , pedidos_detalhes.quantidade
            , pedidos_detalhes.preco_unitario
            , pedidos_detalhes.data_do_pedido
            , pedidos_detalhes.status
            , pedidos_detalhes.id_do_cliente
            , pedidos_detalhes.id_territorio
            , pedidos_detalhes.id_cartao_de_credito
            , pedidos_detalhes.subtotal
            , pedidos_detalhes.endereco_de_envio
            , pedidos_detalhes.endereco_de_cobranca

            --, clientes.id_entidade_comercial
            , clientes.nome_completo
            , clientes.id_endereco
            , clientes.nome_cidade
            , clientes.id_estado
            , clientes.nome_estado
            , clientes.codigo_pais
            , clientes.nome_pais            

            --, tipo_de_cartao.id_cartao_de_credito
            , tipo_de_cartao.tipo_do_cartao

            , motivo_da_venda.id_motivo_da_venda
            , motivo_da_venda.nome_motivo_da_venda
            --, motivo_da_venda.id_pedido

            --, produtos.id_produto
            , produtos.nome_produto            

        from pedidos_detalhes
        left join clientes on pedidos_detalhes.endereco_de_envio = clientes.id_endereco
        left join tipo_de_cartao on pedidos_detalhes.id_cartao_de_credito = tipo_de_cartao.id_cartao_de_credito
        left join produtos on pedidos_detalhes.id_produto = produtos.id_produto
        left join motivo_da_venda on pedidos_detalhes.id_pedido = motivo_da_venda.id_pedido
    )

    , transformacoes as (
        select
            id_pedido_detalhes || " " || id_pedido as sk_venda
            , * 
        from joined
    )

select *
from transformacoes