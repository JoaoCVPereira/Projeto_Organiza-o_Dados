# Projeto Organização de Dados

## UFCD 10797 - Gestão e Armazenamento de Dados

Projeto desenvolvido no âmbito da UFCD 10797 - Gestão e Armazenamento de Dados.

O projeto consiste na criação e organização de uma base de dados PostgreSQL, utilizando o Neon PostgreSQL, com aplicação de técnicas de qualidade de dados, segurança, auditoria, otimização, recuperação e análise de informação.

---

## Objetivos

O projeto aborda os seguintes temas:

- Criação e organização de tabelas;
- Relacionamento entre tabelas;
- Chaves primárias e estrangeiras;
- Qualidade e limpeza de dados;
- Regras de validação;
- Índices e otimização;
- Gestão de permissões;
- Auditoria de alterações;
- Anonimização de dados;
- Recuperação da base de dados;
- Consultas analíticas;
- Business Intelligence;
- Documentação e versionamento.

---

## Estrutura da Base de Dados

A base de dados é constituída pelas seguintes tabelas principais:

### Utilizadores

Armazena os dados dos utilizadores.

Campos principais:

- `id`
- `nome`
- `email`

### Produtos

Armazena os produtos disponíveis.

Campos principais:

- `id`
- `titulo`
- `preco`
- `stock`

### Vendas

Regista as vendas efetuadas.

Campos principais:

- `id`
- `utilizador_id`
- `produto_id`
- `quantidade`

A tabela `Vendas` relaciona-se com as tabelas `Utilizadores` e `Produtos` através de chaves estrangeiras.

---

## Qualidade dos Dados

Foram implementadas regras para melhorar a qualidade e consistência dos dados.

Entre as regras implementadas encontram-se:

- Validação do formato dos emails;
- Impedimento de preços negativos;
- Limpeza de registos considerados inválidos;
- Utilização de restrições e chaves para garantir a integridade dos dados.

---

## Segurança

Foi criada uma role específica para leitura:

`estagiario_leitor`

Esta role possui permissão de `SELECT` sobre a tabela `Utilizadores`.

O objetivo é aplicar o princípio de separação de permissões e limitar o acesso aos dados de acordo com a função do utilizador.

---

## Auditoria

Foi implementado um sistema de auditoria através de triggers.

O sistema permite registar alterações de preços dos produtos, guardando:

- ID do produto;
- Preço anterior;
- Novo preço;
- Data da alteração.

---

## Privacidade e Anonimização

Foi criada a View:

`Vendas_Anonimas`

Esta View permite apresentar informação relacionada com vendas sem expor diretamente o nome do cliente.

Também foram estudadas técnicas de auditoria e proteção de dados no contexto da proteção de dados e RGPD.

---

---

## Disaster Recovery

O projeto possui um plano de Disaster Recovery documentado no ficheiro `disaster_recovery.md`.

O plano inclui:

- Procedimentos de backup;
- Recuperação através das funcionalidades do Neon;
- Testes de recuperação;
- Estratégia 3-2-1;
- Procedimentos para situações de emergência;
- Segurança das credenciais;
- Scripts SQL para reconstrução da estrutura da base de dados.
CREATE INDEX idx_utilizador_nome
ON Utilizadores(nome);

---

## Comunicação Executiva

A Hora 32 introduziu uma camada de comunicação executiva e capacitação operacional.

Foi criado o ficheiro `hora32_comunicacao_executiva.sql`, que contém consultas preparadas para apresentar:

- Quantidade de unidades vendidas;
- Faturação por produto;
- Estado de desempenho;
- Estado do stock.

Foi também criado o ficheiro `GUIOES_COMUNICACAO.md`, que documenta a estratégia de comunicação com a direção e a capacitação dos utilizadores.

---

## Autonomia Operacional e Visão Futura

Como parte da consolidação final do projeto, foram criados três documentos de autonomia e planeamento:

- `COMO_FUNCIONA.txt` — manual de utilização e procedimentos operacionais;

- ---

## Continuidade Cloud, Gestão de Incidentes e SLA

Na Hora 44 foi implementada uma camada de continuidade operacional para a infraestrutura PostgreSQL Cloud.

Foi criada a tabela `tb_log_incidentes`, destinada ao registo centralizado de incidentes, causas, soluções e responsáveis.

Também foram implementadas rotinas de monitorização através de `pg_stat_activity` e manutenção preventiva através de `VACUUM ANALYZE`.

Foram adicionados os seguintes ficheiros:

- `00_CONTINUIDADE_E_INCIDENTES.sql`
- `CALENDARIO_OPERACIONAL.txt`
- `PROTOCOLO_SLA.txt`

O calendário operacional define rotinas de diagnóstico, auditoria de salvaguarda e manutenção preventiva.

O protocolo SLA define os procedimentos de comunicação e gestão perante uma eventual indisponibilidade da infraestrutura Cloud.
- `O_QUE_FIZEMOS.txt` — registo das melhorias implementadas;
- `FUTURO_ORGANIZAÇÃO.txt` — roadmap tecnológico e próximos passos.

Estes documentos permitem reduzir a dependência do sistema em relação ao seu criador, facilitar a transferência de conhecimento e documentar a evolução futura da Organização.

---

## Transição Cloud e Encerramento Global

Na Hora 50 foi realizada a consolidação final da infraestrutura PostgreSQL Cloud e definido o protocolo de passagem de testemunho.

Foi criada a View:

`v_handoff_sistema`

Esta View centraliza informação relativa à consola principal, procedimentos operacionais, recuperação por ponto no tempo e acesso aos relatórios de negócio.

Foi também criada a tabela:

`tb_historico_melhorias`

Esta tabela funciona como diário de bordo para registar melhorias e acontecimentos relevantes durante a evolução da infraestrutura.

Foram adicionados os seguintes scripts:

- `v_handoff_sistema.sql`
- `limpeza_e_encerramento.sql`

Durante o encerramento foram igualmente definidos procedimentos para eliminar tabelas temporárias ou rascunhos de testes através de `DROP TABLE IF EXISTS`.

---

## Teste de Férias

Foi definido um procedimento de validação da autonomia operacional através do chamado "Teste de Férias".

O objetivo é permitir que um operador autorizado consiga consultar a documentação e os procedimentos disponíveis no Neon SQL Editor sem depender de intervenção técnica direta.

A consulta principal de handoff é:

```sql
SELECT *
FROM v_handoff_sistema;
