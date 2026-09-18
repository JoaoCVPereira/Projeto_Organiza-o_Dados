-- =====================================================
-- HORA 50 - VISTA DE HANDOFF DO SISTEMA
-- Engenheiro de Transição Cloud
-- UFCD 10797 - Gestão e Armazenamento de Dados
-- =====================================================


-- =====================================================
-- 1. CRIAR VISTA DE TRANSIÇÃO E HANDOFF
-- =====================================================

CREATE OR REPLACE VIEW v_handoff_sistema AS

SELECT
    'Consola Principal' AS recurso,
    'https://console.neon.tech (Projeto da Organização)' AS localizacao,
    'Acesso atribuído aos administradores via e-mail corporativo.' AS procedimento

UNION ALL

SELECT
    'Manual Operacional',
    'Saved Query: 00_INSTRUCOES / View: v_instrucoes_equipa',
    'Consulta direta no SQL Editor para resolução autónoma de dúvidas.'

UNION ALL

SELECT
    'Recuperação por Ponto no Tempo (PITR)',
    'Neon Console -> Menu Branches -> Select Time',
    'Permite reverter a base de dados para um ponto anterior em caso de erro crítico.'

UNION ALL

SELECT
    'Relatórios de Negócio',
    'Microsoft Power BI / Excel via SSL (sslmode=require)',
    'Ligação encriptada com o papel leitor_relatorios.';


-- =====================================================
-- 2. CONCEDER PERMISSÃO DE LEITURA
-- =====================================================

GRANT SELECT ON v_handoff_sistema TO PUBLIC;


-- =====================================================
-- 3. CONSULTAR A VISTA DE HANDOFF
-- =====================================================

SELECT *
FROM v_handoff_sistema;
