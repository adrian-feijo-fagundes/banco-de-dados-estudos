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