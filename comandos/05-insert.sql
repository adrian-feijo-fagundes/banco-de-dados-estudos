INSERT IGNORE INTO clientes (id_cliente, nome, email) VALUES
(1,'João Clieton Silva Oliveira Passos','joaozinho666@example.com'),
(2,'Mario Python','ticomiatrasdoarmario@example.com'),
(3,'J.J Santos','santojames777@example.com');


INSERT IGNORE INTO produtos (id_pedido, descricao, valor, id_cliente) VALUES
(101, 'Compra de móveis', 1500.00, 1),
(102, 'Pedido de eletronicos', 2500.00, 2),
(103, 'Servicos de instalações', 500.75, 3);

INSERT INTO cargos (titulo, departamento_id, salario) VALUES
('Gerente', 1, 8000.00),
('Assistente', 1, 4000.00),
('Analista', 2, 4500.00),
('Desenvolvedor', 3, 6000.00),
('Engenheiro', 3, 7000.00),
('Assistente', 4, 3500.00),
('Analista', 2, 4600.00),
('Estagiário', 1, 2000.00);

INSERT INTO departamentos (nome) VALUES
('Vendas'),
('Marketing'),
('TI'),
('Recursos Humanos');

INSERT INTO empregados (nome, salario, departamento_id) VALUES
('Maicou Diécson', 5000.00, 1),
('Vandercleison', 6000.00, 1),
('Kerolaine', 4000.00, 2),
('Wanderneidson', 5500.00, 3),
('Kellen', 7000.00, 3),
('Chico', 3000.00, 4),
('Greice Kelly', 4500.00, 2),
('Xonas', 3500.00, 1);

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

INSERT IGNORE INTO clientes (id_cliente, nome, email) VALUES
(1, 'João Silva', 'joao@example.com'),
(2, 'Maria Oliveira', 'maria@example.com'),
(3, 'Pedro Santos', 'pedro@example.com');

-- Inserindo valores na tabela pedidos com INSERT IGNORE INTO

INSERT IGNORE INTO pedidos (id_pedido, descricao, valor, id_cliente) VALUES
(101, 'Compra de móveis', 1500.00, 1),
(102, 'Pedido de eletrônicos', 2500.50, 2),
(103, 'Serviços de instalação', 500.75, 3);

INSERT IGNORE INTO Autores (Nome, Nacionalidade) VALUES
('Eiichiro Oda','Japonês'),
('Thomas Keneally', 'Australiano'),
('Antoine de Saint-Exupéry','Fracês');
INSERT IGNORE INTO Livros (titulo, genero, anoPublicacao, idAutor ) VALUES
('One Piece','Shounen',1997,1),
("Schindler's Ark",'Romance',1982,2)
('O Pequeno Príncipe','Infantojuvenil',1943,2)
INSERT IGNORE INTO Clientes (nome, endereco, telefone) VALUES
('Adrian', 'Rua Sete 220','+5551988887777'),
('Natan','Rua Oito 330','+5551966665555'),
('Arthur','Rua Nove 440','+5551944443333');

INSERT IGNORE INTO Emprestimos (idLivro, idCliente, dataEmprestimo, dataDevolucao) VALUES
(1,1,'2024-03-13','2024-04-13'),
(2,2,'2024-04-01','2024-05-01'),
(3,3,'2024-05-24','2024-06-24'),

INSERT INTO clientes (idCliente, nome, telefone) VALUES
(1, 'Gustavo Ribero', '98332-2820'),
(2, 'Sabadão da Silveira', '99234-5678'),
(3, 'Gnoato da Silva Deftones de Oliveira', '93234-8765');

INSERT INTO Pedidos (idCliente, numeroPedido, valorTotal, datePedido) VALUES
(1, 'P001', 250.75, '2024-07-12'),
(2, 'P002', 100.00, '2024-07-15'),
(3, 'P003', 300.50, '2024-07-20');