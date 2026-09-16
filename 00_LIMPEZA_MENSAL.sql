-- =====================================================
-- 00_LIMPEZA_MENSAL
-- MANUTENÇÃO MENSAL
-- =====================================================

-- Atualização das estatísticas e manutenção das tabelas.

VACUUM ANALYZE;


-- Verificação posterior das tabelas.

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
