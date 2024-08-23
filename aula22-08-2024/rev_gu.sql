EXERCICIOS DE REVISÃO
 
----------------------------------------------------------------
 
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20),
    data_cadastro DATE
);
 
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT
);
 
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);
 
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);
 
-----------------------------------------------------------
 
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES
('Gustavo Ribeiro', 'gustavo.ribeiro@email.com', '99833-2820', '2024-08-22'),
('Natan Wildner', 'natan.wildner@email.com', '92556-2642', '2024-08-21'),
('Arthur Manske', 'arthur.manske@email.com', '93459-3283', '2024-08-22'),
('Maria Eduarda', 'maria.eduarda@email.com', '91356-0875', '2024-08-23'),
('Lucas Tavares', 'lucas.tavares@email.com', '92349-5030', '2024-08-24');
 
 
INSERT INTO produtos (nome, descricao, preco, estoque)
VALUES
('Notebook', 'Notebook com 16GB RAM e 512GB SSD', 4500.00, 10),
('Smartphone', 'Smartphone com 8GB RAM e 128GB armazenamento', 2500.00, 15),
('Teclado Mecânico', 'Teclado mecânico RGB', 350.00, 30),
('Mouse Gamer', 'Mouse gamer com 16000 DPI', 150.00, 25),
('Monitor 24"', 'Monitor Full HD 24 polegadas', 800.00, 20);
 
 
INSERT INTO pedidos (id_cliente, data_pedido, status)
VALUES
(1, '2024-08-28', 'Enviado'),
(2, '2024-08-29', 'Processando'),
(3, '2024-08-26', 'Entregue'),
(4, '2024-08-27', 'Enviado');
 
 
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 4500.00),  -- Pedido Gustavo Ribeiro: 1 Notebook
(1, 3, 2, 350.00),  
(2, 2, 1, 2500.00),
(2, 4, 1, 150.00),  
(3, 5, 2, 800.00),  
(4, 1, 1, 4500.00);  
 
-------------------------------------------------------------------
 
-- Todos os registros da tabela clientes
SELECT * FROM clientes;
 
-- Todos os registros da tabela produtos
SELECT * FROM produtos;
 
-- Selecionar todos os registros da tabela pedidos com o nome do cliente
SELECT
    pedidos.id,
    clientes.nome AS cliente,
    pedidos.data_pedido,
    pedidos.status
FROM
    pedidos
JOIN
    clientes ON pedidos.id_cliente = clientes.id;
 
-- Mostra ID, Cliente, Data do Pedido e Status do Pedido
 
-- Todos os registros da tabela itens_pedido  com os detalhes do pedido e do produto
SELECT
    itens_pedido.id,
    pedidos.data_pedido,
    clientes.nome AS cliente,
    produtos.nome AS produto,
    itens_pedido.quantidade,
    itens_pedido.preco_unitario
FROM
    itens_pedido
JOIN
    pedidos ON itens_pedido.id_pedido = pedidos.id
JOIN
    produtos ON itens_pedido.id_produto = produtos.id
JOIN
    clientes ON pedidos.id_cliente = clientes.id;
 
-- Mostra o ID , a Data do pedido, Cliente, Produto, Quantidade e Preço Unitario
 
--------------------------------------------------------------------
SELECT
    pedidos.id,
    clientes.nome AS cliente,
    pedidos.data_pedido,
    pedidos.status
FROM
    pedidos
JOIN
    clientes ON pedidos.id_cliente = clientes.id
WHERE
    clientes.nome = 'Gustavo Ribeiro';
 
--------------------------------------------
SELECT
    produtos.nome AS produto,
    SUM(itens_pedido.quantidade * itens_pedido.preco_unitario) AS total_vendas
FROM
    itens_pedido
JOIN
    produtos ON itens_pedido.id_produto = produtos.id
GROUP BY
    produtos.nome;
 
----------------------------------
SELECT
    *
FROM
    produtos
WHERE
    estoque < 20;
 
------------------------------------
SELECT
    DISTINCT clientes.nome AS cliente
FROM
    pedidos
JOIN
    clientes ON pedidos.id_cliente = clientes.id
WHERE
    pedidos.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
 
----------------------
SELECT
    clientes.nome AS cliente,
    COUNT(pedidos.id) AS total_pedidos
FROM
    pedidos
JOIN
    clientes ON pedidos.id_cliente = clientes.id
GROUP BY
    clientes.nome;
 
------------------------------------------------
UPDATE produtos
SET preco = 5000.00
WHERE id = 1;
 
UPDATE pedidos
SET status = 'Entregue'
WHERE id = 1;
 
UPDATE clientes
SET telefone = '998036-2332'
WHERE id = 1;
 
--------------------------------------------------
DELETE FROM itens_pedido
WHERE id_pedido IN (
    SELECT id
    FROM pedidos
    WHERE id_cliente = 3
);
 
DELETE FROM pedidos
WHERE id_cliente = 3;
 
DELETE FROM clientes
WHERE id = 3;
 
DELETE FROM itens_pedido
WHERE id_produto = 3;
 
DELETE FROM produtos
WHERE id = 3;
 
DELETE FROM itens_pedido
WHERE id = 3;
 
 
--------------------------------------------------
DELIMITER //
 
CREATE PROCEDURE adicionar_cliente(
    IN p_nome VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_telefone VARCHAR(20)
)
BEGIN
    INSERT INTO clientes (nome, email, telefone, data_cadastro)
    VALUES (p_nome, p_email, p_telefone, CURDATE());
END //
 
DELIMITER ;
 
CALL adicionar_cliente('João Robertão', 'joao.robertão@email.com', '91145-0034');
 
--------------------------------------------
DELIMITER //
 
CREATE PROCEDURE atualizar_preco_produto(
    IN p_id_produto INT,
    IN p_novo_preco DECIMAL(10, 2)
)
BEGIN
    UPDATE produtos
    SET preco = p_novo_preco
    WHERE id = p_id_produto;
END //
 
DELIMITER ;
 
CALL atualizar_preco_produto(1, 6000.00);
 
--------------------------------------------------
DELIMITER //
 
CREATE PROCEDURE registrar_pedido(
    IN p_id_cliente INT,
    IN p_data_pedido DATE,
    IN p_status VARCHAR(50)
)
BEGIN
    INSERT INTO pedidos (id_cliente, data_pedido, status)
    VALUES (p_id_cliente, p_data_pedido, p_status);
END //
 
DELIMITER ;
 
CALL registrar_pedido(1, '2024-08-30', 'Pendente');
 
------------------------------------------------------
DELIMITER //
 
CREATE PROCEDURE adicionar_item_pedido(
    IN p_id_pedido INT,
    IN p_id_produto INT,
    IN p_quantidade INT,
    IN p_preco_unitario DECIMAL(10, 2)
)
BEGIN
    INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
    VALUES (p_id_pedido, p_id_produto, p_quantidade, p_preco_unitario);
END //
 
DELIMITER ;
 
CALL adicionar_item_pedido(1, 2, 3, 3500.00); --Adiciona 3 unidades do produto com ID 2 ao pedido com ID 1, a um preço unitário de 3500.00
 
-----------------------------------------------------
DELIMITER //
CREATE FUNCTION calcular_total_pedido(p_id_pedido INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
 
    SELECT SUM(preco_unitario * quantidade)
    INTO total
    FROM itens_pedido
    WHERE id_pedido = p_id_pedido;
 
    RETURN total;  
END//
 
DELIMITER ;
 
SELECT calcular_total_pedido(1) AS total_pedido;
 
-----------------------------------
DELIMITER//
CREATE FUNCTION obter_estoque_produto(p_id_produto INT)
RETURNS INT
 
BEGIN
    DECLARE estoque INT;
 
    SELECT estoque
    INTO estoque
    FROM produtos
    WHERE id = p_id_produto;
 
    RETURN estoque;
END//
 
DELIMITER;
 
SELECT obter_estoque_produto(2) AS estoque_produto;
 
---------------------------------
DELIMITER//
CREATE FUNCTION verificar_cliente_existente(p_email VARCHAR(255))
RETURNS BOOLEAN
 
BEGIN
    DECLARE cliente_existente BOOLEAN;
 
    SELECT COUNT(*)
    INTO cliente_existente
    FROM clientes
    WHERE email = p_email;
 
    RETURN cliente_existente > 0;
END//
 
DELIMITER;
 
SELECT verificar_cliente_existente('gustavo.ribeiro@gmail.com') AS cliente_existe;
 
---------------------------------------
DELIMITER//
CREATE FUNCTION total_vendas_por_cliente(p_id_cliente INT)
RETURNS DECIMAL(10, 2)
 
BEGIN
    DECLARE total_vendas DECIMAL(10, 2);
 
    SELECT SUM(itens_pedido.preco_unitario * itens_pedido.quantidade)
    INTO total_vendas
    FROM pedidos
    JOIN itens_pedido ON pedidos.id = itens_pedido.id_pedido
    WHERE pedidos.id_cliente = p_id_cliente;
 
    RETURN total_vendas;
END//
 
DELIMITER;
 
SELECT total_vendas_por_cliente(2) AS total_vendas_cliente;