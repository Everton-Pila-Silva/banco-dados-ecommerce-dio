-- Recuperações simples com SELECT Statement
-- Filtros com WHERE Statement
-- Crie expressões para gerar atributos derivados
-- Defina ordenações dos dados com ORDER BY
-- Condições de filtros aos grupos – HAVING Statement
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

-- Quantos pedidos foram feitos por cada cliente?

select count(*) from orders;

-- Algum vendedor também é fornecedor?

select 
se.socialName,
se.CNPJ,
se.Location
from seller se
inner join supplier su on su.CNPJ  = se.CNPJ;


-- Relação de produtos fornecedores e estoques

select p.Pname, p.category, SocialName as responsável, count(*), psg.quantity as quantidade_estoque from product p
							inner join productsupplier as ps on p.idProduct = ps.idPsProduct
                            inner join supplier as s on ps.idPsSupplier = s.idSupplier
                            inner join storagelocation as sl on p.idProduct = sl.idLProduct                              
							inner join productstorage as psg on sl.idLstorage = psg.idProdStorage
                            where p.avaliação >= 3
                            group by quantidade_estoque
                            having quantidade_estoque > 50
                            order by p.Pname;

-- Relação de nomes dos fornecedores e nomes dos produtos;

select p.Pname, s.SocialName as responsável from product p
							inner join productsupplier as ps on p.idProduct = ps.idPsProduct
                            inner join supplier as s on ps.idPsSupplier = s.idSupplier
                            order by p.Pname;
                            
-- Relação cliente, pagamento e entrega
 select c.Fname as pessoa_fisica, cpj.FantasyName as pessoa_juridica, o.orderStatus, pay.typePayment , o.orderDescription , d.Dstatus as entrega from orders o
						left join clients as c on o.idOrderClient = c.idClient                    
                        left join clientpj as cpj on o.idOrderClientPJ = cpj.idClientPJ
                        inner join orderpayment as op on o.idOrder = op.CPidorder
                        inner join payment as pay on op.idPayment = pay.idPayment
                        inner join send on pay.idPayment = send.idPay
                        inner join delivery d on send.idSend = d.idDelivery;
					
-- Outras consultas abordadas:
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = o.idOrderClient;

select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select c.idClient, Fname, count(*) as number_of_orders from clients c
									inner join orders o on c.idClient = o.idOrderClient
                                    inner join productOrder p on p.idPOorder = o.idOrder
                                    group by idClient;
