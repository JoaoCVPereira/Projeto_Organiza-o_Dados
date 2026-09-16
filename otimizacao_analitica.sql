-- =====================================================
-- HORA 16 - OTIMIZAÇÃO E ANÁLISE
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================

-- =====================================================
-- 1. ÍNDICE PARCIAL
-- =====================================================

CREATE INDEX idx_vendas_data_recente
ON Vendas (quantidade)
WHERE quantidade >= 10;

-- =====================================================
-- 2. ANÁLISE DE CONSULTA
-- =====================================================

EXPLAIN ANALYZE
SELECT *
FROM Vendas
WHERE quantidade >= 10;
