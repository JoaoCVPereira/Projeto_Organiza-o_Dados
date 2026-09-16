-- =====================================================
-- 00_GUIA_RESOLUCAO_ERROS
-- GUIA DE DIAGNÓSTICO DE ERROS
-- =====================================================

-- =====================================================
-- ERROS DE PRIMARY KEY / UNIQUE
-- =====================================================
-- Verificar se o ID ou valor UNIQUE já existe.

SELECT *
FROM Utilizadores
ORDER BY id;


-- =====================================================
-- VALORES NULOS
-- =====================================================
-- Verificar registos com campos importantes vazios.

SELECT *
FROM Utilizadores
WHERE nome IS NULL
   OR email IS NULL;


-- =====================================================
-- VALIDAÇÃO DE PRODUTOS
-- =====================================================
-- Procurar preços inválidos.

SELECT *
FROM Produtos
WHERE preco < 0;


-- =====================================================
-- VALIDAÇÃO DE STOCK
-- =====================================================

SELECT *
FROM Produtos
WHERE stock IS NULL
   OR stock < 0;


-- =====================================================
-- LIGAÇÕES ENTRE VENDAS E PRODUTOS
-- =====================================================

SELECT
    v.id,
    v.produto_id
FROM Vendas v
LEFT JOIN Produtos p
    ON v.produto_id = p.id
WHERE p.id IS NULL;
