# Triggers

## Criando um Trigger

```sql
DELIMITER //
CREATE TRIGGER Atualizar_Atributos
AFTER UPDATE ON Jogadores
FOR EACH ROW
BEGIN
    IF NEW.nivel > OLD.nivel THEN
        UPDATE Atributos_Jogadores aj
        JOIN Niveis n ON NEW.nivel = n.nivel
        SET aj.forca = aj.forca + n.bonus_forca,
            aj.agilidade = aj.agilidade + n.bonus_agilidade
        WHERE aj.jogador_id = NEW.id;
    END IF;
END//
DELIMITER ;
```

