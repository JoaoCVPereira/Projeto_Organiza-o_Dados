-- =====================================================
-- HORA 50 - LIMPEZA E ENCERRAMENTO
-- Engenheiro de Transição Cloud
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. CRIAR DIÁRIO DE BORDO
-- =====================================================

CREATE TABLE IF NOT EXISTS tb_historico_melhorias (
    id_melhoria SERIAL PRIMARY KEY,
    data_registo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    categoria VARCHAR(100) NOT NULL,
    descricao_melhoria TEXT NOT NULL,
    autor VARCHAR(100) NOT NULL
);


-- =====================================================
-- 2. ELIMINAR TABELAS TEMPORÁRIAS OU RASCUNHOS
-- =====================================================

DROP TABLE IF EXISTS tb_teste_resiliencia_temp;
DROP TABLE IF EXISTS tb_vendas_rascunho;


-- =====================================================
-- 3. REGISTAR A PASSAGEM DE TESTEMUNHO
-- =====================================================

INSERT INTO tb_historico_melhorias (
    categoria,
    descricao_melhoria,
    autor
)
VALUES (
    'Passagem de Testemunho',
    'Conclusão da UFCD 10797: Sistema totalmente documentado, autossuficiente, com vistas de handoff ativas e permissões delegadas.',
    'Engenheiro de Dados'
);


-- =====================================================
-- 4. CONFIRMAR O HISTÓRICO FINAL
-- =====================================================

SELECT *
FROM tb_historico_melhorias
ORDER BY id_melhoria DESC;
