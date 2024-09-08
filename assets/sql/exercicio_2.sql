-- =======================================
-- EXERCÍCIO 2 - Consultas SQL
-- =======================================

-- 1. Selecione todos os dados da tabela 'clientes'.
SELECT * FROM clientes;                             -- Seleciona todas as colunas e linhas da tabela 'clientes', exibindo todos os registros

-- 2. Selecione produtos com preço menor que 100.
SELECT * FROM produtos                              -- Seleciona todas as colunas da tabela 'produtos'
WHERE preco < 100;                                  -- Filtra apenas os produtos cujo valor da coluna 'preco' é menor que 100

-- 3. Liste todos os pedidos com o nome do cliente e do produto utilizando INNER JOIN.
SELECT p.pedido_id,                                 -- Seleciona a coluna 'pedido_id' da tabela 'pedidos'
       c.nome AS cliente,                           -- Seleciona a coluna 'nome' da tabela 'clientes' e a renomeia como 'cliente'
       pr.nome AS produto,                          -- Seleciona a coluna 'nome' da tabela 'produtos' e a renomeia como 'produto'
       p.quantidade,                                -- Seleciona a coluna 'quantidade' da tabela 'pedidos'
       p.data_pedido                                -- Seleciona a coluna 'data_pedido' da tabela 'pedidos'
FROM pedidos p                                      -- Especifica a tabela 'pedidos' como a tabela principal para a consulta
INNER JOIN clientes c ON p.cliente_id = c.cliente_id -- Realiza um INNER JOIN entre 'pedidos' e 'clientes' para combinar registros onde 'cliente_id' coincide
INNER JOIN produtos pr ON p.produto_id = pr.produto_id; -- Realiza um INNER JOIN entre 'pedidos' e 'produtos' para combinar registros onde 'produto_id' coincide
-- Exibe a lista de pedidos com as informações do cliente e do produto comprados