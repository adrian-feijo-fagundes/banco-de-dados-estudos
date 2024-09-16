DDL - DATA DEFINITION LANGUAGUE

USE aula1107;


CRIAR ALTERAR EXCLUIR BANCO DE DADOS
----------------------------------------------
CREATE TABLE IF NOT EXISTS clientes {
    -- coluna / tipo de dado / restrição
    idClientes INT PRYMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(100)
};

----------------------------------------------
ALTER TABLE clientes
ADD email VARCHAR(100);
----------------------------------------------
ALTER TABLE clientes
MODIFY email TEXT;
----------------------------------------------
ALTER TABLE clientes
CHANGE COLUMN email emailCliente VARCHAR(256);
----------------------------------------------
ALTER TABLE clientes
DROP COLUMN telefone;
----------------------------------------------
ALTER TABLE clientes
RENAME TO Clientes;
----------------------------------------------
DROP TABLE clientes;