-- =====================================================
-- HORA 32 - COMUNICAÇÃO EXECUTIVA
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================

-- =====================================================
-- 1. PAINEL DE CONTROLO
-- =====================================================

SELECT
    p.titulo AS produto,
    SUM(v.quantidade) AS total_unidades_vendidas,
    SUM(v.quantidade * p.preco) AS faturacao_total
FROM Vendas v
JOIN Produtos p
    ON v.produto_id = p.id
GROUP BY p.id, p.titulo
ORDER BY faturacao_total DESC;


-- =====================================================
-- 2. ESTADO DE DESEMPENHO
-- =====================================================

SELECT
    p.titulo AS produto,
    SUM(v.quantidade) AS total_unidades_vendidas,
    SUM(v.quantidade * p.preco) AS faturacao_total,
    CASE
        WHEN SUM(v.quantidade * p.preco) > 1000
            THEN 'SUCESSO: Meta Atingida'
        ELSE 'ATENCAO: Faturacao Baixa'
    END AS estado_desempenho
FROM Vendas v
JOIN Produtos p
    ON v.produto_id = p.id
GROUP BY p.id, p.titulo
ORDER BY faturacao_total DESC;


-- =====================================================
-- 3. ALERTA DE STOCK
-- =====================================================

SELECT
    titulo AS produto,
    stock,
    CASE
        WHEN stock < 5
            THEN 'ATENCAO: Stock Critico'
        ELSE 'OPERACIONAL'
    END AS estado_stock
FROM Produtos
ORDER BY stock ASC;
