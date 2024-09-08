-- =======================================
-- EXERCÍCIO 4 - Manipulação Avançada
-- =======================================

-- 1. Remover todos os pedidos do cliente com 'cliente_id' igual a 1
DELETE FROM pedidos                -- Comando que remove registros da tabela 'pedidos'
WHERE cliente_id = 1;              -- Condição que seleciona apenas os pedidos onde o 'cliente_id' é igual a 1
-- Remove todos os pedidos realizados pelo cliente com ID 1 da tabela 'pedidos'

-- 2. Alterar o preço dos produtos cujo nome contém "Mouse" para 55.00
UPDATE produtos                    -- Comando que atualiza registros na tabela 'produtos'
SET preco = 55.00                  -- Define o novo valor do campo 'preco' para 55.00
WHERE nome LIKE '%Mouse%';          -- Condição que filtra os produtos cujo nome contém a palavra "Mouse"
-- Atualiza o preço de todos os produtos que possuem "Mouse" no nome para 55.00

-- 3. Listar todos os produtos com o maior preço em ordem decrescente
SELECT * FROM produtos             -- Seleciona todos os registros da tabela 'produtos'
ORDER BY preco DESC;               -- Ordena os resultados com base na coluna 'preco' em ordem decrescente
-- Mostra os produtos com maior preço primeiro, em ordem decrescente
