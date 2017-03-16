CREATE TABLE `managers` (
	`id_manager` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`id_position` int,
	PRIMARY KEY (`id_manager`)
);

CREATE TABLE `positions` (
	`id_position` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20),
	PRIMARY KEY (`id_position`)
);

CREATE TABLE `clients` (
	`id_client` int NOT NULL AUTO_INCREMENT,
	`id_clients_group` int NOT NULL,
	`first_name` varchar(20),
	`patronymic` varchar(20),
	`surname` varchar(20),
	`company_name` varchar(50),
	`address` varchar(50),
	`phone_number` varchar(20),
	`id_manager` int,
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

CREATE TABLE `convectors` (
	`id_convector` int NOT NULL AUTO_INCREMENT,
	`name` int DEFAULT 'convector',
	`id_depth` int,
	`id_width` int,
	`id_length` int,
	`grille_type` int,
	`power` int,
	`weigh` int,
	PRIMARY KEY (`id_convector`)
);

CREATE TABLE `convectors_in_deals` (
	`id_deal` int NOT NULL,
	`id_convector` int NOT NULL,
	`quantity` int
);

CREATE TABLE `lengths` (
	`id_length` int NOT NULL AUTO_INCREMENT,
	`value` int,
	PRIMARY KEY (`id_length`)
);

CREATE TABLE `depths` (
	`id_depth` int NOT NULL AUTO_INCREMENT,
	`value` int,
	PRIMARY KEY (`id_depth`)
);

CREATE TABLE `widths` (
	`id_width` int NOT NULL AUTO_INCREMENT,
	`value` int,
	PRIMARY KEY (`id_width`)
);

CREATE TABLE `grille_types` (
	`id_grille_type` int NOT NULL AUTO_INCREMENT,
	`value` varchar(20),
	PRIMARY KEY (`id_grille_type`)
);

ALTER TABLE `managers` ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`id_position`) REFERENCES `positions`(`id_position`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk0` FOREIGN KEY (`id_clients_group`) REFERENCES `clients_groups`(`id_clients_group`);

ALTER TABLE `clients` ADD CONSTRAINT `clients_fk1` FOREIGN KEY (`id_manager`) REFERENCES `managers`(`id_manager`);

ALTER TABLE `deals` ADD CONSTRAINT `deals_fk0` FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

ALTER TABLE `convectors` ADD CONSTRAINT `convectors_fk0` FOREIGN KEY (`id_depth`) REFERENCES `depths`(`id_depth`);

ALTER TABLE `convectors` ADD CONSTRAINT `convectors_fk1` FOREIGN KEY (`id_width`) REFERENCES `widths`(`id_width`);

ALTER TABLE `convectors` ADD CONSTRAINT `convectors_fk2` FOREIGN KEY (`id_length`) REFERENCES `lengths`(`id_length`);

ALTER TABLE `convectors` ADD CONSTRAINT `convectors_fk3` FOREIGN KEY (`grille_type`) REFERENCES `grille_types`(`id_grille_type`);

ALTER TABLE `convectors_in_deals` ADD CONSTRAINT `convectors_in_deals_fk0` FOREIGN KEY (`id_deal`) REFERENCES `deals`(`id_deal`);

ALTER TABLE `convectors_in_deals` ADD CONSTRAINT `convectors_in_deals_fk1` FOREIGN KEY (`id_convector`) REFERENCES `convectors`(`id_convector`);

