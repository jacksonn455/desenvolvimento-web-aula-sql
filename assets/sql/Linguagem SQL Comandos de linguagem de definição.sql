-- Cria��o da tabela 'clientes'
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'cliente_id' � a chave prim�ria e ser� auto incrementada
    nome VARCHAR(100),                          -- Coluna 'nome' armazena o nome do cliente, com at� 100 caracteres
    email VARCHAR(100)                          -- Coluna 'email' armazena o email do cliente, com at� 100 caracteres
);

-- Cria��o da tabela 'produtos'
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'produto_id' � a chave prim�ria e ser� auto incrementada
    nome VARCHAR(100),                          -- Coluna 'nome' armazena o nome do produto, com at� 100 caracteres
    preco DECIMAL(10, 2)                        -- Coluna 'preco' armazena o pre�o do produto, com at� 10 d�gitos e 2 casas decimais
);

-- Cria��o da tabela 'pedidos'
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,   -- Coluna 'pedido_id' � a chave prim�ria e ser� auto incrementada
    cliente_id INT,                             -- Coluna 'cliente_id' faz refer�ncia ao cliente que fez o pedido
    produto_id INT,                             -- Coluna 'produto_id' faz refer�ncia ao produto comprado
    quantidade INT,                             -- Coluna 'quantidade' armazena a quantidade de produtos comprados
    data_pedido DATE,                           -- Coluna 'data_pedido' armazena a data do pedido
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),  -- Define 'cliente_id' como chave estrangeira referenciando 'clientes'
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)   -- Define 'produto_id' como chave estrangeira referenciando 'produtos'
);

-- Inser��o de dados na tabela 'clientes'
INSERT INTO clientes (nome, email)
VALUES 
    ('Maria Silva', 'maria@email.com'),        -- Inserindo cliente 'Maria Silva'
    ('Jo�o Pereira', 'joao@email.com');        -- Inserindo cliente 'Jo�o Pereira'

-- Inser��o de dados na tabela 'produtos'
INSERT INTO produtos (nome, preco)
VALUES 
    ('Notebook', 2500.00),                     -- Inserindo produto 'Notebook' com pre�o de 2500.00
    ('Mouse', 50.00);                          -- Inserindo produto 'Mouse' com pre�o de 50.00

-- Inser��o de dados na tabela 'pedidos'
INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido)
VALUES 
    (1, 1, 2, '2024-09-06'),                   -- Cliente 1 (Maria) comprou 2 notebooks no dia 2024-09-06
    (2, 2, 5, '2024-09-06');                   -- Cliente 2 (Jo�o) comprou 5 mouses no dia 2024-09-06

-- Altera��o da tabela 'clientes' para adicionar uma nova coluna 'endereco'
ALTER TABLE clientes
ADD endereco VARCHAR(255);                     -- Adiciona a coluna 'endereco' para armazenar o endere�o do cliente

-- Modifica��o da tabela 'produtos', alterando o tamanho da coluna 'nome'
ALTER TABLE produtos
MODIFY nome VARCHAR(150);                      -- Aumenta o tamanho m�ximo da coluna 'nome' para 150 caracteres

-- Atualiza��o do email do cliente com 'cliente_id' igual a 1
UPDATE clientes
SET email = 'maria.silva@novodominio.com'      -- Atualiza o email de Maria Silva
WHERE cliente_id = 1;                          -- Condi��o: cliente com 'cliente_id' 1

-- Atualiza��o do pre�o do produto com 'produto_id' igual a 1
UPDATE produtos
SET preco = 2600.00                            -- Atualiza o pre�o do Notebook para 2600.00
WHERE produto_id = 1;                          -- Condi��o: produto com 'produto_id' 1

-- Seleciona todos os dados da tabela 'clientes'
SELECT * FROM clientes;                        -- Mostra todos os registros da tabela 'clientes'

-- Seleciona todos os produtos com pre�o maior que 100
SELECT * FROM produtos
WHERE preco > 100;                             -- Mostra apenas produtos cujo pre�o � maior que 100

-- Seleciona dados dos pedidos, incluindo o nome do cliente e do produto, utilizando INNER JOIN
SELECT p.pedido_id, c.nome AS cliente, pr.nome AS produto, p.quantidade, p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id  -- Junta a tabela 'pedidos' com 'clientes' onde os 'cliente_id' s�o iguais
INNER JOIN produtos pr ON p.produto_id = pr.produto_id; -- Junta a tabela 'pedidos' com 'produtos' onde os 'produto_id' s�o iguais

-- Seleciona dados dos pedidos com nome do cliente e do produto usando JOIN
SELECT pedidos.pedido_id, clientes.nome, produtos.nome, pedidos.quantidade, pedidos.data_pedido
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.cliente_id -- Junta a tabela 'pedidos' com 'clientes' usando 'cliente_id'
JOIN produtos ON pedidos.produto_id = produtos.produto_id; -- Junta a tabela 'pedidos' com 'produtos' usando 'produto_id'
