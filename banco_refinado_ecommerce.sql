-- drop database  ecommerce_refinado;

-- create database ecommerce_refinado;
 -- use ecommerce_refinado;

-- Table Client

CREATE TABLE IF NOT EXISTS clients(
  idClient INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Fname VARCHAR(45),
  Minit VARCHAR(3) ,
  LName VARCHAR(45) ,
  CPF CHAR(11) NOT NULL,
  Address VARCHAR(45),
  CONSTRAINT unique_cpf_client UNIQUE (CPF)
  );
  
  alter table clients auto_increment=1;
  
-- Table Product

CREATE TABLE IF NOT EXISTS product(
  idProduct INT AUTO_INCREMENT PRIMARY KEY,
  Pname VARCHAR(10) NOT NULL,
  classification_kids BOOL DEFAULT false,
  category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos') NOT NULL,
  avaliação FLOAT DEFAULT 0,
  size VARCHAR(30)
);

-- Table estoque 
CREATE TABLE IF NOT EXISTS productStorage (
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
	storageLocation VARCHAR(255),
	quantity INT DEFAULT 0
);

-- Table Fornecedor

CREATE TABLE IF NOT EXISTS supplier (
   idSupplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   SocialName VARCHAR(255),
   CNPJ CHAR(15) NOT NULL,
   contact CHAR(11) NOT NULL,
   CONSTRAINT unique_suppier UNIQUE(CNPJ)
    );

-- Table Vendedor

CREATE TABLE IF NOT EXISTS seller(
   idSeller INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   SocialName VARCHAR(255),
   AbstName VARCHAR(255),
   CNPJ CHAR(15) NOT NULL,
   CPF CHAR(15),
   location VARCHAR(255),
   contact CHAR(11) NOT NULL,
   CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
   CONSTRAINT unique_cpf_seller UNIQUE(CPF)
    );

-- Table Produtos_por_vendedor-terceiro

CREATE TABLE IF NOT EXISTS productSeller(
  idPseller INT,
  idPproduct INT,
  prodQuantity INT DEFAULT 1,
  PRIMARY KEY (idPseller, idPproduct),
  CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
  CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

-- Table Ordem Produto

CREATE TABLE IF NOT EXISTS productOrder(
  idPOproduct INT,
  idPOorder INT,
  poQuantity INT DEFAULT 1,
  poStatus  ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (idPOproduct, idPOorder),
  CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES  product(idProduct),
  CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Table local de armazenamento 
CREATE TABLE IF NOT EXISTS storageLocation(
  idLstorage INT,
  idLProduct INT,
  location VARCHAR(255) NOT NULL,
  PRIMARY KEY (idLProduct, idLstorage),
  CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES  productStorage(idProdStorage),
  CONSTRAINT fk_storage_location_product FOREIGN KEY (idLProduct) REFERENCES product(idProduct)
);

CREATE TABLE IF NOT EXISTS productSupplier(
  idPsSupplier INT,
  idPsProduct INT,
  quantity INT NOT NULL,
  PRIMARY KEY (idPsSupplier, idPsProduct),
  CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES  supplier(idSupplier),
  CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

show tables;

-- ***************************************** REFINAMENTO ************************************** 

-- Table Cliente PJ

CREATE TABLE IF NOT EXISTS clientpj (
  idClientPJ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FantasyName VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NULL,
   dateOpen DATE,
   CNPJ CHAR(15) NOT NULL,
   CONSTRAINT unique_cnpj_client UNIQUE (CNPJ)
  );

-- Table pedido

CREATE TABLE IF NOT EXISTS orders(
  idOrder INT AUTO_INCREMENT PRIMARY KEY,
  idOrderClient INT, 
  idOrderClientPJ  INT,
  orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
  orderDescription VARCHAR(255),
  sendValue FLOAT DEFAULT 10,
  paymentCash BOOLEAN DEFAULT false,
  CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient),
  CONSTRAINT fk_orders_client_pj FOREIGN KEY (idOrderClientPJ) REFERENCES clientpj(idClientPJ)
  on update cascade
 );

  -- Table Payments

CREATE TABLE IF NOT EXISTS payment(
	idclient INT,
    idPayment INT,
    idClientPJ INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvaliable FLOAT,
    PRIMARY KEY(idPayment)
    );  

-- Table `mydb`.`Rel_pedido_cliente_pagamento`

CREATE TABLE IF NOT EXISTS orderPayment(
  CPidorder INT NOT NULL,
  idPayment INT NOT NULL,
  PRIMARY KEY (CPidorder, idPayment),
  CONSTRAINT fk_cp_pedido FOREIGN KEY (CPidorder) REFERENCES  orders(idOrder),
  CONSTRAINT fk_cp_payment FOREIGN KEY (idPayment) REFERENCES payment(idPayment)
  );

-- Table Entrega

CREATE TABLE IF NOT EXISTS delivery (
  idDelivery INT NOT NULL,
  Dstatus ENUM('Cancelado', 'Entregue', 'Em processamento') DEFAULT 'Em Processamento',
  cod_delivery VARCHAR(45) NULL,
  PRIMARY KEY (idDelivery)
  );

-- Table entrega_apos_pagamento

CREATE TABLE IF NOT EXISTS send (
  idSend INT NOT NULL,
  idPay INT NOT NULL,
  PRIMARY KEY (idSend),
  CONSTRAINT fk_send_send FOREIGN KEY (idSend) REFERENCES  delivery(idDelivery),
  CONSTRAINT fk_send_payment FOREIGN KEY (idPay) REFERENCES payment(idPayment)
  );
