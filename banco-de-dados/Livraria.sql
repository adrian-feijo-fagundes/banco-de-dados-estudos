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