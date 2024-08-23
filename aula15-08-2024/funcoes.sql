DELIMITER //

CREATE FUNCTION CalcularSalarioBruto(
    emp_id INT
)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE salario1 DECIMAL(10,2);

    -- Obtém o salário do cargo do empregado com o ID fornecido
    SELECT cargos.salario 
    INTO salario1
    FROM empregados
    JOIN cargos ON empregados.titulo = cargos.titulo AND empregados.departamento_id = cargos.departamento_id
    WHERE empregados.empregados_id = emp_id;

    -- Retorna o salário
    RETURN salario1;
END //

DELIMITER ;



DROP FUNCTION IF EXISTS nome_da_funcao;
DROP PROCEDURE IF EXISTS nome_do_procedimento;

 
 
-- 01 SALARIO ANUAL

DELIMITER //

CREATE FUNCTION CalcularSalarioAnual(
    emp_id INT
)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE salario1 DECIMAL(10,2);

    -- Obtém o salário do cargo do empregado com o ID fornecido
    SELECT cargos.salario 
    INTO salario1
    FROM empregados
    JOIN cargos ON empregados.titulo = cargos.titulo AND empregados.departamento_id = cargos.departamento_id
    WHERE empregados.empregados_id = emp_id;

    -- Retorna o salário
    RETURN salario1 * 12;
END //

DELIMITER ;


-- 02 contar empregados

DELIMITER //

CREATE FUNCTION ContPorDep(
    dep_id INT
)
RETURNS INT
BEGIN
    DECLARE numeroempregados INT;


    SELECT COUNT(empregados.nome)
    INTO numeroempregados
    FROM empregados
    WHERE departamento_id = dep_id;

    RETURN numeroempregados;
END //

DELIMITER ;

SELECT departamentos.nome, COUNT(empregados.departamento_id) AS total 
FROM departamentos 
INNER JOIN empregados ON departamentos.departamento_id = empregados.departamento_id 
GROUP BY departamentos.nome;
