CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY ,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATE    
);

CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY ,
    nome VARCHAR(100),
    descricao VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT    
);
--3
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY ,
    id_cliente INT,
    data_pedido DATE,
    estado VARCHAR(100),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
);
--4
CREATE TABLE IF NOT EXISTS itens_pedido (
    id_itens_pedido INT AUTO_INCREMENT PRIMARY KEY ,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2)
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
);



--Insira pelo menos 5 registros na tabela clientes.

INSERT IGNORE INTO clientes (nome, email, telefone, data_cadastro) VALUES
( 'Adrian','adrian@email.com', '+5551988887777', '2024-03-10'),
( 'João','joao@email.com', '+5551988887733', '2024-04-10'),
( 'Matheus','matheus@email.com', '+5551988887766', '2024-03-10'),
( 'Carlos','carlos@email.com', '+5551988887755', '2024-05-10'),
( 'Fabio','fabio@email.com', '+5551988887744', '2024-06-10');
--Insira pelo menos 5 registros na tabela produtos.
INSERT IGNORE INTO produtos (nome, descricao, preco, estoque) VALUES
( 'Smartphone SG','', 1200, 100),
( 'Playstation 5','', 4000, 100),
( 'Iphone','', 3000, 100),
( 'XBOX ONE','', 1000, 100),
( 'Fone','', 100, 100);

--Insira pelo menos 4 registros na tabela pedidos com clientes diferentes.
INSERT IGNORE INTO pedidos (id_cliente, data_pedido, estado) VALUES
(3, '2024-06-11', 'Válido'),
(5, '2024-06-11', 'Inválido'),
(4, '2024-06-11', 'Válido'),
(1, '2024-06-11', 'Invalido');
--Insira pelo menos 4 registros na tabela itens_pedido associando pedidos e produtos.
INSERT IGNORE INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 3, 10, 30000),
(2, 4, 12, 12000),
(3, 5, 2, 200),
(4, 1, 3, 3600);

--10. Selecione todos os registros da tabela `clientes`.
SELECT * FROM clientes;

--11. Selecione todos os registros da tabela `produtos`.
SELECT * FROM clientes;

--12. Selecione todos os registros da tabela `pedidos` e associe-os com o nome do cliente.
SELECT
    clientes.nome AS cliente, pedidos.id_pedido,
    pedidos.data_pedido, pedidos.status
    -- pedidos.*        
    -- AS (alias) (novo nome)
FROM 
    pedidos
JOIN 
    clientes ON pedidos.id_cliente = clientes.id_cliente;


--13. Selecione todos os registros da tabela `itens_pedido` e associe-os com os detalhes do pedido e do produto.
SELECT
    itens_pedido.id_itens_pedido,
    pedidos.data_pedido,
    clientes.nome AS cliente,
    produtos.nome AS produto,
    itens_pedido.quantidade,
    itens_pedido.preco_unitario
FROM
    itens_pedido
JOIN
    pedidos ON itens_pedido.id_pedido = pedidos.id_pedido
JOIN
    produtos ON itens_pedido.id_produto = produtos.id_produto
JOIN
    clientes ON pedidos.id_cliente = clientes.id_cliente;

SELECT itens_pedido.*, produto.nome AS produto, pedidos.data_pedido
FROM itens_pedido 
JOIN 
    pedidos ON itens_pedido.id_pedido = pedidos.id_pedido
JOIN
    produtos ON itens_pedido.id_produto = produtos.id_produto;

-- 5. Consultas Avançadas
-- 14. Encontre todos os pedidos feitos por um cliente específico.
SELECT clientes.nome AS cliente, pedidos.*
FROM pedidos
JOIN 
    clientes ON pedidos.id_cliente = clientes.id_cliente
WHERE
    clientes.nome = 'Adrian';
-- 15. Calcule o total de vendas de cada produto (soma dos preços multiplicados pela quantidade em `itens_pedido`).

SELECT 
    produtos.nome AS produto,
    SUM(itens_pedido.quantidade * itens_pedido.preco_unitario) AS total_vendas
FROM
    itens_pedido
JOIN
    produtos ON itens_pedido.id_produto = produtos.id_produto
GROUP BY
    produtos.nome;
--
SELECT 
    produtos.nome AS produto,
    SUM(produtos.estoque * produtos.preco) AS total
FROM
    produtos
GROUP BY
    produtos.nome;
-- 16. Liste os produtos com estoque abaixo de um valor específico.

SELECT *
FROM produtos
WHERE estoque < 20;
-- 17. Encontre os clientes que realizaram pedidos no último mês.
SELECT
    DISTINCT clientes.nome AS cliente
FROM
    pedidos
JOIN
    clientes ON pedidos.id_cliente = clientes.id
WHERE
    pedidos.data_pedido >= '2024-07-28';
-- 18. Liste o número total de pedidos realizados por cada cliente.
SELECT 
    COUNT(pedidos.id_pedido) AS total_pedidos
FROM
    pedidos
GROUP BY
    pedidos.id_cliente;

-------------------------------------------------------------------------
## 6. Atualização de Dados
--19. Atualize o preço de um produto na tabela `produtos`.
UPDATE produtos
SET preco = 2000.00
WHERE id = 2;

--20. Atualize o status de um pedido para "Concluído" na tabela `pedidos`.
UPDATE pedidos
SET status = 'Concluido'
WHERE id = 4;

--21. Atualize o telefone de um cliente na tabela `clientes`.
UPDATE clientes
SET telefone = '51 9 9999-5555'
WHERE id = 1;

## 7. Exclusão de Dados
--22. Exclua um cliente da tabela `clientes`.


--23. Exclua um produto da tabela `produtos`.


--24. Exclua todos os itens de um pedido específico da tabela `itens_pedido`.

## 8. Procedures
--25. Crie uma procedure chamada `adicionar_cliente` que insira um novo cliente na tabela `clientes` com os parâmetros `nome`, `email`, e `telefone`.
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


--26. Crie uma procedure chamada `atualizar_preco_produto` que atualize o preço de um produto na tabela `produtos` com os parâmetros `id_produto` e `novo_preco`.
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

--27. Crie uma procedure chamada `registrar_pedido` que insira um novo pedido na tabela `pedidos` com os parâmetros `id_cliente`, `data_pedido`, e `status`.
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


--28. Crie uma procedure chamada `adicionar_item_pedido` que adicione um item à tabela `itens_pedido` com os parâmetros `id_pedido`, `id_produto`, `quantidade`, e `preco_unitario`.

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

## 9. Functions
--29. Crie uma function chamada `calcular_total_pedido` que receba o `id_pedido` e retorne o total do pedido, calculando a soma dos preços multiplicados pela quantidade em `itens_pedido`.
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
END //
 
DELIMITER ;

--30. Crie uma function chamada `obter_estoque_produto` que receba o `id_produto` e retorne a quantidade em estoque.
DELIMITER //
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

--31. Crie uma function chamada `verificar_cliente_existente` que receba um `email` e retorne um valor booleano indicando se o cliente existe.
DELIMITER //
CREATE FUNCTION verificar_cliente_existente(p_email VARCHAR(255))
RETURNS BOOLEAN
 
BEGIN
    DECLARE cliente_existente BOOLEAN;
 
    SELECT COUNT(*)
    INTO cliente_existente
    FROM clientes
    WHERE email = p_email;
 
    RETURN cliente_existente > 0;
END //
 
DELIMITER;

--32. Crie uma function chamada `total_vendas_por_cliente` que receba o `id_cliente` e retorne o total de vendas realizadas por esse cliente.

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
END //
 
DELIMITER;