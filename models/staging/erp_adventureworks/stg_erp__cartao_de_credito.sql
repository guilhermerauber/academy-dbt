with
    source_creditcard as (
        select
            cast(creditcardid as int) as id_cartao_de_credito				
            , cast(cardtype as string) as tipo_do_cartao        		
        from {{ source('erp', 'creditcard') }}
    )
select *
from source_creditcard