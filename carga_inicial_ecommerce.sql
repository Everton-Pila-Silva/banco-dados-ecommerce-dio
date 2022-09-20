use ecommerce_refinado;

insert into Clients (Fname, Minit, Lname, CPF, Address)
					values ('Alicia', 'T', 'Wong', 123456789,'endereco tal 2'),
							('Jennifer', 'J', 'silva', 987654321, 'endereco tal 3'),
                            ('Ramesh', 'S', 'neia', 456789123, 'endereco tal 4'),
                            ('Joyce', 'K', 'jhow', 789123456, 'endereco tal 6'),
                            ('Ahmad', 'A', 'diniz', 987456321, 'endereco tal 7'),
                            ('James', 'V', 'sullivan', 98745631, 'endereco tal 8'),
                            ('Alicia', 'E', 'macullin', 654789123, 'endereco tal 9');
                            
insert into ClientPJ (FantasyName, dateOpen, CNPJ, Address)
					values ('Alicia', '2005-01-09',  123456789,'endereco tal 2'),
							('Jennifer', '2005-01-09', 987654321, 'endereco tal 3'),
                            ('Ramesh', '2005-01-09',  456789123, 'endereco tal 4'),
                            ('Joyce', '2005-01-09', 789123456, 'endereco tal 6'),
                            ('Ahmad', '2005-01-09', 987456321, 'endereco tal 7'),
                            ('James', '2005-01-09', 98745631, 'endereco tal 8'),
                            ('Alicia', '2005-01-09', 654789123, 'endereco tal 9');
select * from orders;

insert into Product (Pname, classification_kids, category, avaliação, size)
					values ('Fones', False, 'Eletrônico', '4', null),
							('Barbie', True, 'Brinquedos', '3', null),
							('Body', True, 'Vestimenta', '5', null),
                            ('Microfone', False, 'Eletrônico', '4', null),
                            ('smart tv', False, 'Eletrônico', '3', null),
                            ('Farinha', False, 'Alimentos', '2', null),
                            ('FireStick', False, 'Eletrônico', '3', null);

insert into Orders (idOrderClient, idOrderClientPJ, orderStatus, orderDescription, sendValue, paymentCash)
					values (1, null,  default, 'compra via aplicativo', null,1),
							(null, 2, default, 'compra via aplicativo', 50,0),
                            (3, null, 'Confirmado', null, null,1),
                            (null, 4, default, 'compra via web site', 150,0);


insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
					values (1,5,2,null),
							(2,1,1,null),
                            (3,6,1,null),
                            (4,2,1,null),
                            (5,3,1,null);
                            
insert into productstorage (storageLocation, quantity)
						values ('Rio de Janeiro', 1000),
								('Rio de Janeiro', 500),
                                ('São Paulo', 10),
                                ('São Paulo', 100),
                                ('São Paulo', 10),
                                ('Brasília', 60);
                                
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
insert into supplier (SocialName, CNPJ, contact) values
							('Almeida e filhos', 1234567890001,'123456789'),
                            ('Eletrônicos Silva', 8234567890001,'987654321'),
                            ('Eletrônicos Valma', 9234567890001,'789654123');
                            
insert into productsupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,3,633),
                            (3,4,5),
                            (2,5,10);
                                                        
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
                    ('Tech eletronics', null, 123456789321654, null, 'Rio de Janeiro', 2315648547), 
                     ('Botique Durgas', null, 4854789314586, 123456789, 'Rio de Janeiro', 2158585547),
                      ('Kids Word', null, 4569873214654, null, 'São Paulo', 24548545547);
                      
insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(2,1,80),
                            (3,2,10);
                            
insert into payment (idPayment, idclient, idClientPJ, typePayment, limitAvaliable) values
							(1, 1,null, 'Boleto', 80.0),
                            (2, 2,null,'Boleto', 100.0),
                            (3, null, 3, 'Boleto', 1000.0),
                            (4, null, 2, 'Boleto',300.0),
                            (5, null, 1, 'Cartão',3000.0);

insert into orderpayment (CPidorder, idPayment) values
							(2,1),
                            (3,2), 
                            (1,3),
                            (4,5), 
                            (5,4);
                             
insert into delivery (idDelivery, Dstatus, cod_delivery) values
							(1, default,1),
                            (2, default,2),
                            (3, 'Cancelado', 3),
                            (4, default, 4),
                            (5, 'Entregue',5);
                            
insert into send (idSend, idPay) values
							(2,1),
                            (3,2), 
                            (1,3),
                            (4,5), 
                            (5,4);


                                         
