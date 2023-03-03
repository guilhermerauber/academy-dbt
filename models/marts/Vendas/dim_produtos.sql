with
    produtos as (
        select *
        from {{ ref('stg_erp__produto') }}
    )

    , transformed as (
        select
            row_number() over (order by id_produto) as sk_produto
            , id_produto
            , nome_produto
        from produtos
    )

select *
from transformed