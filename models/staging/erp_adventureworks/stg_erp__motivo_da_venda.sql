with
    source_salesreason as (
        select			
            cast(salesreasonid as int) as id_motivo_da_venda 
            , cast(name as string) as nome_motivo_da_venda      		
        from {{ source('erp', 'salesreason') }}
    )
select *
from source_salesreason