-- =====================================================
-- HORA 40 - ENTREGA FINAL
-- Engenheiro de Valor Cloud
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================

-- =====================================================
-- 1. VALIDAÇÃO DE CONECTIVIDADE
-- =====================================================

SELECT
    current_database() AS base_de_dados,
    current_user AS utilizador,
    NOW() AS data_hora;


-- =====================================================
-- 2. LIMPEZA DE TABELAS RESIDUAIS DE TESTE
-- =====================================================


DROP TABLE IF EXISTS tabela_teste;


-- =====================================================
-- 3. OTIMIZAÇÃO DA BASE DE DADOS
-- =====================================================


VACUUM ANALYZE;


-- =====================================================
-- 4. INVENTÁRIO DA BASE DE DADOS
-- =====================================================

SELECT
    table_schema,
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


-- =====================================================
-- 5. VERIFICAÇÃO DAS TABELAS PRINCIPAIS
-- =====================================================


SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name IN (
    'utilizadores',
    'produtos',
    'vendas',
    'auditoria_precos',
    'log_acessos'
)
ORDER BY table_name;
