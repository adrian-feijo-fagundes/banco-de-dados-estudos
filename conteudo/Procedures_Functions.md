# Procedures e Functions

## Criando Procedures

```sql
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
```

## Criando Functions

```sql
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
```

