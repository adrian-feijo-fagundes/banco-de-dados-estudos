USE tdssl241n_adrianfeijofagundes;
ALTER TABLE Livros CHANGE titulo titulo VARCHAR(100) NOT NULL;

UPDATE Livros
SET titulo = 'One Piece'
WHERE idLivro = 1;

UPDATE Livros
SET titulo = "Schindler's Ark"
WHERE idLivro = 2;

UPDATE Livros
SET titulo = 'O Pequeno Príncipe'
WHERE idLivro = 3;


----------------------------------
USE tdssl241n_adrianfeijofagundes;

ALTER TABLE Autores
ADD COLUMN dataNascimento DATE,
ADD COLUMN biografia TEXT;
ALTER TABLE Livros
ADD COLUMN editora VARCHAR(30),
ADD COLUMN numeroPaginas INT,
ADD COLUMN idioma VARCHAR(30);
ALTER TABLE Clientes
ADD COLUMN email VARCHAR(320),
ADD COLUMN dataDeNascimento DATE;
ALTER TABLE Emprestimos
ADD COLUMN dataPrevistaDevolucao DATE,
ADD COLUMN stat VARCHAR(10);
---------------------------------
