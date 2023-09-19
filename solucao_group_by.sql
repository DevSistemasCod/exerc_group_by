-- 01) Liste as siglas dos departamentos e a contagem de funcionários em cada departamento.
 SELECT sigla_depto, COUNT(*) AS qtd_funcionarios
 FROM funcionario
 GROUP BY sigla_depto;
 

-- 02) Liste as siglas dos departamentos com mais de 3 funcionários.
 SELECT sigla_depto, COUNT(*) AS qtd_funcionarios
 FROM funcionario
 GROUP BY sigla_depto HAVING COUNT(*) > 3;


-- 03) Liste os 3 funcionários com os menores salários em ordem decrescente.
 SELECT nome_funcionario, salario
 FROM funcionario
 ORDER BY salario LIMIT 3;


-- 04) Liste os departamentos e os nomes dos funcionários em cada departamento, separados por ponto e vírgula.
 SELECT sigla_depto, GROUP_CONCAT(nome_funcionario SEPARATOR '; ') AS funcionarios
 FROM funcionario
 GROUP BY sigla_depto;


-- 05) Liste os departamentos com a maior contagem de funcionários, ordenados em ordem decrescente, mostrando apenas os 3 primeiros.
 SELECT sigla_depto, COUNT(*) AS qtd_funcionarios
 FROM funcionario
 GROUP BY sigla_depto
 ORDER BY qtd_funcionarios DESC LIMIT 3;


-- 06) Desafio Liste os nomes dos departamentos e a quantidade de funcionários em cada departamento.
 SELECT d.nome_depto, (
 SELECT COUNT(*) FROM funcionario 
 WHERE sigla_depto = d.sigla_depto) AS qtd_funcionarios
 FROM departamento d;


-- 07) Liste os departamentos e a quantidade de funcionários em cada departamento que têm um salário médio superior a 4000,
 SELECT d.nome_depto, COUNT(*) AS qtd_funcionarios
 FROM departamento d
 WHERE d.sigla_depto IN (
  SELECT sigla_depto 
  FROM funcionario
  GROUP BY sigla_depto
  HAVING AVG(salario) > 3790
 )
 GROUP BY d.nome_depto;