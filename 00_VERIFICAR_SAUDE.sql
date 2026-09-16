-- =====================================================
-- 00_VERIFICAR_SAUDE
-- VERIFICAÇÃO DA INFRAESTRUTURA
-- =====================================================

-- 1. Identificação da ligação

SELECT
    current_database() AS base_de_dados,
    current_user AS utilizador,
    NOW() AS data_hora;


-- 2. Ligações ativas

SELECT
    COUNT(*) AS ligacoes_ativas
FROM pg_stat_activity;


-- 3. Tamanho da base de dados

SELECT
    pg_size_pretty(
        pg_database_size(current_database())
    ) AS tamanho_base_dados;


-- 4. Tabelas existentes

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
