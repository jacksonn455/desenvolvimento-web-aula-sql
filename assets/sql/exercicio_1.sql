-- =======================================
-- EXERCÍCIO 1.1 - Criação do Banco de Dados e Tabelas
-- =======================================

-- 1. Crie o banco de dados 'loja' e as tabelas 'clientes', 'produtos' e 'pedidos'.
CREATE DATABASE loja;                             -- Cria um banco de dados chamado 'loja'

-- Seleciona o banco de dados 'loja' para ser utilizado
USE loja;                                         -- Define 'loja' como o banco de dados ativo para executar os próximos comandos

-- Criação da tabela 'clientes'
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,    -- Coluna 'cliente_id' será a chave primária e incrementada automaticamente
    nome VARCHAR(100),                            -- Coluna 'nome' armazena o nome do cliente, até 100 caracteres
    email VARCHAR(100),                           -- Coluna 'email' armazena o email do cliente, até 100 caracteres
    endereco VARCHAR(255)                         -- Coluna 'endereco' armazena o endereço do cliente, até 255 caracteres
);                                                -- Finaliza a criação da tabela 'clientes'

-- Criação da tabela 'produtos'
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,    -- Coluna 'produto_id' é a chave primária e auto incrementada
    nome VARCHAR(100),                            -- Coluna 'nome' armazena o nome do produto, até 100 caracteres
    preco DECIMAL(10, 2)                          -- Coluna 'preco' armazena o preço do produto, com até 10 dígitos e 2 casas decimais
);                                                -- Finaliza a criação da tabela 'produtos'

-- Criação da tabela 'pedidos'
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,     -- Coluna 'pedido_id' é a chave primária e será auto incrementada
    cliente_id INT,                               -- Coluna 'cliente_id' faz referência ao cliente que fez o pedido
    produto_id INT,                               -- Coluna 'produto_id' faz referência ao produto comprado
    quantidade INT,                               -- Coluna 'quantidade' armazena a quantidade de produtos comprados
    data_pedido DATE,                             -- Coluna 'data_pedido' armazena a data em que o pedido foi realizado
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),  -- Define 'cliente_id' como chave estrangeira referenciando a tabela 'clientes'
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)   -- Define 'produto_id' como chave estrangeira referenciando a tabela 'produtos'
);                                                -- Finaliza a criação da tabela 'pedidos'

-- =======================================
-- EXERCÍCIO 1.2 - Alterações nas Tabelas
-- =======================================

-- 2. Adicione a coluna 'telefone' à tabela 'clientes' e modifique a coluna 'preco' na tabela 'produtos'.
ALTER TABLE clientes
ADD telefone VARCHAR(15);                         -- Adiciona a coluna 'telefone' na tabela 'clientes', permitindo armazenar números com até 15 caracteres

-- Modificar a coluna 'preco' na tabela 'produtos'
ALTER TABLE produtos
MODIFY preco DECIMAL(12, 2);                      -- Modifica a coluna 'preco' para aceitar valores maiores, com até 12 dígitos e 2 casas decimais

-- =======================================
-- EXERCÍCIO 1.3 - Inserção de Novos Registros
-- =======================================

-- 3. Insira 3 novos clientes e 2 novos produtos.
INSERT INTO clientes (nome, email, telefone, endereco)
VALUES 
    ('Ana Oliveira', 'ana@email.com', '21987654321', 'Rua A, 123 - Rio de Janeiro, RJ'),  
    ('Carlos Souza', 'carlos@email.com', '11987654321', 'Rua B, 456 - São Paulo, SP'), 
    ('Luisa Almeida', 'luisa@email.com', '31987654321', 'Rua C, 789 - Belo Horizonte, MG');
-- Insere 3 novos clientes na tabela 'clientes' com seus respectivos nomes, emails, telefones e endereços

-- Inserção de 2 novos produtos na tabela 'produtos'
INSERT INTO produtos (nome, preco)
VALUES 
    ('Teclado', 150.00),                          -- Produto 'Teclado' com preço de 150.00
    ('Monitor', 850.00);                          -- Produto 'Monitor' com preço de 850.00

-- =======================================
-- EXERCÍCIO 1.4 - Atualização de Registros
-- =======================================

-- 4. Atualize o endereço do cliente com 'cliente_id' igual a 2.
UPDATE clientes
SET endereco = 'Rua Nova, 123 - São Paulo, SP'    -- Atualiza o endereço do cliente com 'cliente_id' 2 (Carlos Souza)
WHERE cliente_id = 2;                             -- Define a condição para atualizar apenas o cliente cujo 'cliente_id' é 2
