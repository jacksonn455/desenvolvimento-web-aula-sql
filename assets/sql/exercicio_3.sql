--------------------------------------------- EXERCICIO 3 - Relatório de Pedidos --------------------------------

-- Relatório detalhado dos pedidos, incluindo o nome do cliente e do produto
SELECT p.pedido_id, c.nome AS cliente, pr.nome AS produto, p.quantidade, p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id
INNER JOIN produtos pr ON p.produto_id = pr.produto_id;

---------------- EXERCICIO 3 - Contagem de Pedidos por Cliente

-- Contagem do número de pedidos realizados por cada cliente
SELECT c.nome AS cliente, COUNT(p.pedido_id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.nome;
