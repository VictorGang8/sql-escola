-- Banco da escola
CREATE DATABASE escola_join;
USE escola_join;
 
-- Turmas
CREATE TABLE turma (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(10) NOT NULL,
  turno VARCHAR(10) NOT NULL
);
 
-- Alunos: turma_id aponta para turma(id)
CREATE TABLE aluno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  nota DECIMAL(4,1) NOT NULL,
  turma_id INT NOT NULL,
  FOREIGN KEY (turma_id) REFERENCES turma(id)
);
 
INSERT INTO turma (nome, turno) VALUES
  ('1A', 'Manhã'),
  ('1B', 'Tarde'),
  ('2A', 'Noite');
 
INSERT INTO aluno (nome, nota, turma_id) VALUES
  ('Ana', 8.5, 1),
  ('Bruno', 6.0, 1),
  ('Carla', 7.0, 2),
  ('Diego', 4.5, 2),
  ('Elisa', 9.0, 1),
  ('Fábio', 5.5, 2),
  ('Gabi', 10.0, 1),
  ('Hugo', 7.5, 2);
 
SELECT * FROM aluno;
SELECT * FROM turma;

-- Mostre o nome de cada aluno e o nome da turma dele.
SELECT aluno.nome, turma.nome
FROM aluno
INNER JOIN turma ON aluno.turma_id = turma.id;

-- Mostre o nome e a nota dos alunos da turma 1B.
SELECT aluno.nome, aluno.nota
FROM aluno
INNER JOIN turma
ON aluno.turma_id = turma.id
WHERE turma.nome = '1B';

-- Mostre os alunos do turno da Manhã com nota 8 ou mais. (WHERE com AND)
SELECT aluno.nome, aluno.nota
FROM aluno
INNER JOIN turma ON aluno.turma_id = turma.id
WHERE turma.turno = 'Manhã' AND aluno.nota >= 8;

-- Mostre aluno, turma e nota das 3 maiores notas. (ORDER BY e LIMIT)
SELECT aluno.nome, turma.nome, aluno.nota
FROM aluno -- principal
INNER JOIN turma -- SECUNDÁRIA
ON aluno.turma_id = turma.id
ORDER BY aluno.nota DESC
LIMIT 3;

-- Quantos alunos estudam no turno da tarde? (COUNT)
SELECT COUNT(*)
FROM aluno -- principal
INNER JOIN turma -- secundaria
ON aluno.turma_id = turma.id
WHERE turma.turno = "Tarde";

-- Quais são os tipos de turma
SELECT DISTINCT turma.nome
FROM aluno
INNER JOIN turma
ON aluno.turma_id = turma.id;