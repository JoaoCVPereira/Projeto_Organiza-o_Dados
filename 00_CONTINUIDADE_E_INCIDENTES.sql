-- =====================================================
-- HORA 44 - CONTINUIDADE E INCIDENTES
-- Engenheiro de Continuidade Cloud
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. CRIAR TABELA DE AUDITORIA DE INCIDENTES
-- =====================================================

CREATE TABLE IF NOT EXISTS tb_log_incidentes (
    id_incidente SERIAL PRIMARY KEY,
    data_ocorrencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao_erro TEXT NOT NULL,
    causa_raiz TEXT,
    solucao_aplicada TEXT NOT NULL,
    responsavel VARCHAR(100) NOT NULL
);


-- =====================================================
-- 2. INSERIR REGISTO DE AUDITORIA
-- =====================================================

INSERT INTO tb_log_incidentes (
    descricao_erro,
    causa_raiz,
    solucao_aplicada,
    responsavel
)
VALUES (
    'Erro de ligação à View v_vendas_ativas',
    'Credenciais expiradas',
    'Renovação de permissões da Role estagiario_leitor',
    'Administrador'
);


-- =====================================================
-- 3. CONSULTAR O DIÁRIO DE INCIDENTES
-- =====================================================

SELECT
    id_incidente,
    data_ocorrencia,
    descricao_erro,
    causa_raiz,
    solucao_aplicada,
    responsavel
FROM tb_log_incidentes
ORDER BY data_ocorrencia DESC;


-- =====================================================
-- 4. MONITORIZAÇÃO DE SESSÕES ATIVAS
-- =====================================================

SELECT
    pid,
    usename,
    state,
    query,
    age(clock_timestamp(), query_start)
FROM pg_stat_activity
WHERE state != 'idle';


-- =====================================================
-- 5. MANUTENÇÃO PREVENTIVA
-- =====================================================

VACUUM ANALYZE;
