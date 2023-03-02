with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as id_pedido				
            , cast(orderdate as string) as data_do_pedido
            , cast(status as int) as status
            , cast(customerid as int) as id_do_cliente
            , cast(salespersonid as int) as id_do_vendedor
            , cast(territoryid as int) as id_territorio
            , cast(creditcardid as  int) as id_cartao_de_credito
            , cast(subtotal as numeric) as subtotal
            , cast(shiptoaddressid as int) as endereco_de_envio
            , cast(billtoaddressid as int) as endereco_de_cobranca
        from {{ source('erp', 'salesorderheader') }}
    )
select *
from source_salesorderheader