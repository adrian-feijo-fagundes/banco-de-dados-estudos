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
    estado VARCHAR(100)
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

