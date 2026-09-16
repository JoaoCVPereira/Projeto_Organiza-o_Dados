# Plano de Resiliência e Disaster Recovery

## UFCD 10797 - Gestão e Armazenamento de Dados

Este documento descreve o plano de continuidade e recuperação da base de dados do projeto Organização de Dados.

O objetivo é garantir que, em caso de falha, erro humano ou perda de dados, existe um procedimento documentado para recuperar o sistema.

---

## 1. Objetivo

O plano de Disaster Recovery tem como objetivo reduzir o impacto de situações como:

- Falha do sistema;
- Erro humano;
- Eliminação acidental de dados;
- Corrupção de informação;
- Indisponibilidade da infraestrutura;
- Necessidade de recuperar uma versão anterior da base de dados.

A recuperação deve ser realizada de forma controlada e através de procedimentos previamente testados.

---

## 2. Backup

O backup permite guardar uma cópia da estrutura e dos dados da base de dados.

Num ambiente PostgreSQL, pode ser utilizada a ferramenta `pg_dump` para realizar uma extração.

Exemplo:

```bash
pg_dump "STRING_DE_LIGAÇÃO_DA_BASE_DE_DADOS" > backup_seguro.sql
```

O ficheiro `backup_seguro.sql` contém a informação necessária para posteriormente reconstruir a base de dados.

A string de ligação não deve ser armazenada no GitHub nem partilhada publicamente.

---

## 3. Recuperação

A recuperação pode ser realizada através das funcionalidades de recuperação disponibilizadas pelo Neon, utilizando Branches e os mecanismos de recuperação temporal disponíveis.

Também são mantidos no GitHub os scripts SQL utilizados para criar e configurar a estrutura da base de dados.

Desta forma, existe documentação e uma cópia versionada da estrutura necessária para reconstruir o sistema.

---

## 4. Teste de Recuperação

Um backup só deve ser considerado válido depois de ser testado.

O procedimento de teste consiste em:

1. Criar uma cópia/branch de teste;
2. Efetuar uma alteração ou eliminação controlada;
3. Utilizar o mecanismo de recuperação;
4. Confirmar que as tabelas e os dados esperados voltaram a estar disponíveis;
5. Validar através de consultas SQL.

Exemplo de validação:

```sql
SELECT * FROM Utilizadores;

SELECT * FROM Produtos;

SELECT * FROM Vendas;
```

O objetivo do teste é confirmar que os dados podem efetivamente ser recuperados.

---

## 5. Regra 3-2-1

O plano segue o princípio 3-2-1 para reduzir o risco de perda total dos dados.

### 3 cópias

A estratégia considera:

1. Base de dados principal;
2. Cópia/backup de segurança;
3. Cópia armazenada num local externo.

### 2 suportes

Os dados devem existir em mais do que um meio de armazenamento.

### 1 cópia fora do local

Uma das cópias deve estar fora do local onde se encontra o sistema principal.

A utilização de armazenamento na Cloud permite reduzir o risco de perda simultânea das cópias devido a um incidente físico no local principal.

---

## 6. Plano de Emergência

Em caso de falha grave, devem ser seguidos os seguintes passos:

1. Identificar o problema;
2. Evitar alterações adicionais na base de dados afetada;
3. Identificar o último backup ou ponto de recuperação válido;
4. Criar uma branch de recuperação/teste;
5. Recuperar os dados;
6. Validar as tabelas e os dados;
7. Confirmar que o sistema está operacional;
8. Registar o incidente e a recuperação realizada.

---

## 7. Scripts SQL

O projeto mantém no GitHub os scripts utilizados para reconstruir a estrutura da base de dados.

Entre os principais ficheiros encontram-se:

- `setup_completo.sql`
- `limpeza.sql`
- `auditoria.sql`
- `privacidade.sql`
- `otimizacao_analitica.sql`
- `dashboard.sql`

Estes ficheiros permitem manter uma cópia versionada da estrutura e das funcionalidades desenvolvidas.

---

## 8. Segurança

As credenciais utilizadas para acesso à base de dados não devem ser colocadas no GitHub.

As strings de ligação, passwords e outras informações sensíveis devem ser mantidas fora do repositório público.

---

## 9. Conclusão

O plano de Disaster Recovery permite preparar o projeto para situações de falha ou perda de dados.

A combinação entre backups, mecanismos de recuperação do Neon e scripts SQL versionados no GitHub permite criar uma estratégia de recuperação documentada e testável.

O objetivo principal é garantir que a Organização consegue recuperar o sistema sem depender de procedimentos improvisados durante uma situação de emergência.
