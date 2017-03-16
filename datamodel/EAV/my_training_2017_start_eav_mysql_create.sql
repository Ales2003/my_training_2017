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

CREATE TABLE `clients_attributes` (
	`id_attribute` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
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
	`id_product` int NOT NULL AUTO_INCREMENT,
	`id_product_group` int NOT NULL,
	PRIMARY KEY (`id_product`)
);

CREATE TABLE `products_in_deals` (
	`id_deal` int NOT NULL,
	`id_product` int NOT NULL,
	`quantity` int
);

CREATE TABLE `varchar_client_attribute_values` (
	`id_attribute` int NOT NULL,
	`id_client` int NOT NULL,
	`value` varchar(20)
);

CREATE TABLE `clients` (
	`id_client` int NOT NULL AUTO_INCREMENT,
	`id_manager` int NOT NULL,
	`id_clients_group` int NOT NULL,
	PRIMARY KEY (`id_client`)
);

CREATE TABLE `varchar_product_attribute_values` (
	`id_attribute` int NOT NULL,
	`id_product` int NOT NULL,
	`value` varchar(20)
);

CREATE TABLE `product_groups` (
	`id_product_group` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_product_group`)
);

CREATE TABLE `products_attributes` (
	`id_attribute` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_attribute`)
);

CREATE TABLE `int_product_attribute_values` (
	`id_attribute` int NOT NULL,
	`id_product` int NOT NULL,
	`value` int
);

CREATE TABLE `date_client_attribute_values` (
	`id_attribute` int NOT NULL,
	`id_client` int NOT NULL,
	`value` DATE
);

ALTER TABLE `managers` ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`id_position`) REFERENCES `positions`(`id_position`);

ALTER TABLE `deals` ADD CONSTRAINT `deals_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`id_product_group`) REFERENCES `product_groups`(`id_product_group`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk0` FOREIGN KEY (`id_deal`) REFERENCES `deals`(`id_deal`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk1` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

ALTER TABLE `varchar_client_attribute_values` ADD CONSTRAINT `varchar_client_attribute_values_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `clients_attributes`(`id_attribute`);

ALTER TABLE `varchar_client_attribute_values` ADD CONSTRAINT `varchar_client_attribute_values_fk1` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk0` FOREIGN KEY (`id_manager`) REFERENCES `managers`(`id_manager`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk1` FOREIGN KEY (`id_clients_group`) REFERENCES `clients_groups`(`id_clients_group`);

ALTER TABLE `varchar_product_attribute_values` ADD CONSTRAINT `varchar_product_attribute_values_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `products_attributes`(`id_attribute`);

ALTER TABLE `varchar_product_attribute_values` ADD CONSTRAINT `varchar_product_attribute_values_fk1` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

ALTER TABLE `int_product_attribute_values` ADD CONSTRAINT `int_product_attribute_values_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `products_attributes`(`id_attribute`);

ALTER TABLE `int_product_attribute_values` ADD CONSTRAINT `int_product_attribute_values_fk1` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

ALTER TABLE `date_client_attribute_values` ADD CONSTRAINT `date_client_attribute_values_fk0` FOREIGN KEY (`id_attribute`) REFERENCES `clients_attributes`(`id_attribute`);

ALTER TABLE `date_client_attribute_values` ADD CONSTRAINT `date_client_attribute_values_fk1` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

