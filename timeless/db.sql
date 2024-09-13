-- Tabela de Usuários
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
-- Tabela de Preferências
CREATE TABLE Preferencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pref VARCHAR(255) NOT NULL,
    horarioInicio TIME NOT NULL,
    horarioFim TIME NOT NULL,
    intervalo TIME NOT NULL,
    metodo_prod VARCHAR(255),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES Usuarios(id) ON DELETE CASCADE
);
 
-- Tabela Preferências de Usuário (Agenda)
CREATE TABLE PreferenciasUsuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pref INT,
    id_user INT,
    data DATE NOT NULL,
    horarios TIME NOT NULL,
    titulo_tarefa VARCHAR(100) NOT NULL,
    tarefas TEXT,
    FOREIGN KEY (id_pref) REFERENCES Preferencias(id) ON DELETE CASCADE,
    FOREIGN KEY (id_user) REFERENCES Usuarios(id) ON DELETE CASCADE
);
 
-- Tabela de Sugestões de Produtividade
CREATE TABLE SugestoesProdutividade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    sugestao TEXT NOT NULL,
    sugestao_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    implementacao_at TIMESTAMP NULL,
    FOREIGN KEY (id_user) REFERENCES Usuarios(id) ON DELETE CASCADE
);
 
-- Tabela de Prompt IA
CREATE TABLE PromptIA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prompt TEXT NOT NULL
);