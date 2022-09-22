-- INSERTION https://www.mockaroo.com/

								-- Tb CLIENTS = (idCLient, Fname, Minit, Lname, cpf, Address, dtNascimento, cnpj)  = CLIENTES

insert into clients (idCLient, Fname, Minit, Lname, cpf, Address, dtNascimento, cnpj) 
	values 
			(1, 'Fitzgerald', 'A', 'McCrone', '5727410894', 'Messerschmidt', '2022-01-23', '7342533300'),
			(2, 'Phillis', 'S', 'Baldery', '7342533300', 'Carioca', '2021-10-16', '5727410894'),
			(3, 'Allen', 'L', 'Berringer', '5961908984', 'Hovde', '2022-05-02', '5302492121'),
			(4, 'Clarita', 'P', 'Sheriff', '5302492121', 'Shelley', '2022-09-15', '5961908984'),
			(5, 'Windy', 'M', 'MacGoun', '4139762543', 'Eastwood', '2022-09-19', '9691381362');


								-- Tb PRODUCT = (idProduct, Pname, Lname, classification_Kids, category, grade, size) - PRODUTO

insert into product (idProduct, Pname, Lname, classification_Kids, category, grade, size) 
values
			(1, 'Fone ', 'Branca', true, 'eletronico', '5', '100x100x90'),
			(2, 'Cadeira', 'Estofada', true, 'moveis', '8',default),
			(3, 'Notebook', 'Acer', true, 'eletronico', '7',default),
			(4, 'Vestido', 'Verde', false, 'vestimento', '3', default),
			(5, 'Chocolate', 'Grape', false, 'alimentos', '8', default),
			(6, 'Ursinho', 'preto', true, 'brinquedos', '9', '30x30'),
			(7, 'Celular', 'Sansung', false, 'eletronico', '10', default);


								-- tb PAYMENT = (idClient, idPayment, typePayment, cash) - PAGAMENTO
    
insert into payments (idClient, idPayment, typePayment, cash)
values
			(1, 1, 'Boleto', 511.54),
			(2, 2, 'Cartão',4507.06),
			(3, 3, 'Dois Cartões',4893.85),
			(4, 4, 'Boleto',1315.84),
			(5, 5, 'Cartão',3733.76),
			(6, 1, 'Pix',4733.71),
			(7, 2, 'Pix',451.87),
			(8, 3, 'Pix', 2773.02),
			(9, 4, 'Dois Cartões',363.51),
			(10, 5, 'Pix',3635),
			(11, 5, 'Pix', 4306.57),
			(12, 4, 'Dois Cartões', 1428.08),
			(13, 3, 'Pix',3635.51),
			(14, 5, 'Pix',3635.51),
			(15, 1, 'Pix',3635.51);


								-- TB ORDERS = (idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) - PEDIDO


insert into orders (idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
values 
			(1, 1, 'Confirmado', 'comprado via aplicativo', 26.9, 1),
			(2, 2, 'Em processamento', default, 3.33, 1),
			(3, 3, 'Em processamento', 'comprado via aplicativo', 22.79, 1),
			(4, 4, 'Confirmado', default, 19.12, 0),
			(5, 5, 'Em processamento', 'comprado via aplicativo', 18.45, 1),
			(6, 1, 'Confirmado', default, 23.38, 0),
			(7, 2, 'Confirmado', 'comprado via aplicativo', 10.21, 1),
			(8, 3, 'Em processamento', default, 13.78, 0),
			(9, 4, 'Confirmado', default, 24.77, 1),
			(10, 5, 'Cancelado', 'comprado via website', 16.46, 1),
			(11,1, 'Confirmado', default, 14.07, 0),
			(12, 5, 'Confirmado', default, 24.91, 0),
			(13,3 ,'Confirmado', 'comprado via website', 21.80, 1),
			(14, 2, 'Confirmado', false, 11.94, 1),
			(15, 3, 'Confirmado', 'comprado via website', 11.22, 0);


								-- TB PRODUCT STORAGE - (idProdStorage, storagelocation, quantity)  - ARMAZENAMENTO
    
insert into productStorage (idProdStorage, storagelocation, quantity) values
			(1, 'São Paulo', 1000),
			(2, 'Rio de Janeiro', 2205),
			(3, 'São Paulo', 390),
			(4, 'Rio de Janeiro', 904),
			(5, 'São Paulo', 1005),
			(6, 'Rio de Janeiro', 960),
			(7, 'São Paulo', 770);


								-- criar STORAGE LOCATION -  IdLproduct, idpLstorage, location) - ARMAZENAMENTO LOCAL

insert into storageLocation (IdLproduct, idpLstorage, location) 
values
			(1,1,'RJ'),
            (2,1,'SP');


								-- criar SUPPLIER - tabela fornecedor = (idSupplier, socialName, cnpj, contato)

insert into supplier (idSupplier, socialName, cnpj, contato)
values
	(1, 'Alprazolam', '762407958554875', '90128654126'),
	(2, 'calcipotriene', '576954773798069', '62184802369'),
	(3, 'Eletronics CS', '253236240700750', '82974739650');

							-- criar tabela Produto Fornecedor

insert into productSupplier( idPsSupplier, idPsProduct, quantity)
values
			(1,1,400),
            (2,2,450),
            (3,3,290),
            (1,4,346),
            (2,5,655),
            (3,6,457),
			(1,7,457);

select * from productSupplier;

							-- criar tabela vendedor = (idseller, socialName, AbsName, cnpj, cpf, location, contact)


insert into seller (idseller, socialName, AbsName, cnpj, cpf, location, contact)
values
			(1, 'Leexo', 'Zontrax', 115151515151565, 20136587811, 'São Paulo', '1521562696'),
			(2, 'Wikido', 'Zaam-Dox', 165656565458765, 11365247851, 'Rio de Janeiro', '1868020417'),
			(3, 'Realbridge', 'Otcom', 156548203214587, 11254686011, 'São Paulo', '7778590628');

						-- PRODUCT SELLER - tabela produto / vendedor 
    

insert into productSeller (idPseller, idpProduct, prodQuantity)
values 
			(1, 1, 100),
			(2, 2, 205),
			(3, 3, 390),
			(2, 4, 940),
			(3, 5, 105),
			(2, 6, 96),
			(3, 7, 77);


	-- cria PRODUCT ORDER - tabela Ordem de Produto


insert into productOrder (idPOproduct, idpPOrder, poQuantity, poStatus)
values
			(1, 1, 1, 1),
			(2, 2, 2, null),
			(3, 3, 3, null),
			(4, 4, 4, null),
			(5, 5, 5, null),
			(6, 6, 6, null),
			(7, 7, 7, null),
			(2, 8, 8, null),
			(2, 9, 9, null),
			(3, 10, 10, null),
			(4, 11, 11, null),
			(5, 12, 12, null),
			(7, 13, 13, null),
			(3, 14, 14, null),
			(7, 15, 15, null);


	-- criar tabela entrega 

insert into delivery (idDelivery, idDeliveryClient, orderStatus, deliveryDate, trackingcode)
values
(1, 1, 'Confirmado', 01/10/2022, '5212154874011'),
(2, 2, 'Em processamento', '2021-10-16', '1015487960003'),
(3, 3, 'Em processamento', '2021-10-23', '5212154875748'),
(4, 4, 'Confirmado', '2022-02-13', '5723701548708'),
(5, 5, 'Confirmado', '2022-04-17', '5154877142248'),
(6, 1, 'Em processamento', '2022-04-07', '6111548764100'),
(7, 2, 'Em processamento', '2022-01-06', '0001548740028'),
(8, 3, 'Em processamento', '2021-11-09', '5091548788234'),
(9, 4, 'Confirmado', '2022-07-28', '6987315487402'),
(10, 5, 'Em processamento', '2022-07-02', '1351548737405'),
(11, 1, 'Confirmado', '2022-07-24', '4152041548710'),
(12, 5, 'Em processamento', '2021-12-17', '4991548799277'),
(13, 3, 'Em processamento', '2021-11-06', '2501081548714'),
(14, 2, 'Em processamento', '2021-12-29', '5074210715487'),
(15, 3, 'Cancelado', '2022-02-25', '5515420812354');



SELECT * FROM CLIENTS;
SELECT * FROM DELIVERY;--
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;
SELECT * FROM PRODUCT;
SELECT * FROM PRODUCTORDER;
SELECT * FROM PRODUCTSELLER;--
SELECT * FROM PRODUCTSTORAGE;
SELECT * FROM PRODUCTSUPPLIER;
SELECT * FROM SELLER;
SELECT * FROM STORAGELOCATION;
SELECT * FROM SUPPLIER;

SHOW TABLES;
 insert into delivery (idDelivery, idDeliveryClient, orderStatus, devileryDate, trackingcode) values (1, 1, 'Confirmado', 01/10/2022, '52121548740114'), (2, 2, 'Em processamento', '2021-10-16', '61015487960003'), (3, 3, 'Em processamento', '2021-10-23', '5212154875748'), (4, 4, 'Confirmado', '2022-02-13', '5723701548708'), (5, 5, 'Confirmado', '2022-04-17', '5154877142248'), (6, 1, 'Em processamento', '2022-04-07', '61115487641001'), (7, 2, 'Em processamento', '2022-01-06', '0001548740028'), (8, 3, 'Em processamento', '2021-11-09', '5091548788234'), (9, 4, 'Confirmado', '2022-07-28', '36987315487402'), (10, 5, 'Em processamento', '2022-07-02', '1351548737405'), (11, 1, 'Confirmado', '2022-07-24', '4152041548710'), (12, 5, 'Em processamento', '2021-12-17', '4991548799277'), (13, 3, 'Em processamento', '2021-11-06', '2501081548714'), (14, 2, 'Em processamento', '2021-12-29', '5074210715487'), (15, 3, 'Cancelado', '2022-02-25', '5515420812354')
