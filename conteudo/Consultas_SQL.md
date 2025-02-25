# Consultas SQL

## Seleção de Dados

```sql
SELECT * FROM clientes;
SELECT idClientes, nome, emailCliente FROM clientes;
```

## Filtros

```sql
SELECT * FROM Clientes WHERE idCliente = 3;
SELECT nome FROM Clientes WHERE idCliente IN (1,2);
```

## Ordenação

```sql
SELECT * FROM Clientes ORDER BY nome ASC;
```

## Limite de Resultados

```sql
SELECT * FROM clientes LIMIT 3;
```

## Junções

```sql
SELECT Clientes.idClientes, Clientes.nome, Pedidos.numeroPedido 
FROM Clientes 
INNER JOIN Pedidos ON Clientes.idClientes = Pedidos.IdCliente;
```

