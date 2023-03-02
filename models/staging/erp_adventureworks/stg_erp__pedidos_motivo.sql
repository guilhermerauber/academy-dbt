with
    source_salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as id_pedido				
            , cast(salesreasonid as int) as id_motivo_da_venda        		
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
select *
from source_salesorderheadersalesreason