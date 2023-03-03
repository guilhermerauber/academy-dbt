with
    pais_estado as (
        select *
        from {{ ref('int_pais_estado') }}
    )

    , cliente_entidade_comercial_endereco as (
        select *
        from {{ ref('int_cliente_entidade_comercial_endereco') }}
    )

    , uniao_tabelas as (
        select
            cliente_entidade_comercial_endereco.id_entidade_comercial
            , cliente_entidade_comercial_endereco.nome_completo
            , cliente_entidade_comercial_endereco.id_endereco
            , cliente_entidade_comercial_endereco.nome_cidade
            , pais_estado.id_estado
            , pais_estado.nome_estado
            , pais_estado.codigo_pais
            , pais_estado.nome_pais


        from cliente_entidade_comercial_endereco
        left join pais_estado on cliente_entidade_comercial_endereco.id_estado = pais_estado.id_estado
    )

    , transformed as (
        select
            row_number() over (order by id_entidade_comercial) as sk_entidade_comercial
            , *
        from uniao_tabelas

    )

select *
from transformed