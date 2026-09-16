-- =====================================================
-- HORA 8 - O GRANDE FINAL
-- Script de Instalação da Organização v1.0
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. LIMPEZA TOTAL
-- =====================================================

DROP TABLE IF EXISTS Vendas;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Utilizadores;


-- =====================================================
-- 2. CRIAÇÃO DA ESTRUTURA
-- =====================================================

-- Tabela de Utilizadores
CREATE TABLE Utilizadores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);


-- Tabela de Produtos
CREATE TABLE Produtos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
    preco DECIMAL(10, 2),
    stock INT
);


-- Tabela de Vendas
CREATE TABLE Vendas (
    id SERIAL PRIMARY KEY,
    utilizador_id INT REFERENCES Utilizadores(id),
    produto_id INT REFERENCES Produtos(id),
    quantidade INT
);


-- =====================================================
-- 3. OTIMIZAÇÃO
-- =====================================================

CREATE INDEX idx_utilizador_nome
ON Utilizadores(nome);


-- =====================================================
-- 4. SEGURANÇA
-- =====================================================

CREATE ROLE estagiario_leitor;

GRANT SELECT ON Utilizadores
TO estagiario_leitor;


-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
