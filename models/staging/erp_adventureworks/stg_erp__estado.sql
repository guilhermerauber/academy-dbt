with
    source_stateprovince as (
        select
            cast(stateprovinceid as int) as id_estado				
            , cast(name as string) as nome_estado
            , cast(territoryid as string) as id_territorio
            , cast(countryregioncode as string) as codigo_pais           		
        from {{ source('erp', 'stateprovince') }}
    )
select *
from source_stateprovince