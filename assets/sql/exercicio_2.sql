--------------------------------------------- EXERCICIO 2 - Consultas SQL --------------------------------

-- Seleciona todos os dados da tabela 'clientes' - Consulta Simples
SELECT * FROM clientes;                        -- Mostra todos os registros da tabela 'clientes'

-- Seleciona todos os produtos com preço maior que 100 - Consulta com Condição
SELECT * FROM produtos
WHERE preco > 100;                             -- Mostra apenas produtos cujo preço é maior que 100

-- Seleciona dados dos pedidos, incluindo o nome do cliente e do produto, utilizando INNER JOIN - Consulta com INNER JOIN
SELECT p.pedido_id, c.nome AS cliente, pr.nome AS produto, p.quantidade, p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id  -- Junta a tabela 'pedidos' com 'clientes' onde os 'cliente_id' são iguais
INNER JOIN produtos pr ON p.produto_id = pr.produto_id; -- Junta a tabela 'pedidos' com 'produtos' onde os 'produto_id' são iguais
