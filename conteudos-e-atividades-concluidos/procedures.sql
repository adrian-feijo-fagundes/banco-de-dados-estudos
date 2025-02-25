Procedimentos Armazenados no MySQL

DELIMETER // (TROCA O DELIMITADOR)

CREATE PROCEDURE nome_do_procedimento (parametros) 

BEGIN



END //

DELIMETER ; 



DELIMITER //

CREATE PROCEDURE AumentarSalario (
    IN dep_id INT,
    IN percentual DECIMAL(5,2)
)
BEGIN
    UPDATE cargos
    SET salario = salario + (salario * (percentual / 100))
    WHERE departamento_id = dep_id;

END //

DELIMITER ;

CALL

--------------------------------------------
### 1. **🆕 Procedimento para Inserir Novo Empregado**

Crie um procedimento armazenado para inserir um novo empregado na tabela `empregados`. 

DELIMITER //

CREATE PROCEDURE addEmpregado (
    IN dep_id INT,
    IN namep VARCHAR(100),
    IN titulop varchar(100)
)
BEGIN
    INSERT INTO empregados (departamento_id, nome, titulo) VALUES 
    (dep_id, namep, titulop);
END
DELIMITER ;

### 2. **❌ Procedimento para Excluir Empregado**

Crie um procedimento que permita a exclusão de um empregado com base no `empregados_id`. 

DELIMITER //
CREATE PROCEDURE deleteEmpregado (
    IN e_id INT
)
BEGIN
	DELETE FROM empregados WHERE departamento_id = e_id;
END //
DELIMITER ;

### 3. **🔄 Procedimento para Atualizar Título de Empregado**

Crie um procedimento que permita atualizar o título de um empregado na tabela `empregados` com base no `empregados_id`.


DELIMITER //

CREATE PROCEDURE updateTitulo (
    IN empregado INT,
    IN titulo varchar(100)
)
BEGIN
	UPDATE empregados
    SET titulo = titulop
    WHERE empregados_id = empregado;
END //
DELIMITER ;
