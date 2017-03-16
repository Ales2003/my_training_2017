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

CREATE TABLE `biz_client_attributes` (
	`id_client` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`company_name` varchar(50),
	`address` varchar(50),
	`phone_number` varchar(20),
	PRIMARY KEY (`id_client`)
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

CREATE TABLE `person_client_attributes` (
	`id_client` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`address` varchar(50),
	`phone_number` varchar(20),
	PRIMARY KEY (`id_client`)
);

CREATE TABLE `clients` (
	`id_client` int NOT NULL AUTO_INCREMENT,
	`id_manager` int NOT NULL,
	`id_clients_group` int NOT NULL,
	PRIMARY KEY (`id_client`)
);

CREATE TABLE `convector_attributes` (
	`id_product` int NOT NULL AUTO_INCREMENT,
	`id_depth` int,
	`id_width` int,
	`id_length` int,
	`grille_type` varchar,
	`power` int,
	`weigh` int,
	PRIMARY KEY (`id_product`)
);

CREATE TABLE `conditioner_attributes` (
	`id_product` int NOT NULL AUTO_INCREMENT,
	`id_depth` int,
	`id_width` int,
	`id_length` int,
	`voltage` int,
	`power` int,
	`weigh` int,
	PRIMARY KEY (`id_product`)
);

CREATE TABLE `product_groups` (
	`id_product_group` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_product_group`)
);

ALTER TABLE `managers` ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`id_position`) REFERENCES `positions`(`id_position`);

ALTER TABLE `biz_client_attributes` ADD CONSTRAINT `biz_client_attributes_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `deals` ADD CONSTRAINT `deals_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`id_product_group`) REFERENCES `product_groups`(`id_product_group`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk0` FOREIGN KEY (`id_deal`) REFERENCES `deals`(`id_deal`);

ALTER TABLE `products_in_deals` ADD CONSTRAINT `products_in_deals_fk1` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

ALTER TABLE `person_client_attributes` ADD CONSTRAINT `person_client_attributes_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk0` FOREIGN KEY (`id_manager`) REFERENCES `managers`(`id_manager`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk1` FOREIGN KEY (`id_clients_group`) REFERENCES `clients_groups`(`id_clients_group`);

ALTER TABLE `convector_attributes` ADD CONSTRAINT `convector_attributes_fk0` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

ALTER TABLE `conditioner_attributes` ADD CONSTRAINT `conditioner_attributes_fk0` FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`);

