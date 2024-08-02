CREATE TABLE `catalogo` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
    `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
    `name` varchar(255) DEFAULT NULL,
    `price` decimal(10, 2) DEFAULT NULL,
    `stock` int(11) DEFAULT NULL,
    `status` char(3) DEFAULT 'ACT',
    `category_id` int(11) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

ALTER TABLE `catalogo` 
ADD CONSTRAINT fk_catalogos_categories 
FOREIGN KEY (`category_id`) 
REFERENCES `categories`(`category_id`);

INSERT INTO `catalogo` (`create_time`, `name`, `price`, `stock`, `status`, `category_id`)
VALUES
(NOW(), 'Producto 1', 100.00, 10, 'ACT', 1),
(NOW(), 'Producto 2', 200.00, 20, 'ACT', 1),
(NOW(), 'Producto 3', 150.00, 15, 'ACT', 2);
DROP TABLE IF EXISTS `catalogo`;