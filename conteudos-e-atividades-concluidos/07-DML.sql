DATA MANIPULATION LANGUAGUE

INSERT INTO Clientes (idClientes, nome, emailCliente)
VALUES (1, 'João Silva', 'joao.silva@email.com');

UPDATE Clientes
SET emailCliente = 'novo.email@email.com'
WHERE idCliente = 1; -- condição

DELETE FROM Clientes
WHERE idCliente = 1;


----------------------------------------------------------
-- CONSULTAS

SELECT idClientes, nome, emailCliente
FROM clientes;
SELECT *
FROM clientes;

-- CONSULTA COM FILTRO
SELECT *
FROM Clientes
WHERE idCliente = 3

SELECT nome
FROM Clientes
WHERE idCliente IN (1,2)


SELECT *
FROM Clientes
ORDER BY nome ASC -- OU DESC

SELECT *
FROM Clientes
WHERE nome = 'Adrian'
ORDER BY nome ASC

SELECT *
FROM clientes;
LIMIT 3;

-- CONSULTA DE VALORES UNICOS
SELECT DISTINCT email
FROM Clientes;


---------------------
SELECT departamento_id FROM departamentos WHERE localizacao = 'São Paulo';


SELECT nome, departamento_id 
FROM empregados
WHERE departamento_id IN (SELECT departamento_id FROM departamentos WHERE localizacao = 'São Paulo');


SELECT salario FROM empregados WHERE departamento_id = (SELECT departamento_id FROM departamentos WHERE nome = 'TI');


SELECT nome, salario
FROM empregados
WHERE salario > ANY (SELECT salario FROM empregados WHERE departamento_id = (SELECT departamento_id FROM departamentos WHERE nome = 'TI'));