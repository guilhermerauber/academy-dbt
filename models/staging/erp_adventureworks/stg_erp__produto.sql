with
    source_product as (
        select
            cast(productid as int) as id_produto			
            , cast(name as string) as nome_produto        		
        from {{ source('erp', 'product') }}
    )
select *
from source_product