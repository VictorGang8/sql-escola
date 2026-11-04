# 📚 Gestão Escolar - Consultas e Relacionamentos em SQL

Este repositório contém os scripts de criação, povoamento e consultas SQL para o banco de dados **`escola_join`**, desenvolvido utilizando o **MySQL Workbench**. 

O projeto exemplifica a modelagem de um banco de dados relacional entre turmas e alunos, cobrindo o uso de chave estrangeira (`FOREIGN KEY`), junções de tabelas (`INNER JOIN`), filtros compostos (`WHERE`, `AND`), ordenação e limitação (`ORDER BY`, `LIMIT`), além de funções agregadas e de distinção (`COUNT`, `DISTINCT`).

---

## 🛠️ Tecnologias Utilizadas

* **Banco de Dados:** MySQL
* **SGBD / IDE:** MySQL Workbench
* **Linguagem:** SQL (DDL e DML)

---

## 🗄️ Estrutura do Banco de Dados

O modelo relacional é composto por duas tabelas associadas em uma relação **1 para N** (Uma turma possui múltiplos alunos, e cada aluno pertence a uma única turma):

* **`turma`**: Registra as turmas disponíveis (`id`, `nome`, `turno`).
* **`aluno`**: Registra os alunos matriculados (`id`, `nome`, `nota`, `turma_id`).

---

## 📜 Script de Criação e Povoamento

```sql
-- Criação do banco de dados
CREATE DATABASE escola_join;
USE escola_join;

-- Tabela de Turmas
CREATE TABLE turma (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(10) NOT NULL,
  turno VARCHAR(10) NOT NULL
);

-- Tabela de Alunos (Chave Estrangeira apontando para turma)
CREATE TABLE aluno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  nota DECIMAL(4,1) NOT NULL,
  turma_id INT NOT NULL,
  FOREIGN KEY (turma_id) REFERENCES turma(id)
);

-- Inserção de Turmas
INSERT INTO turma (nome, turno) VALUES
  ('1A', 'Manhã'),
  ('1B', 'Tarde'),
  ('2A', 'Noite');

-- Inserção de Alunos
INSERT INTO aluno (nome, nota, turma_id) VALUES
  ('Ana', 8.5, 1),
  ('Bruno', 6.0, 1),
  ('Carla', 7.0, 2),
  ('Diego', 4.5, 2),
  ('Elisa', 9.0, 1),
  ('Fábio', 5.5, 2),
  ('Gabi', 10.0, 1),
  ('Hugo', 7.5, 2);
