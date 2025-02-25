# Data Definition Language (DDL)

## Criando e Alterando Bancos de Dados

```sql
CREATE DATABASE IF NOT EXISTS lojaLeo;
USE lojaLeo;
```

## Criando Tabelas

```sql
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);
```

## Alterando Tabelas

```sql
ALTER TABLE clientes ADD email VARCHAR(100);
ALTER TABLE clientes MODIFY email TEXT;
ALTER TABLE clientes CHANGE COLUMN email emailCliente VARCHAR(256);
ALTER TABLE clientes DROP COLUMN telefone;
ALTER TABLE clientes RENAME TO Clientes;
```

## Excluindo Tabelas

```sql
DROP TABLE clientes;
```

## Criando Relações

```sql
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT PRIMARY KEY,
    descricao VARCHAR(200),
    valor DECIMAL(10, 2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
```

