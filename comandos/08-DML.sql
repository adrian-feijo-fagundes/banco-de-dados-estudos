


-- Selecionando a soma dos valores totais dos pedidos ALAIAS
SELECT SUM(valorTotal) as valor_total_pedidos FROM Pedidos;


-- Calcula o valor médio
SELECT AVG(valorTotal) AS valor_medio_pedidos FROM Pedidos;

-- Encontra o pedido com o valor mais alto
-- Nesse caso verifira o valor do pedido o número na VARCHAR() (ORDEM ALFABÉTICA)
SELECT MAX(numeroPedido) AS pedido_com_numero_mais_alto FROM Pedidos;

SELECT MIN(numeroPedido) AS pedido_com_numero_mais_baixo FROM Pedidos;

SELECT COUNT(*) FROM Pedidos;
-- JOIN
-- CONSULTA COM JUNÇÃO DE TABELAS

SELECT Clientes.idClientes, Clientes.nome, Clientes.emailCliente, Pedidos.numeroPedido 
FROM Clientes 
INNER JOIN Pedidos ON Clientes.idClientes = Pedidos.IdCliente;

-- SELECIONA CLIENTES E SEUS PEDIDOS CORRESPONDENTES USANDO UMA JUNÇÃO ENTRE A TABELA CLIENTE E PEDIDOS. NESTE EXEMPLO, INNER JOIN COMBINA REGISTROS DE AMBAS AS TABELAS ONDE EXISTEM CORRESPONDENCIAS ENTRE OS CAMPOS IDCLIENTE


-- Consulta com junção externa
-- Retorna até os que não tem correspondencia

SELECT Clientes.idClientes, Clientes.nome, Pedidos.numeroPedido 
FROM Clientes 
LEFT JOIN Pedidos ON Clientes.idClientes = Pedidos.IdCliente;


-- Consulta com junção CONDICIONAL

SELECT Clientes.idClientes, Clientes.nome, Clientes.emailCliente, Pedidos.numeroPedido, Pedidos.valorTotal 
FROM Clientes 
INNER JOIN Pedidos ON Clientes.idClientes = Pedidos.IdCliente
WHERE Pedidos.valorTotal > 200;



SELECT Clientes.nome, COUNT(Pedidos.idPedido) AS total_pedidos
FROM Clientes 
INNER JOIN Pedidos ON Clientes.idClientes = Pedidos.IdCliente
GROUP BY Clientes.nome;

SELECT CLIENTES.Nome, COUNT(Pedidos.ID_Pedido) AS total_pedidos, SUM(Pedidos.ValorTotal) AS valortotal_gasto
FROM CLIENTES 
INNER JOIN Pedidos ON CLIENTES.ID_Cliente = Pedidos.id_Cliente
GROUP BY CLIENTES.Nome;