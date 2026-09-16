-- =====================================================
-- HORA 20 - O ENGENHEIRO DE ESTRATÉGIA
-- Dashboard de Gestão / Business Intelligence
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. CONSULTA DE GESTÃO
-- =====================================================

SELECT
    produto_id,
    SUM(quantidade) AS total_vendido
FROM Vendas
GROUP BY produto_id
ORDER BY total_vendido DESC;


-- =====================================================
-- 2. VIEW DE GESTÃO
-- Relatório analítico de vendas por produto

-- =====================================================

CREATE OR REPLACE VIEW Relatorio_Vendas_Mensal AS
SELECT
    v.produto_id,
    p.titulo AS produto,
    SUM(v.quantidade) AS quantidade_vendida,
    SUM(v.quantidade * p.preco) AS receita_total
FROM Vendas v
JOIN Produtos p
    ON v.produto_id = p.id
GROUP BY
    v.produto_id,
    p.titulo
ORDER BY receita_total DESC;


-- =====================================================
-- 3. CONSULTA DA VIEW
-- =====================================================

SELECT *
FROM Relatorio_Vendas_Mensal;


-- =====================================================
-- 4. SEMÁFORO DE STOCK CRÍTICO

-- =====================================================

SELECT
    titulo,
    stock
FROM Produtos
WHERE stock < 5
ORDER BY stock ASC;
