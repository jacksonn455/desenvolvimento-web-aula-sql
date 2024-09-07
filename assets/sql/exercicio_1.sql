--------------------------------------------- EXERCICIO 1 - Criação do Banco de Dados e Tabelas --------------------------------

-- Criação do banco de dados 'loja'
CREATE DATABASE loja;

-- Seleciona o banco de dados 'loja' para ser utilizado
USE loja;

-- Criação da tabela 'clientes'
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'cliente_id' é a chave primária e será auto incrementada
    nome VARCHAR(100),                          -- Coluna 'nome' armazena o nome do cliente, com até 100 caracteres
    email VARCHAR(100)                          -- Coluna 'email' armazena o email do cliente, com até 100 caracteres
);

-- Criação da tabela 'produtos'
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'produto_id' é a chave primária e será auto incrementada
    nome VARCHAR(100),                          -- Coluna 'nome' armazena o nome do produto, com até 100 caracteres
    preco DECIMAL(10, 2)                        -- Coluna 'preco' armazena o preço do produto, com até 10 dígitos e 2 casas decimais
);

-- Criação da tabela 'pedidos'
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,   -- Coluna 'pedido_id' é a chave primária e será auto incrementada
    cliente_id INT,                             -- Coluna 'cliente_id' faz referência ao cliente que fez o pedido
    produto_id INT,                             -- Coluna 'produto_id' faz referência ao produto comprado
    quantidade INT,                             -- Coluna 'quantidade' armazena a quantidade de produtos comprados
    data_pedido DATE,                           -- Coluna 'data_pedido' armazena a data do pedido
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),  -- Define 'cliente_id' como chave estrangeira referenciando 'clientes'
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)   -- Define 'produto_id' como chave estrangeira referenciando 'produtos'
);

---------------- EXERCICIO 1 - Inserção de Dados

-- Inserção de dados na tabela 'clientes'
INSERT INTO clientes (nome, email)
VALUES 
    ('Maria Silva', 'maria@email.com'),        -- Inserindo cliente 'Maria Silva'
    ('João Pereira', 'joao@email.com');        -- Inserindo cliente 'João Pereira'

-- Inserção de dados na tabela 'produtos'
INSERT INTO produtos (nome, preco)
VALUES 
    ('Notebook', 2500.00),                     -- Inserindo produto 'Notebook' com preço de 2500.00
    ('Mouse', 50.00);                          -- Inserindo produto 'Mouse' com preço de 50.00

-- Inserção de dados na tabela 'pedidos'
INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido)
VALUES 
    (1, 1, 2, '2024-09-06'),                   -- Cliente 1 (Maria) comprou 2 notebooks no dia 2024-09-06
    (2, 2, 5, '2024-09-06');                   -- Cliente 2 (João) comprou 5 mouses no dia 2024-09-06

---------------- EXERCICIO 1 - Alterações e Modificações

-- Alteração da tabela 'clientes' para adicionar uma nova coluna 'endereco'
ALTER TABLE clientes
ADD endereco VARCHAR(255);                     -- Adiciona a coluna 'endereco' para armazenar o endereço do cliente

-- Modificação da tabela 'produtos', alterando o tamanho da coluna 'nome'
ALTER TABLE produtos
MODIFY nome VARCHAR(150);                      -- Aumenta o tamanho máximo da coluna 'nome' para 150 caracteres

---------------- EXERCICIO 1 - Atualização de Dados

-- Atualização do email do cliente com 'cliente_id' igual a 1
UPDATE clientes
SET email = 'maria.silva@novodominio.com'      -- Atualiza o email de Maria Silva
WHERE cliente_id = 1;                          -- Condição: cliente com 'cliente_id' 1

-- Atualização do preço do produto com 'produto_id' igual a 1
UPDATE produtos
SET preco = 2600.00                            -- Atualiza o preço do Notebook para 2600.00
WHERE produto_id = 1;                          -- Condição: produto com 'produto_id' 1
