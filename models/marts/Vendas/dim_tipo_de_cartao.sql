with
    cartao_de_credito as (
        select *
        from {{ ref('stg_erp__cartao_de_credito') }}
    )

    , transformed as (
        select
            row_number() over (order by id_cartao_de_credito) as sk_cartao_de_credito
            , id_cartao_de_credito
            , tipo_do_cartao
        from cartao_de_credito
    )

select *
from transformed