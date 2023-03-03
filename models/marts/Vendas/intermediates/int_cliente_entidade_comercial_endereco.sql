with
    cliente as (
        select
            id_entidade_comercial
            , primeiro_nome
            , nome_meio
            , nome_fim

        from {{ ref('stg_erp__cliente') }}
    )

    , endereco_entidade_comercial as (
        select
            id_entidade_comercial 
            , id_endereco

        from {{ ref('stg_erp__endereco_entidade_comercial') }}
    )

    , endereco as (
        select
            id_endereco
            , id_estado
            , nome_cidade

        from {{ ref('stg_erp__endereco') }}

    )

    /* Fazendo o fan-out da tabela de endereco, endereco_entidade_comercial e cliente. */
    , joined as (
        select
            cliente.id_entidade_comercial
            , cliente.primeiro_nome
            , cliente.nome_meio
            , cliente.nome_fim
            , endereco.id_endereco
            , endereco. id_estado
            , endereco.nome_cidade

        from endereco_entidade_comercial
        left join cliente on endereco_entidade_comercial.id_entidade_comercial = cliente.id_entidade_comercial
        left join endereco on endereco_entidade_comercial.id_endereco = endereco.id_endereco
    )

select 
    id_entidade_comercial
    , case
        when nome_meio is null then primeiro_nome || " " || nome_fim
        else primeiro_nome || " " || nome_meio || " " || nome_fim
        end as nome_completo
    , id_endereco
    , id_estado
    , nome_cidade
from joined
order by id_entidade_comercial