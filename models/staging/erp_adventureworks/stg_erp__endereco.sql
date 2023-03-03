with
    source_address as (
        select
            cast(addressid as int) as id_endereco
            , cast(stateprovinceid as int) as id_estado
            , cast(city as string) as nome_cidade
        from {{ source('erp', 'address') }}
    )
select *
from source_address