CREATE TABLE `categories` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
    `category_name` varchar(128) NOT NULL COMMENT 'Category Name',
    `category_small_desc` varchar(255) DEFAULT NULL,
    `category_status` char(3) DEFAULT 'ACT' COMMENT 'Status',
    `create_time` datetime DEFAULT current_timestamp() COMMENT 'Create Time',
    `update_time` datetime DEFAULT current_timestamp() COMMENT 'Update Time',
    PRIMARY KEY (`category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Table for Categories'