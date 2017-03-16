CREATE TABLE `managers` (
	`id_manager` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`id_position` int NOT NULL,
	PRIMARY KEY (`id_manager`)
);

CREATE TABLE `positions` (
	`id_position` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_position`)
);

CREATE TABLE `attributes` (
	`id_attribute` int NOT NULL AUTO_INCREMENT,
	`id_name` int NOT NULL,
	`id_type` int NOT NULL,
	PRIMARY KEY (`id_attribute`)
);

CREATE TABLE `clients_groups` (
	`id_clients_group` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_clients_group`)
);

CREATE TABLE `deals` (
	`id_deal` int NOT NULL AUTO_INCREMENT,
	`date` DATE,
	`id_client` int NOT NULL,
	`deals_status` varchar(20),
	`payments_form ` varchar(20),
	`payments_status ` varchar(20),
	PRIMARY KEY (`id_deal`)
);

CREATE TABLE `products` (
	`id_entity` int NOT NULL AUTO_INCREMENT,
	`id_product_group` int NOT NULL,
	PRIMARY KEY (`id_entity`)
);

CREATE TABLE `products_in_deals` (
	`id_deal` int NOT NULL,
	`id_product` int NOT NULL,
	`quantity` int
);

CREATE TABLE `clients` (
	`id_entity` int NOT NULL AUTO_INCREMENT,
	`id_manager` int NOT NULL,
	`id_clients_group` int NOT NULL,
	PRIMARY KEY (`id_entity`)
);

CREATE TABLE `product_groups` (
	`id_product_group` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_product_group`)
);

CREATE TABLE `attributes_name` (
	`id_name` int NOT NULL AUTO_INCREMENT,
	`value` varchar(20) NOT NULL,
	PRIMARY KEY (`id_name`)
);

CREATE TABLE `attributes_type` (
	`id_type` int NOT NULL AUTO_INCREMENT,
	`value` varchar(20) NOT NULL,
	PRIMARY KEY (`id_type`)
);

CREATE TABLE `int_value` (
	`id_entity` int NOT NULL,
	`id_attribute` int NOT NULL,
	`int_value` int
);

CREATE TABLE `entity_ids` (
	`id_entity` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_entity`)
);

CREATE TABLE `varchar_value ` (
	`id_entity` int NOT NULL,
	`id_attribute` int NOT NULL,
	`varchar_value ` varchar
);

CREATE TABLE `date_value` (
	`id_entity` int NOT NULL,
	`id_attribute` int NOT NULL,
	`date_value ` DATE
);

ALTER TABLE `managers` ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`id_position`) REFERENCES `positions`(`id_position`);

ALTER TABLE `attributes` ADD CONSTRAINT `attributes_fk0` FOREIGN KEY (`id_name`) REFERENCES `attributes_name`(`id_name`);

ALTER TABLE `attributes` ADD CONSTRAINT `attributes_fk1` FOREIGN KEY (`id_type`) REFERENCES `attributes_type`(`id_type`);

ALTER TABLE `deals` ADD CONSTRAINT `deals_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_entity`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`id_entity`) REFERENCES `entity_ids`(`id_entity`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk1` FOREIGN KEY (`id_product_group`) REFERENCES `product_groups`(`id_product_group`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk0` FOREIGN KEY (`id_deal`) REFERENCES `deals`(`id_deal`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk1` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_entity`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk0` FOREIGN KEY (`id_entity`) REFERENCES `entity_ids`(`id_entity`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk1` FOREIGN KEY (`id_manager`) REFERENCES `managers`(`id_manager`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk2` FOREIGN KEY (`id_clients_group`) REFERENCES `clients_groups`(`id_clients_group`);

ALTER TABLE `int_value` ADD CONSTRAINT `int_value_fk0` FOREIGN KEY (`id_entity`) REFERENCES `entity_ids`(`id_entity`);

ALTER TABLE `int_value` ADD CONSTRAINT `int_value_fk1` FOREIGN KEY (`id_attribute`) REFERENCES `attributes`(`id_attribute`);

ALTER TABLE `varchar_value ` ADD CONSTRAINT `varchar_value _fk0` FOREIGN KEY (`id_entity`) REFERENCES `entity_ids`(`id_entity`);

ALTER TABLE `varchar_value ` ADD CONSTRAINT `varchar_value _fk1` FOREIGN KEY (`id_attribute`) REFERENCES `attributes`(`id_attribute`);

ALTER TABLE `date_value` ADD CONSTRAINT `date_value_fk0` FOREIGN KEY (`id_entity`) REFERENCES `entity_ids`(`id_entity`);

ALTER TABLE `date_value` ADD CONSTRAINT `date_value_fk1` FOREIGN KEY (`id_attribute`) REFERENCES `attributes`(`id_attribute`);

