
# Retornar id do pedido e nome do cliente
# Inner Join
SELECT P.id_pedido, C.nome_cliente
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES as C 
ON P.id_cliente = C.id_cliente;

# Retornar id do pedido, nome do cliente e nome do vendedor
# Inner Join com 3 tabelas
SELECT P.id_pedido, C.nome_cliente, V.nome_vendedor
FROM ((cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
INNER JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor);

# Inner Join quando o nome da coluna é o mesmo em ambas as tabelas
SELECT P.id_pedido, C.nome_cliente
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES as C 
USING (id_cliente);

# Inner Join com WHERE e ORDER BY
SELECT P.id_pedido, C.nome_cliente
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES as C 
USING (id_cliente)
WHERE C.nome_cliente LIKE 'Bob%'
ORDER BY P.id_pedido DESC;

# Inner Join com WHERE e ORDER BY
SELECT P.id_pedido, C.nome_cliente
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES as C 
USING (id_cliente)
WHERE C.nome_cliente LIKE 'Bob%'
ORDER BY P.id_pedido DESC;

#[DESAFIO] Retornar a data do pedido, o nome do cliente, todos os vendedores, com ou sem pedido associado, e ordenar o resultado pelo nome do cliente.

SELECT P.data_pedido, C.nome_cliente, V.nome_vendedor
FROM (cap04.TB_PEDIDOS AS P
JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
RIGHT JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor
ORDER BY C.nome_cliente;

# Solução com mais detalhes
SELECT 
     CASE 
      WHEN P.data_pedido IS NULL THEN "Sem Pedido"
            ELSE P.data_pedido
    END AS data_pedido,
        CASE 
      WHEN C.nome_cliente IS NULL THEN "Sem Pedido"
            ELSE C.nome_cliente
    END AS nome_cliente,
        V.nome_vendedor
FROM ((cap04.TB_PEDIDOS AS P
JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
RIGHT JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor)
ORDER BY C.nome_cliente;
