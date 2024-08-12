CREATE DATABASE IF NOT EXISTS `ecommerce`
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE ecommerce;

SET foreign_key_checks = 0;
-- Table structure for table `user`
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` VARCHAR(100) NOT NULL, -- UUID
    `user_first_name` VARCHAR(150) NOT NULL,
    `user_last_name` VARCHAR(150) NOT NULL,
    `user_picture` VARCHAR(150) DEFAULT NULL,
    `username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `user` table
INSERT INTO `user` (`id`, `user_first_name`, `user_last_name`, `user_picture`, `username`, `password`, `email`, `phone_number`, `created_at`, `updated_at`)
VALUES 
('1', 'Ocean', 'The', 'the0cean.jpg', 'admin', 'admin', 'admin@gmail.com', '0397546319', NOW(), NOW()),
('2', 'Nguyen', 'Hai Duong', 'nguyenhaiduong.jpg', 'user', 'user', 'nguyenhaiduong2300@gmail.com', '0397546318', NOW(), NOW()),
('3', 'Nguyen', 'Ding Cong', 'dingcong.jpg', 'employee', 'employee', 'employee@gmail.com', '0397546320', NOW(), NOW());

-- Table structure for table `role`
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `role` table
INSERT INTO `role` (`role_name`)
VALUES 
('Admin'),
('Customer'),
('Employee');

-- Table structure for table `user_role`
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
    `user_id` VARCHAR(100) NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`role_id`) REFERENCES `role`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `user_role` table
INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES 
('1', 1),  -- Ocean as Admin
('2', 2),  -- Nguyen Hai Duong as Customer
('3', 3);  -- Nguyen Ding Cong as Employee

-- Table structure for table `category`
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
    `id` VARCHAR(100) NOT NULL, -- UUID
    `name` VARCHAR(150) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `category` table
INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`)
VALUES 
('1', 'Laptop', NOW(), NOW()),
('2', 'Keyboard', NOW(), NOW()),
('3', 'Screen', NOW(), NOW()),
('4', 'Arm', NOW(), NOW()),
('5', 'Mouse', NOW(), NOW()),
('6', 'Chair', NOW(), NOW());

-- Table structure for table `product`
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
    `id` VARCHAR(100) NOT NULL, -- UUID
    `name` VARCHAR(150) NOT NULL,
    `description` TEXT,
    `version` VARCHAR(100) DEFAULT NULL,
    `color` VARCHAR(50) DEFAULT NULL,
    `product_type` VARCHAR(50) DEFAULT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `stock` INT NOT NULL,
    `category_id` VARCHAR(100),
    `image_url` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data insertion
INSERT INTO `product` (`id`, `name`, `description`, `version`, `color`, `product_type`, `price`, `stock`, `category_id`, `image_url`)
VALUES
    ('1', 'Dell XPS 13', 'High-performance laptop', '2024', 'Silver', 'Imported', 999.99, 10, '1', 'https://example.com/dell-xps-13.jpg'),
    ('2', 'MacBook Pro 14', 'Professional laptop', '2023', 'Space Gray', 'Imported', 1999.99, 5, '1', 'https://example.com/macbook-pro-14.jpg'),
    ('3', 'Logitech G Pro Keyboard', 'Mechanical gaming keyboard', '2023', 'Black', 'Outlet', 129.99, 20, '2', 'https://example.com/logitech-g-pro.jpg'),
    ('4', 'Corsair K95 RGB Platinum', 'RGB mechanical keyboard', '2022', 'Black', 'Imported', 199.99, 15, '2', 'https://example.com/corsair-k95.jpg'),
    ('5', 'Herman Miller Aeron Chair', 'Ergonomic office chair', '2021', 'Black', 'Imported', 1199.99, 8, '3', 'https://example.com/herman-miller-aeron.jpg'),
    ('6', 'Secretlab Omega 2020', 'Gaming chair', '2020', 'Black', 'Outlet', 399.99, 12, '3', 'https://example.com/secretlab-omega.jpg'),
    ('7', 'HP Spectre x360', 'Convertible laptop', '2023', 'Dark Blue', 'Imported', 1399.99, 10, '1', 'https://example.com/hp-spectre-x360.jpg'),
    ('8', 'Asus ROG Strix', 'Gaming laptop', '2023', 'Black', 'Imported', 1499.99, 8, 1, 'https://example.com/asus-rog-strix.jpg'),
    ('9', 'Microsoft Surface Laptop 4', 'Ultra-thin laptop', '2022', 'Platinum', 'Imported', 1299.99, 7, '1', 'https://example.com/surface-laptop-4.jpg'),
    ('10', 'Razer BlackWidow Elite', 'Gaming mechanical keyboard', '2021', 'Black', 'Outlet', 139.99, 25, '2', 'https://example.com/razer-blackwidow-elite.jpg'),
    ('11', 'Apple Magic Keyboard', 'Wireless keyboard', '2022', 'White', 'Imported', 99.99, 30, '2', 'https://example.com/apple-magic-keyboard.jpg'),
    ('12', 'Steelcase Leap Chair', 'Ergonomic chair', '2020', 'Black', 'Imported', 899.99, 5, '3', 'https://example.com/steelcase-leap.jpg'),
    ('13', 'Noblechairs Hero', 'Gaming chair', '2021', 'Black/Red', 'Outlet', 449.99, 10, 3, 'https://example.com/noblechairs-hero.jpg'),
    ('14', 'Lenovo ThinkPad X1 Carbon', 'Business laptop', '2023', 'Black', 'Imported', 1599.99, 6, '1', 'https://example.com/thinkpad-x1-carbon.jpg'),
    ('15', 'Acer Predator Helios 300', 'Gaming laptop', '2022', 'Black', 'Imported', 1299.99, 9, '1', 'https://example.com/predator-helios-300.jpg'),
    ('16', 'Cherry MX Board 6.0', 'Mechanical keyboard', '2021', 'Black', 'Outlet', 149.99, 20, '2', 'https://example.com/cherry-mx-board.jpg'),
    ('17', 'HyperX Alloy Elite 2', 'RGB mechanical keyboard', '2022', 'Black', 'Imported', 129.99, 25, '2', 'https://example.com/hyperx-alloy-elite.jpg'),
    ('18', 'Humanscale Freedom Chair', 'Ergonomic chair', '2020', 'Black', 'Imported', 999.99, 7, '3', 'https://example.com/humanscale-freedom.jpg'),
    ('19', 'DXRacer Formula Series', 'Gaming chair', '2021', 'Black/Blue', 'Outlet', 349.99, 12, 3, 'https://example.com/dxracer-formula.jpg'),
    ('20', 'Alienware m15 R6', 'Gaming laptop', '2023', 'Dark Side of the Moon', 'Imported', 1899.99, 6, '1', 'https://example.com/alienware-m15.jpg'),
    ('21', 'LG Gram 17', 'Ultra-light laptop', '2023', 'White', 'Imported', 1599.99, 5, '1', 'https://example.com/lg-gram-17.jpg'),
    ('22', 'Ducky One 2 Mini', 'Compact mechanical keyboard', '2021', 'White', 'Outlet', 99.99, 30, '2', 'https://example.com/ducky-one-2-mini.jpg'),
    ('23', 'MSI GF65 Thin', 'Gaming laptop', '2023', 'Black', 'Imported', 1199.99, 10, 1, 'https://example.com/msi-gf65.jpg'),
    ('24', 'Samsung Odyssey G9', 'Curved gaming monitor', '2021', 'Black', 'Imported', 1499.99, 5, '1', 'https://example.com/samsung-odyssey-g9.jpg'),
    ('25', 'ErgoChair 2', 'Ergonomic office chair', '2020', 'Gray', 'Imported', 399.99, 8, '3', 'https://example.com/ergochair-2.jpg'),
    ('26', 'Vertagear SL5000', 'Gaming chair', '2021', 'Black/Green', 'Outlet', 429.99, 11, '3', 'https://example.com/vertagear-sl5000.jpg'),
    ('27', 'Razer Blade 15', 'Gaming laptop', '2022', 'Black', 'Imported', 1999.99, 7, '1', 'https://example.com/razer-blade-15.jpg'),
    ('28', 'HP Omen 15', 'Gaming laptop', '2023', 'Black', 'Imported', 1499.99, 9, '1', 'https://example.com/hp-omen-15.jpg'),
    ('29', 'Kinesis Advantage2', 'Ergonomic keyboard', '2022', 'Black', 'Outlet', 349.99, 15, '2', 'https://example.com/kinesis-advantage2.jpg'),
    ('30', 'Das Keyboard 4', 'Professional mechanical keyboard', '2021', 'Black', 'Imported', 169.99, 20, '2', 'https://example.com/das-keyboard-4.jpg'),
    ('31', 'Flexispot Standing Desk', 'Adjustable standing desk', '2022', 'Black', 'Imported', 499.99, 5, '3', 'https://example.com/flexispot-standing-desk.jpg'),
    ('32', 'Arozzi Verona V2', 'Gaming chair', '2020', 'Black/Red', 'Outlet', 299.99, 14, '3', 'https://example.com/arozzi-verona-v2.jpg'),
    ('33', 'Gigabyte Aero 15', 'Gaming laptop', '2023', 'Black', 'Imported', 1799.99, 5, 1, 'https://example.com/gigabyte-aero-15.jpg'),
    ('34', 'Roccat Vulcan 120 AIMO', 'RGB mechanical keyboard', '2021', 'Black', 'Outlet', 159.99, 22, '2', 'https://example.com/roccat-vulcan.jpg'),
    ('35', 'Noblechairs Epic', 'Gaming chair', '2021', 'Black/White', 'Outlet', 439.99, 12, '3', 'https://example.com/noblechairs-epic.jpg'),
    ('36', 'Apple MacBook Air', 'Thin and light laptop', '2023', 'Gold', 'Imported', 1299.99, 8, '1', 'https://example.com/macbook-air.jpg'),
    ('37', 'Corsair K70 RGB MK.2', 'Mechanical keyboard', '2022', 'Black', 'Outlet', 159.99, 20, 2, 'https://example.com/corsair-k70.jpg'),
    ('38', 'Herman Miller Embody Chair', 'Ergonomic office chair', '2020', 'Black', 'Imported', 1499.99, 6, '3', 'https://example.com/herman-miller-embody.jpg'),
    ('39', 'DXRacer King Series', 'Gaming chair', '2021', 'Black/Gold', 'Outlet', 499.99, 9, '3', 'https://example.com/dxracer-king.jpg'),
    ('40', 'Microsoft Surface Pro 7', '2-in-1 laptop', '2022', 'Platinum', 'Imported', 999.99, 7, '1', 'https://example.com/surface-pro-7.jpg'),
    ('41', 'Razer Turret', 'Wireless gaming keyboard and mouse', '2021', 'Black', 'Outlet', 249.99, 15, '2', 'https://example.com/razer-turret.jpg'),
    ('42', 'Steelcase Series 1', 'Ergonomic chair', '2020', 'Black', 'Imported', 499.99, 8, '3', 'https://example.com/steelcase-series-1.jpg'),
    ('43', 'Noblechairs Hero Series', 'Gaming chair', '2021', 'Black/Blue', 'Outlet', 499.99, 9, '3', 'https://example.com/noblechairs-hero-series.jpg'),
    ('44', 'Asus ZenBook Duo', 'Dual-screen laptop', '2023', 'Celestial Blue', 'Imported', 1799.99, 6, '1', 'https://example.com/asus-zenbook-duo.jpg'),
    ('45', 'Razer Huntsman Elite', 'Gaming keyboard', '2021', 'Black', 'Outlet', 199.99, 18, '2', 'https://example.com/razer-huntsman.jpg'),
    ('46', 'Steelcase Gesture', 'Ergonomic office chair', '2020', 'Black', 'Imported', 1049.99, 7, '3', 'https://example.com/steelcase-gesture.jpg'),
    ('47', 'Secretlab Titan 2020', 'Gaming chair', '2020', 'Black', 'Outlet', 429.99, 13, '3', 'https://example.com/secretlab-titan.jpg'),
    ('48', 'Dell G5 15', 'Gaming laptop', '2023', 'Black', 'Imported', 1299.99, 8, 1, 'https://example.com/dell-g5-15.jpg'),
    ('49', 'Cooler Master MK730', 'Mechanical keyboard', '2021', 'Black', 'Outlet', 119.99, 20, '2', 'https://example.com/cooler-master-mk730.jpg'),
    ('50', 'Noblechairs Icon', 'Gaming chair', '2021', 'Black', 'Outlet', 419.99, 12, '3', 'https://example.com/noblechairs-icon.jpg');


-- Table structure for table `cart`
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `cart` table
INSERT INTO `cart` (`user_id`, `created_at`, `updated_at`)
VALUES 
('2', NOW(), NOW());  -- Cart for Nguyen Hai Duong

-- Table structure for table `order`
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
    `id` VARCHAR(100) NOT NULL,  -- UUID
    `user_id` VARCHAR(100) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `order` table
INSERT INTO `order` (`id`, `user_id`, `status`, `total_price`, `created_at`, `updated_at`)
VALUES 
('1', '2', 'Pending', 99.98, NOW(), NOW());  -- Order for Nguyen Hai Duong

-- Table structure for table `order_item`
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
    `id` VARCHAR(100) NOT NULL, -- UUID
    `order_id` VARCHAR(100) NOT NULL,
    `product_id` VARCHAR(100) NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `image_url` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `order_item` table
INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `quantity`, `price`, `image_url`)
VALUES 
('1', '1', '1', 1, 999.99, 'example.jpg'),  -- Product Dell XPS 13 for Order 1
('2', '1', '2', 1, 1999.99, 'example.jpg'); -- Product MacBook Pro 14 for Order 1

-- Table structure for table `shipment`
DROP TABLE IF EXISTS `shipment`;
CREATE TABLE `shipment` (
    `id` VARCHAR(100) NOT NULL, -- uuid
    `order_id` VARCHAR(100) NOT NULL,
    `tracking_number` VARCHAR(100) NOT NULL,
    `carrier` VARCHAR(100) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `shipped_date` DATE,
    `delivery_date` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample data into `shipment` table
INSERT INTO `shipment` (`id`, `order_id`, `tracking_number`, `carrier`, `status`, `shipped_date`, `delivery_date`)
VALUES 
('1', '1', '123456789', 'UPS', 'Shipped', NOW(), NOW() + INTERVAL 5 DAY);

SET foreign_key_checks = 1;
/* PROCEDURE
--
-- Create procedure for database 
--
*/

-- 
-- User procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertUser;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
	IN p_id VARCHAR(100),
    IN p_user_first_name VARCHAR(150),
    IN p_user_last_name VARCHAR(150),
    IN p_user_picture VARCHAR(150),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(50),
    IN p_phone_number VARCHAR(50)
)
BEGIN
    INSERT INTO user (id, user_first_name, user_last_name, user_picture, username, password, email, phone_number, created_at, updated_at)
    VALUES (p_id, p_user_first_name, p_user_last_name, p_user_picture, p_username, p_password, p_email, p_phone_number, NOW(), NOW());
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetUserAll;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserAll`()
BEGIN
    SELECT * FROM `user`;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetUserByID;
CREATE PROCEDURE GetUserByID(IN p_id VARCHAR(100))
BEGIN
    SELECT * FROM user WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetUserByAccount;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserByAccount`(
	IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    SELECT * FROM `user` WHERE username = p_username and password = p_password;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateUser;
CREATE PROCEDURE UpdateUser(
    IN p_id VARCHAR(100),
    IN p_user_first_name VARCHAR(150),
    IN p_user_last_name VARCHAR(150),
    IN p_user_picture VARCHAR(150),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(50),
    IN p_phone_number VARCHAR(50)
)
BEGIN
    UPDATE user
    SET user_first_name = p_user_first_name,
        user_last_name = p_user_last_name,
        user_picture = p_user_picture,
        username = p_username,
        password = p_password,
        email = p_email,
        phone_number = p_phone_number,
        updated_at = NOW()
    WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS DeleteUser;
CREATE PROCEDURE DeleteUser(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM user WHERE id = p_id;
END$$
DELIMITER ;

-- 
-- Product procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertProduct;
CREATE DEFINER=root@localhost PROCEDURE InsertProduct(
	IN p_id VARCHAR(100),
    IN p_name VARCHAR(150),
    IN p_description TEXT,
    IN p_version VARCHAR(100),
    IN p_color VARCHAR(50),
    IN p_product_type VARCHAR(50),
    IN p_price DECIMAL(10, 2),
    IN p_stock INT,
    IN p_category_id INT,
    IN p_image_url VARCHAR(255)
)
BEGIN
    INSERT INTO product (id, name, description, version, color, product_type, price, stock, category_id, image_url, created_at, updated_at)
    VALUES (p_id, p_name, p_description, p_version, p_color, p_product_type, p_price, p_stock, p_category_id, p_image_url, NOW(), NOW());
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetProductAll;
CREATE PROCEDURE GetProductAll()
BEGIN
    SELECT * FROM product;
END$$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS GetProductByID;
CREATE PROCEDURE GetProductByID(IN p_id VARCHAR(100))
BEGIN
    SELECT * FROM product WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateProduct;
USE `ecommerce`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProduct`(
    IN p_id VARCHAR(100),
    IN p_name VARCHAR(150),
    IN p_description TEXT,
    IN p_version VARCHAR(100),
    IN p_color VARCHAR(50),
    IN p_product_type VARCHAR(50),
    IN p_price DECIMAL(10, 2),
    IN p_stock INT,
    IN p_category_id VARCHAR(100),
    IN P_image_url VARCHAR(250)
)
BEGIN
    UPDATE product
    SET name = p_name,
        description = p_description,
        version = p_version,
        color = p_color,
        product_type = p_product_type,
        price = p_price,
        stock = p_stock,
        category_id = p_category_id,
        image_url = p_image_url,
        updated_at = NOW()
    WHERE id = p_id;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS DeleteProduct;
CREATE PROCEDURE DeleteProduct(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM product WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS SearchProduct;
USE `ecommerce`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProduct`(
	IN p_pageIndex int,
    IN p_pageSize int,
    IN p_search_content varchar(500)
)
BEGIN
    DECLARE p_total_row long;    
    SET @row_number := 0;
		DROP TEMPORARY TABLE IF EXISTS DataTemp;
        CREATE TEMPORARY TABLE DataTemp AS
        SELECT p.id,
               p.name,
               p.description
        FROM ecommerce.product p
        WHERE (p_search_content IS NULL
           OR CONCAT(COALESCE(p.name, ''), COALESCE(p.description, '')) LIKE CONCAT('%', p_search_content, '%'));
        
        DROP TEMPORARY TABLE IF EXISTS Results;
        CREATE TEMPORARY TABLE Results AS
        SELECT *, (@row_number := @row_number + 1) AS RowNumber
        FROM DataTemp;
        DROP TABLE DataTemp;
        SELECT COUNT(*) INTO p_total_row FROM Results;
        SELECT *, p_total_row AS RecordCount
        FROM Results
        WHERE RowNumber BETWEEN ((p_pageIndex - 1) * p_pageSize) + 1 AND (p_pageIndex * p_pageSize);
        DROP TABLE Results;
END$$

-- 
-- Order procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertOrder;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrder`(
    IN p_user_id VARCHAR(100),
    IN p_status VARCHAR(50),
    IN p_total_price DECIMAL(10, 2)
)
BEGIN
    INSERT INTO `order` (user_id, status, total_price, created_at, updated_at)
    VALUES (p_user_id, p_status, p_total_price, NOW(), NOW());
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetOrderByID;
CREATE PROCEDURE GetOrderByID(IN p_id VARCHAR(100))
BEGIN
    SELECT * FROM `order` WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateOrder;
CREATE PROCEDURE UpdateOrder(
    IN p_id VARCHAR(100),
    IN p_user_id VARCHAR(100),
    IN p_status VARCHAR(50),
    IN p_total_price DECIMAL(10, 2)
)
BEGIN
    UPDATE `order`
    SET user_id = p_user_id,
        status = p_status,
        total_price = p_total_price,
        updated_at = NOW()
    WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS DeleteOrder;
CREATE PROCEDURE DeleteOrder(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM `order` WHERE id = p_id;
END$$
DELIMITER ;

-- 
-- Order Item procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertOrderItem;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrderItem`(
    IN p_order_id VARCHAR(100),
    IN p_product_id VARCHAR(100),
    IN p_quantity INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    INSERT INTO order_item (order_id, product_id, quantity, price)
    VALUES (p_order_id, p_product_id, p_quantity, p_price);
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `GetOrderItemByID`;
CREATE PROCEDURE GetOrderItemByID(IN p_id INT)
BEGIN
    SELECT * FROM `order_item` WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateOrderItem;
CREATE PROCEDURE UpdateOrderItem(
    IN p_id VARCHAR(100),
    IN p_order_id VARCHAR(100),
    IN p_product_id VARCHAR(100),
    IN p_quantity INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    UPDATE order_item
    SET order_id = p_order_id,
        product_id = p_product_id,
        quantity = p_quantity,
        price = p_price
    WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS DeleteOrderItem;
CREATE PROCEDURE DeleteOrderItem(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM order_item WHERE id = p_id;
END$$
DELIMITER ;

-- 
-- Payment procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertPayment;
CREATE PROCEDURE InsertPayment(
    IN p_order_id VARCHAR(100),
    IN p_amount DECIMAL(10, 2),
    IN p_method VARCHAR(50),
    IN p_status VARCHAR(50)
)
BEGIN
    INSERT INTO payment (order_id, amount, method, status, created_at)
    VALUES (p_order_id, p_amount, p_method, p_status, NOW());
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetPaymentByID;
CREATE PROCEDURE GetPaymentByID(IN p_id VARCHAR(100))
BEGIN
    SELECT * FROM payment WHERE id = p_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS UpdatePayment;
DELIMITER $$
CREATE PROCEDURE UpdatePayment(
    IN p_id VARCHAR(100),
    IN p_order_id VARCHAR(100),
    IN p_amount DECIMAL(10, 2),
    IN p_method VARCHAR(50),
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE payment
    SET order_id = p_order_id,
        amount = p_amount,
        method = p_method,
        status = p_status
    WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS DeletePayment;
CREATE PROCEDURE DeletePayment(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM payment WHERE id = p_id;
END$$
DELIMITER ;

-- 
-- Shipment procedures
-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertShipment;
CREATE PROCEDURE InsertShipment(
    IN p_order_id VARCHAR(100),
    IN p_address VARCHAR(255),
    IN p_status VARCHAR(50)
)
BEGIN
    INSERT INTO shipment (order_id, address, status, created_at)
    VALUES (p_order_id, p_address, p_status, NOW());
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS GetShipmentByID;
CREATE PROCEDURE GetShipmentByID(IN p_id VARCHAR(100))
BEGIN
    SELECT * FROM shipment WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateShipment;
CREATE PROCEDURE UpdateShipment(
    IN p_id VARCHAR(100),
    IN p_order_id VARCHAR(100),
    IN p_address VARCHAR(255),
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE shipment
    SET order_id = p_order_id,
        address = p_address,
        status = p_status
    WHERE id = p_id;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS DeleteShipment;
CREATE PROCEDURE DeleteShipment(IN p_id VARCHAR(100))
BEGIN
    DELETE FROM shipment WHERE id = p_id;
END$$
DELIMITER ;