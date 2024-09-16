RENAME TABLE clientes TO lojaClientes; 

USE loja_adrian;
RENAME TABLE produtos TO lojaProdutos;
RENAME TABLE pedidos TO lojaPedidos;
RENAME TABLE itens_pedido TO lojaItensPedido;


RENAME TABLE tabela1 TO tabela1.1		--> Alterar nome de tabela

ALTER TABLE tabela1.1		
CHANGE nome nomes VARCHAR(100);			--> Alterar nome de coluna

ALTER TABLE tabela1.1				--> Adicionar tabela
ADD COLUMN telefone VARCHAR(15);

UPDATE nomeTabela				--> Atualizando a coluna nova que criamos, WHERE seria o 'local', onde tal item estiver vai setar o telefone no caso do exemp
SET nomeColuna = x
WHERE condição


AUTO_INCREMET = colacar na PRIMARY KEY
