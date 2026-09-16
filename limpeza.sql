-- =====================================================
-- HORA 5 - AUDITORIA DE DADOS: QUALIDADE E LIMPEZA
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. REGRA DE VALIDAÇÃO DO EMAIL
-- Garante que o email contém @ e .
-- =====================================================

ALTER TABLE Utilizadores
ADD CONSTRAINT email_valido
CHECK (email LIKE '%@%.%');


-- =====================================================
-- 2. CORREÇÃO DE DADOS COM UPDATE
-- Exemplo: alteração do email do João Silva
-- =====================================================

UPDATE Utilizadores
SET email = 'novo.joao@email.com'
WHERE nome = 'João Silva';


-- =====================================================
-- 3. LIMPEZA DE DADOS COM DELETE
-- Remove vendas cuja quantidade seja igual a 0
-- =====================================================

DELETE FROM Vendas
WHERE quantidade = 0;


-- =====================================================
-- 4. REGRA DE VALIDAÇÃO DO PREÇO
-- Impede a introdução de preços negativos
-- =====================================================

ALTER TABLE Produtos
ADD CONSTRAINT preco_positivo
CHECK (preco >= 0);


-- =====================================================
-- 5. TESTES DE VALIDAÇÃO
-- Estes comandos devem gerar erro, demonstrando
-- que as regras de proteção estão a funcionar.
-- =====================================================

-- Teste de email inválido:
-- INSERT INTO Utilizadores (nome, email)
-- VALUES ('Teste Errado', 'joaoemailcom');


-- Teste de preço negativo:
-- INSERT INTO Produtos (titulo, preco)
-- VALUES ('Erro', -10);


-- =====================================================
-- 6. TESTES VÁLIDOS
-- Estes comandos devem ser aceites pela base de dados.
-- =====================================================

-- INSERT INTO Utilizadores (nome, email)
-- VALUES ('Teste Certo', 'joao@email.com');
