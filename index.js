const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('exemplo.db');


db.run(
    `  
    CREATE TABLE IF NOT EXISTS Funcionarios (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        cargo TEXT,
        salario REAL
    )
    `,
    (err) => {
        if (err) {
            console.error('Erro ao criar a tabela Funcionarios', err.message);
        } else {
            console.log('Tabela Funcionarios criada com sucesso.');

            const funcionarios = [
                {nome: 'João Silva', cargo:'Desenvolvedor', salario: 4500.00},
                {nome: 'Maria Oliveira', cargo:'Analista', salario: 5500.00},
                {nome: 'Pedro Souza', cargo:'Gerente', salario: 7500.00}   
            ];            
            // Comando SQL para inserir na tabela
            const insertQuery = `
                INSERT INTO Funcionarios (nome, cargo, salario)
                VALUES (?, ?, ?) 
            `
            // ? PLACEHOLDER
            funcionarios.forEach((funcionario) => {
                db.run(insertQuery, [funcionario.nome, funcionario.cargo, funcionario.salario], function() {
                    if (err) {
                        console.error("Erro ao inserir funcionário:", err.message);
                    } else {
                        console.log(`Funcionario inserido com sucesso. ID: ${this.lastID}`);
                    };
                });
            });
            
            db.close((err)=>{
                if (err) {
                    return console.error('Erro ao fechar o banco de dados:', err.message)
                }
                console.log('Conexão com o banco de dados SQLite fechada.')
            })
        }; 
    }
);

