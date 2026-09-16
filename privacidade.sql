-- =====================================================
-- HORA 18 - PRIVACIDADE E PROTEÇÃO DE DADOS
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================

-- =====================================================
-- 1. VIEW DE ANONIMIZAÇÃO
-- =====================================================

CREATE OR REPLACE VIEW Vendas_Anonimas AS
SELECT
    id,
    produto_id,
    quantidade,
    'ANONIMO' AS nome_cliente
FROM Vendas;

-- =====================================================
-- 2. CONSULTA DA VIEW
-- =====================================================

SELECT *
FROM Vendas_Anonimas;

-- =====================================================
-- 3. REGISTO DE ACESSOS
-- =====================================================

CREATE TABLE Log_Acessos (
    quem_fez_o_select TEXT,
    data_acesso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

