CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    numeroPedido VARCHAR(50),
    valorTotal DECIMAL(10,2),
    datePedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idClientes)
);
CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE empregados (
    empregados_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);
CREATE TABLE cargos (
    cargos_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    departamento_id INT,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

USE loja_adrian;

CREATE TABLE IF NOT EXISTS produtos (
	id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco_unitario DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
	id_itens_pedido INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE IF NOT EXISTS pagamentos (
	id_pagamento INT PRIMARY KEY,
    id_pedido INT,
    metodo_pagamento VARCHAR(50),
    valor DECIMAL(10,2),
    data_de_pagamento DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);

CREATE DATABASE IF NOT EXISTS loja;

USE loja 

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT PRIMARY KEY
	nome VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
CREATE TABLE IF NOT EXISTS Autores (
    idAutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Livros (
    idLivro INT PRIMARY KEY AUTO_INCREMENT,
    titulo INT NOT NULL,
    genero VARCHAR(100),
    anoPublicacao INT,
    idAutor INT,
    FOREIGN KEY (idAutor) REFERENCES Autores(idAutor)
);
CREATE TABLE IF NOT EXISTS Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS Emprestimos (
    idEmprestimo INT PRIMARY KEY AUTO_INCREMENT,
    idLivro INT,
    idCliente INT,
    dataEmprestimo DATE,
    dataDevolucao DATE,
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);
CREATE TABLE Niveis (
    nivel INT PRIMARY KEY,
    descricao VARCHAR(50),
    bonus_forca INT,
    bonus_agilidade INT
);

-- Tabela Jogadores
CREATE TABLE Jogadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    nivel INT,
    FOREIGN KEY (nivel) REFERENCES Niveis(nivel)
);

-- Tabela Atributos_Jogadores
CREATE TABLE Atributos_Jogadores (
    jogador_id INT PRIMARY KEY,
    forca INT,
    agilidade INT,
    FOREIGN KEY (jogador_id) REFERENCES Jogadores(id)
);

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

CREATE TABLE IF NOT EXISTS departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS empregados (
    empregados_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos (departamento_id)
);

CREATE TABLE IF NOT EXISTS Autores (
    idAutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Livros (
    idLivro INT PRIMARY KEY AUTO_INCREMENT,
    titulo INT NOT NULL,
    genero VARCHAR(100),
    anoPublicacao INT,
    idAutor INT,
    FOREIGN KEY (idAutor) REFERENCES Autores(idAutor)
);
CREATE TABLE IF NOT EXISTS Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS Emprestimos (
    idEmprestimo INT PRIMARY KEY AUTO_INCREMENT,
    idLivro INT,
    idCliente INT,
    dataEmprestimo DATE,
    dataDevolucao DATE,
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)

);