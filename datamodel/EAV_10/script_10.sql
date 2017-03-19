DROP TABLE IF EXISTS measure, contract_2_item,  item_2_attribute_date,
 item_2_attribute_int, item_2_attribute_varchar, attribute, contract, customers_group, customer,  manager, 
  item,    i18n, c;
CREATE TABLE `manager` (
	`id_manager` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	PRIMARY KEY (`id_manager`)
);

CREATE TABLE `customer` (
	`id_customer` int NOT NULL AUTO_INCREMENT,
	`id_customers_group` int NOT NULL,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`company_name` varchar(50),
	`address` varchar(50),
	`phone_number` varchar(20),
	`id_manager` int,
	PRIMARY KEY (`id_customer`)
);

CREATE TABLE `customers_group` (
	`id_clients_group` int NOT NULL AUTO_INCREMENT,
	`name` enum ('biz','jur'),
	PRIMARY KEY (`id_clients_group`)
);

CREATE TABLE `contract` (
	`id_contract` int NOT NULL AUTO_INCREMENT,
	`date` DATE,
	`id_client` int NOT NULL,
	`deals_status` varchar(20),
	`paymentsform` varchar(20),
	`paymentsstat` varchar(20),
	PRIMARY KEY (`id_contract`)
);

CREATE TABLE `item` (
	`id_item` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_item`)
);

CREATE TABLE `contract_2_item` (
	`id_deal` int NOT NULL,
	`id_convector` int NOT NULL,
	`quantity` int
);

CREATE TABLE `attribute` (
	`id_attribute` int NOT NULL AUTO_INCREMENT,
	`name` varchar (20),
	`id_measure` int NOT NULL,
	PRIMARY KEY (`id_attribute`)
);

CREATE TABLE `item_2_attribute_varchar` (
	`id_attribute` int NOT NULL,
	`id_item` int NOT NULL,
	`value` varchar (20)
);

CREATE TABLE `item_2_attribute_int` (
	`id_attribute` int NOT NULL,
	`id_item` int NOT NULL,
	`value` int
);

CREATE TABLE `item_2_attribute_date` (
	`id_attribute` int NOT NULL,
	`id_item` int NOT NULL,
	`value` DATE
);

CREATE TABLE `measure` (
	`id_measure` int NOT NULL AUTO_INCREMENT,
	`name` varchar(30),
	PRIMARY KEY (`id_measure`)
);

CREATE TABLE `i18n` (
	`table_name` enum ('measure','item_2_attribute_varchar', 'attribute') NOT NULL,
	`id_entity` int NOT NULL,
	`language` enum ('ru','en', 'by') NOT NULL,
	`value` varchar(50) NOT NULL
);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk0` FOREIGN KEY (`id_customers_group`) REFERENCES `customers_group`(`id_clients_group`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk1` FOREIGN KEY (`id_manager`) REFERENCES `manager`(`id_manager`);

ALTER TABLE `contract` ADD CONSTRAINT `contract_fk0` FOREIGN KEY (`id_client`) REFERENCES `customer`(`id_customer`);

ALTER TABLE `contract_2_item` ADD CONSTRAINT `contract_2_item_fk0` FOREIGN KEY (`id_deal`) REFERENCES `contract`(`id_contract`);

ALTER TABLE `contract_2_item` ADD CONSTRAINT `contract_2_item_fk1` FOREIGN KEY (`id_convector`) REFERENCES `item`(`id_item`);

ALTER TABLE `attribute` ADD CONSTRAINT `attribute_fk0` FOREIGN KEY (`id_measure`) REFERENCES `measure`(`id_measure`);

ALTER TABLE `item_2_attribute_varchar` ADD CONSTRAINT `item_2_attribute_varchar_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `attribute`(`id_attribute`);

ALTER TABLE `item_2_attribute_varchar` ADD CONSTRAINT `item_2_attribute_varchar_fk1` FOREIGN KEY (`id_item`) REFERENCES `item`(`id_item`);

ALTER TABLE `item_2_attribute_int` ADD CONSTRAINT `item_2_attribute_int_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `attribute`(`id_attribute`);

ALTER TABLE `item_2_attribute_int` ADD CONSTRAINT `item_2_attribute_int_fk1` FOREIGN KEY (`id_item`) REFERENCES `item`(`id_item`);

ALTER TABLE `item_2_attribute_date` ADD CONSTRAINT `item_2_attribute_date_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `attribute`(`id_attribute`);

ALTER TABLE `item_2_attribute_date` ADD CONSTRAINT `item_2_attribute_date_fk1` FOREIGN KEY (`id_item`) REFERENCES `item`(`id_item`);
