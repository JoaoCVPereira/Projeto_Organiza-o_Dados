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

## Índices e Otimização

Foram criados índices para melhorar o desempenho das consultas.

Um dos índices implementados foi:

```sql
CREATE INDEX idx_utilizador_nome
ON Utilizadores(nome);
