-- =======================================
-- EXERCÍCIO 3 - Análise e Relatórios
-- =======================================

-- 1. Relatório detalhado dos pedidos, incluindo o nome do cliente e do produto
SELECT p.pedido_id,                                 -- Seleciona a coluna 'pedido_id' da tabela 'pedidos'
       c.nome AS cliente,                           -- Seleciona a coluna 'nome' da tabela 'clientes' e a renomeia como 'cliente'
       pr.nome AS produto,                          -- Seleciona a coluna 'nome' da tabela 'produtos' e a renomeia como 'produto'
       p.quantidade,                                -- Seleciona a coluna 'quantidade' da tabela 'pedidos'
       p.data_pedido                                -- Seleciona a coluna 'data_pedido' da tabela 'pedidos'
FROM pedidos p                                      -- Define 'pedidos' como a tabela principal da consulta
INNER JOIN clientes c ON p.cliente_id = c.cliente_id -- Faz um INNER JOIN com a tabela 'clientes', combinando os registros pelo 'cliente_id'
INNER JOIN produtos pr ON p.produto_id = pr.produto_id; -- Faz um INNER JOIN com a tabela 'produtos', combinando os registros pelo 'produto_id'
-- Relatório que mostra os pedidos com os detalhes do cliente e do produto adquiridos

-- 2. Contagem do número de pedidos realizados por cada cliente
SELECT c.nome AS cliente,                           -- Seleciona a coluna 'nome' da tabela 'clientes' e a renomeia como 'cliente'
       COUNT(p.pedido_id) AS total_pedidos          -- Conta o número de 'pedido_id' da tabela 'pedidos' e renomeia o resultado como 'total_pedidos'
FROM clientes c                                     -- Define 'clientes' como a tabela principal
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id  -- Faz um LEFT JOIN com a tabela 'pedidos', unindo pelo 'cliente_id'
GROUP BY c.nome;                                    -- Agrupa o resultado pelo nome do cliente para calcular a contagem total de pedidos por cliente
-- Exibe o nome do cliente e a contagem total de pedidos feitos por cada um