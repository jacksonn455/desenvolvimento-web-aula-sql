--------------------------------------------- EXERCICIO 4 - Manipulação Avançada --------------------------------

-- Remove todos os pedidos do cliente com 'cliente_id' igual a 1
DELETE FROM pedidos
WHERE cliente_id = 1;

-- Altera o preço dos produtos cujo nome contém "Mouse" para 55.00
UPDATE produtos
SET preco = 55.00
WHERE nome LIKE '%Mouse%';

-- Lista todos os produtos com o maior preço em ordem decrescente
SELECT * FROM produtos
ORDER BY preco DESC;
