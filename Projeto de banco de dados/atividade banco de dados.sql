select
    lojas.loja as nome_loja,
    lojas.Gerente as gerente,
    clientes.Nome as nome_cliente,
    clientes.nome as nome_cliente,
    clientes.sobrenome as sobrenome_cliente,
    produtos.Nome_Produto as nome_produto,
    categorias.Categoria as categoria_produto,
    SUM(pedidos.Qtd_Vendida) as quantidade_total_vendida,
    SUM(pedidos.Receita_Venda) as receita_total_vendas,
    SUM(pedidos.Custo_Venda) as custo_total_vendas,
    SUM(pedidos.receita_venda) - SUM(pedidos.custo_venda) as Lucro_Total
    from pedidos

join lojas on pedidos.ID_Loja = lojas.ID_Loja
join clientes on pedidos.ID_Cliente = clientes.ID_Cliente
join produtos on pedidos.ID_Produto = produtos.id_produto
join categorias on produtos.ID_Categoria = categorias.ID_Categoria

where 
	lojas.ID_Loja = 2

group by
	lojas.loja,
    lojas.Gerente,
    clientes.nome,
    clientes.Sobrenome,
    produtos.Nome_Produto,
    categorias.Categoria

order by
		Lucro_Total DESC


