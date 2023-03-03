with
    source_businessentityaddress as (
        select
            cast(addressid as int) as id_endereco
            , cast(businessentityid as int) as id_entidade_comercial
        from {{ source('erp', 'businessentityaddress') }}
    )
select *
from source_businessentityaddress