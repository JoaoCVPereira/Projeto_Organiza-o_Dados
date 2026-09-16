-- =====================================================
-- HORA 15 - SEGURANÇA E AUDITORIA
-- Sistema de Auditoria de Alterações de Preços
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. CRIAÇÃO DA TABELA DE AUDITORIA
-- =====================================================


CREATE TABLE Auditoria_Precos (
    produto_id INT,
    preco_antigo DECIMAL,
    preco_novo DECIMAL,
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =====================================================
-- 2. CRIAÇÃO DA FUNÇÃO DE AUDITORIA
-- =====================================================


CREATE OR REPLACE FUNCTION registar_alteracao()
RETURNS TRIGGER AS $$
BEGIN

    INSERT INTO Auditoria_Precos (
        produto_id,
        preco_antigo,
        preco_novo
    )
    VALUES (
        OLD.id,
        OLD.preco,
        NEW.preco
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


-- =====================================================
-- 3. CRIAÇÃO DO TRIGGER
-- =====================================================

CREATE TRIGGER porteiro_precos
AFTER UPDATE ON Produtos
FOR EACH ROW
EXECUTE FUNCTION registar_alteracao();


-- =====================================================
-- FIM DA CONFIGURAÇÃO DA AUDITORIA
-- =====================================================
