# Histórico de Decisões

## Projeto Organização de Dados

**UFCD:** 10797 - Gestão e Armazenamento de Dados

Este documento regista as principais decisões técnicas tomadas durante o desenvolvimento do projeto.

---

## 1. Estrutura da Base de Dados

Foi definida uma estrutura baseada em três tabelas principais:

- `Utilizadores`
- `Produtos`
- `Vendas`

A tabela `Vendas` possui relações através de chaves estrangeiras com as tabelas `Utilizadores` e `Produtos`.

Esta estrutura permite organizar os dados de utilizadores, produtos e vendas, mantendo a integridade dos relacionamentos entre as tabelas.

---

## 2. Qualidade e Limpeza dos Dados

Foram implementadas regras para melhorar a qualidade e consistência dos dados.

Foi criada uma validação para o formato dos emails dos utilizadores e uma restrição para impedir valores de preço negativos.

Também foram realizadas operações de limpeza sobre dados considerados inválidos.

O objetivo foi garantir que os dados armazenados respeitam regras mínimas de qualidade.

---

## 3. Índices e Performance

Foi criado um índice sobre o nome dos utilizadores para melhorar o desempenho de pesquisas frequentes:

```sql
CREATE INDEX idx_utilizador_nome
ON Utilizadores(nome);
```

Também foram exploradas técnicas de otimização através de índices e da utilização de `EXPLAIN ANALYZE` para analisar o desempenho das consultas.

---

## 4. Segurança e Permissões

Foi criada a role:

`estagiario_leitor`

Foi atribuída permissão de leitura sobre a tabela `Utilizadores`.

A decisão teve como objetivo aplicar uma separação de permissões, permitindo limitar o acesso aos dados de acordo com a função do utilizador.

---

## 5. Auditoria

Foi implementado um sistema de auditoria através de triggers.

O sistema permite registar automaticamente alterações de preços dos produtos, guardando o valor anterior, o novo valor e a data da alteração.

Esta abordagem permite manter um histórico das alterações realizadas nos preços dos produtos.

---

## 6. Privacidade e Anonimização

Foi criada a View:

`Vendas_Anonimas`

Esta View permite apresentar informação relacionada com vendas sem expor diretamente o nome do cliente.

Também foram estudados mecanismos de auditoria e proteção de dados no contexto da proteção de dados e do RGPD.

A decisão de utilizar uma View permite apresentar os dados necessários sem alterar diretamente a estrutura das tabelas originais.

---

## 7. Recuperação

Foram utilizadas as funcionalidades de Branches do Neon para testar cenários de recuperação.

Os scripts SQL desenvolvidos ao longo do projeto foram mantidos no GitHub para permitir a reconstrução da estrutura da base de dados.

Desta forma, o projeto possui tanto uma forma de recuperação através das funcionalidades do Neon como uma cópia versionada dos scripts necessários para reconstruir a base de dados.

---

## 8. Business Intelligence

Foi criada a View:

`Relatorio_Vendas_Mensal`

Esta View permite consultar informação agregada das vendas, incluindo a quantidade vendida e a receita total por produto.

A estrutura original da tabela `Vendas` não possui uma coluna de data. Por esse motivo, a View foi adaptada à estrutura existente, utilizando a relação entre `Vendas` e `Produtos` para calcular a quantidade vendida e a receita.

Também foi criada uma consulta para identificar produtos com stock inferior a 5 unidades.

---

## 9. Otimização das Consultas

Foram analisadas consultas e índices com o objetivo de melhorar o desempenho da base de dados.

Foi utilizado `EXPLAIN ANALYZE` para observar a forma como o PostgreSQL executa determinadas consultas.

A otimização foi realizada tendo em consideração a estrutura real da base de dados, evitando criar campos ou estruturas que não fossem necessários para o projeto.

---

## 10. Versionamento

O projeto foi desenvolvido utilizando Git e GitHub.

O versionamento permite manter o histórico das alterações realizadas durante o desenvolvimento e facilita a manutenção e recuperação dos scripts.

Os ficheiros SQL foram organizados por diferentes etapas do projeto, permitindo identificar mais facilmente as funcionalidades implementadas.

---

## 11. Documentação

Foi criado o ficheiro `README.md` para apresentar uma visão geral do projeto, incluindo:

- Objetivos;
- Estrutura da base de dados;
- Segurança;
- Auditoria;
- Privacidade;
- Otimização;
- Business Intelligence;
- Recuperação;
- Tecnologias utilizadas.

Foi criado também este ficheiro, `HISTORICO_DECISOES.md`, para registar as principais decisões técnicas tomadas durante o desenvolvimento.

---

## 12. Versão Final

Após a conclusão das tarefas previstas, o projeto foi consolidado na versão:

`v1.0`

Esta versão representa a entrega final do projeto desenvolvido no âmbito da UFCD 10797 - Gestão e Armazenamento de Dados.

---

## 13. Disaster Recovery e Resiliência

Foi criado um plano de Disaster Recovery para preparar o sistema para situações de falha, erro humano ou perda de dados.

O plano documenta os procedimentos de backup, recuperação e teste de recuperação.

Foram consideradas as funcionalidades de recuperação disponibilizadas pelo Neon, juntamente com os scripts SQL mantidos no GitHub para permitir a reconstrução da estrutura da base de dados.

Também foi documentada a estratégia 3-2-1 como princípio de proteção contra a perda total dos dados.

---

## 14. Comunicação Executiva e Capacitação

Foi criado um conjunto de consultas destinado a apresentar informação de gestão de forma resumida e compreensível.

O ficheiro `hora32_comunicacao_executiva.sql` apresenta informação sobre vendas, faturação, desempenho e stock.

Foi também criado o ficheiro `GUIOES_COMUNICACAO.md` para documentar a comunicação com utilizadores não técnicos e a estratégia de capacitação operacional.

A estrutura foi adaptada às tabelas existentes no projeto, uma vez que a tabela `Vendas` não possui uma coluna de data.

---

## 15. Autonomia Operacional

Foram criados três documentos finais destinados a garantir a continuidade e transferência de conhecimento:

- `COMO_FUNCIONA.txt`
- `O_QUE_FIZEMOS.txt`
- `FUTURO_ORGANIZAÇÃO.txt`

O `COMO_FUNCIONA.txt` documenta os procedimentos necessários para consultar e manter o sistema.

O `O_QUE_FIZEMOS.txt` regista as principais melhorias implementadas durante o projeto.

O `FUTURO_ORGANIZAÇÃO.txt` apresenta um roadmap para futuras melhorias tecnológicas.

A decisão de separar estes conteúdos em documentos próprios permite facilitar a utilização do sistema por outros colaboradores e reduzir a dependência do conhecimento individual.
