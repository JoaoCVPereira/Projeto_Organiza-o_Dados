-- =====================================================
-- 00_MANUAL_OPERACIONAL
-- DOCUMENTAÇÃO OPERACIONAL - ORGANIZAÇÃO
-- =====================================================

-- Principais tabelas:
-- Utilizadores
-- Produtos
-- Vendas

-- Principais Views:
-- Vendas_Anonimas
-- Relatorio_Vendas_Mensal

-- Principais mecanismos:
-- Auditoria de alterações de preços
-- Índices
-- Permissões
-- Disaster Recovery
-- Branching / recuperação no Neon

-- Consultar relatório:
SELECT *
FROM Relatorio_Vendas_Mensal;

-- Consultar dados anonimizados:
SELECT *
FROM Vendas_Anonimas;

-- Consultar stock crítico:
SELECT
    titulo,
    stock
FROM Produtos
WHERE stock < 5
ORDER BY stock ASC;
