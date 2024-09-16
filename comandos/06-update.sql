UPDATE Livros
SET editora = 
    CASE 
        WHEN idLivro = 1 THEN 'Editora A'
        WHEN idLivro = 2 THEN 'Editora B'
        WHEN idLivro = 3 THEN 'Editora C'
        ELSE Editora  -- Manter a Editora existente para IDs não especificados
    END,
    numeroPaginas = 
    CASE
        WHEN idLivro = 1 THEN 300  -- Número de páginas do livro 1
        WHEN idLivro = 2 THEN 250  -- Número de páginas do livro 2
        WHEN idLivro = 3 THEN 100  -- Número de capítulos do mangá Vagabond
        ELSE NumeroPaginas  -- Manter o Número de Páginas existente para IDs não especificados
    END,
    idioma = 
    CASE 
        WHEN idLivro = 1 THEN "Japones"  
        WHEN idLivro = 2 THEN "Australiano"  
        WHEN idLivro = 3 THEN "Francês"  
        ELSE idioma 
    END

WHERE idLivro IN (1, 2, 3);

UPDATE Clientes
SET email =
    CASE 
        WHEN idCliente = 1 THEN 'adrianfeijofagundes@gmail.com'  
        WHEN idCliente = 2 THEN 'natan@gmail.com'  
        WHEN idCliente = 3 THEN 'arthur@gmail.com'  
        ELSE email  
    END,
    dataDeNascimento =
    CASE 
        WHEN idCliente = 1 THEN '2002-12-01' 
        WHEN idCliente = 2 THEN '2006-12-29' 
        WHEN idCliente = 3 THEN '2007-12-12' 
        ELSE dataDeNascimento  
    END
WHERE idCliente IN (1,2,3); 

UPDATE Autores
SET dataNascimento = '1975-01-01', biografia = 'famoso mangaká'
WHERE idAutor = 1;

UPDATE Autores
SET dataNascimento = '1935-10-07', biografia = 'famoso mangaká'
WHERE idAutor = 2;

UPDATE Autores
SET dataNascimento = '1900-06-29', biografia = 'famoso mangaká'
WHERE idAutor = 3;