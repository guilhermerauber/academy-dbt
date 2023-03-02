with
    source_salesorderdetail as (
        select
            cast(salesorderid as int) as id_pedido				
            , cast(salesorderdetailid as int) as id_pedido_detalhes
            , cast(productid as int) as id_produto
            , cast(orderqty as int) as quantidade
            , cast(unitprice as numeric) as preco_unitario

        from {{ source('erp', 'salesorderdetail') }}
    )
select *
from source_salesorderdetail