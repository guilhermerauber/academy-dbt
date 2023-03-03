with
    source_person as (
        select
            cast(businessentityid as int) as id_entidade_comercial				
            , cast(firstname as string) as primeiro_nome			
            , cast(middlename as string) as nome_meio	
            , cast(lastname as string) as nome_fim	
        from {{ source('erp', 'person') }}
    )

select *
from source_person