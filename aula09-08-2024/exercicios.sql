-- 1) Escreva uma consulta SQL para selecionar o departamento_id e a soma dos salários para cada departamento. Filtre os departamentos onde a soma total dos salários é maior que R$ 12.000,00.

SELECT departaSUM() AS 
FROM 
GROUP BY
HAVING SUM()


-- 2) Escreva uma consulta SQL para selecionar o titulo e o número de empregados para cada título. Filtre os títulos onde há mais de 2 empregados.

SELECT titulo, COUNT(empregados_id) AS numero_empregados 
FROM empregados
GROUP BY titulo
HAVING COUNT(empregados_id) > 2;
-- 3) Escreva uma consulta SQL para selecionar o departamento_id e a média dos salários para cada departamento. Filtre os departamentos onde a média salarial é maior que R$ 4.500,00.

-- 4) Escreva uma consulta SQL para selecionar o departamento_id e o maior salário para cada departamento. Filtre os departamentos onde o maior salário é superior a R$ 6.000,00.

-- 5) Escreva uma consulta SQL para selecionar o departamento_id e o menor salário para cada departamento. Filtre os departamentos onde o menor salário é superior a R$ 2.500,00.