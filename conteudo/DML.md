# Data Manipulation Language (DML)

## Inserindo Dados

```sql
INSERT INTO Clientes (idClientes, nome, emailCliente)
VALUES (1, 'João Silva', 'joao.silva@email.com');
```

## Atualizando Dados

```sql
UPDATE Clientes
SET emailCliente = 'novo.email@email.com'
WHERE idCliente = 1;
```

## Deletando Dados

```sql
DELETE FROM Clientes WHERE idCliente = 1;
```

