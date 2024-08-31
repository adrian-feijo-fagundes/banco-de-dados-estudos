-- Tabela Niveis
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

