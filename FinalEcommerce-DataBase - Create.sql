-- CRIAÇÃO DO BANCO  DE DADOS PARA O CENÁRIO DE E-COMMERCE
-- drop database ecommerce;

	-- criando banco de dados
--  database ecommerce;

	-- selecionando BD
use ecommerce;

	-- criar tabela cliente

create table clients(
	idCLient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    cpf char(11) not null,
    Address varchar(30),
    dtNascimento date,
    cnpj char(15) not null,
    constraint unique_cpf_cliente unique (cpf)
);

alter table clients auto_increment=1;
desc clients;
	-- criar tabela produto

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_Kids bool default false,
    Lname varchar(20),
    category enum('eletronico','vestimento','brinquedos','alimentos','moveis')  not null,
    grade float default 0,
    size varchar(10) -- dimensão do produto
);
alter table product auto_increment=1;


	-- criar tabela pagamento
    
create table payments(
    idClient int,
    idPayment int,
    typePayment enum ('Boleto','Cartão','Dois Cartões','Pix'),
    cash float,
	primary key (idClient, idPayment)
);	
alter table payments auto_increment=1;

	-- criar tabela pedido

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus  enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,  -- shipping
    paymentCash bool default false,
   -- idPayment 
	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
    on update cascade
);
 alter table orders auto_increment=1;
 
	-- criar tabela estoque

create table productStorage(
	idProdStorage int auto_increment primary key,
    storagelocation varchar(255),
    quantity int default 0
);
alter table productStorage auto_increment=1;

	-- criar tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    cnpj char(15) not null,
    contato char(11) not null,
    constraint unique_supplier unique (cnpj)
);
alter table supplier auto_increment=1;

    -- criar tabela vendedor

create table seller(
	idseller int auto_increment primary key,
    socialName varchar(255) not null,
    AbsName varchar(255) not null,
    cnpj char(15),
    cpf char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_supplier unique (cnpj),
    constraint unique_cpf_supplier unique (cpf)
);
alter table seller auto_increment=1;

	-- criar tabela produto / vendedor 
    
		-- TABELA DERADA POR OUTRAS 02 TEBELAS - DEPENDENTE EXISTENCIA DE OUTRA TABELA
		-- RESULTA QUE A PK DESTA TABELA É A FK

create table productSeller(
	idPseller int, -- naõ é auto_increment pq vem de outra tabela
    idpProduct int,
    prodQuantity int default 1,
	primary key (idPseller, idPproduct), -- Chave Composta
    constraint fk_product_seller foreign key (idPseller) references seller(idseller),
	constraint fk_product_product_product foreign key (idPproduct) references product(idProduct)
);
alter table productSeller auto_increment=1;

	-- criat tabela Ordem de Produto

create table productOrder(
	idPOproduct int,
    idpPOrder int,
    poQuantity int default 1,
	poStatus enum ('Disponível','Sem Estoque') default 'Disponível',
    primary key (idPOproduct, idpPOrder), -- Chave Composta
    constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
	constraint fk_productOrder_product foreign key (idpPOrder) references orders(idOrder)
);
alter table productOrder auto_increment=1;


-- criar tabela Armazenamento Local - Disnível ou Não?

create table storageLocation(
	idLproduct int,
    idpLstorage int,
    location varchar(255) not null,
	primary key (idLproduct, idpLstorage), -- Chave Composta
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
	constraint fk_storage_location_storage foreign key (idpLstorage) references productStorage (idProdStorage)
);
alter table storageLocation auto_increment=1;

-- criar tabela Produto Fornecedor

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
	primary key (idPsSupplier, idPsProduct), -- Chave Composta
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
alter table productSupplier auto_increment=1;

	-- criar tabela entrega
drop table delivery;
create table delivery(
	idDelivery int auto_increment primary key,
    idDeliveryClient int,
    orderStatus  enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    deliveryDate datetime,
    trackingCode char(13),
	constraint fk_delivery_client foreign key (idDeliveryClient) references clients(idClient)
    on update cascade
);
 alter table delivery auto_increment=1;


show tables;
desc tables;
/*
show databases;
use information_schema;
show tables;
desc referential_constraints; -- FK
select*from referential_constraints where constraint_schema = 'ecommerce';


on update cascate: todas as tabelas relacionadas a FK serão atualziadas
on delete set null - resetar */