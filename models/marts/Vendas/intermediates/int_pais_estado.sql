with
    pais as (
        select
            codigo_pais
            , nome_pais

        from {{ ref('stg_erp__pais') }}
    )

    , estado as (
        select
            id_estado 
            , nome_estado
            , codigo_pais


        from {{ ref('stg_erp__estado') }}
    )

    /* Fazendo o fan-out da tabela de pais com a de estado. */
    , joined as (
        select
            estado.id_estado
            , estado.nome_estado
            , pais.codigo_pais
            , pais.nome_pais

        from estado
        left join pais on estado.codigo_pais = pais.codigo_pais
    )

select *
from joined