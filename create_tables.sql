-- Create DB schema and set as default --
CREATE SCHEMA `pbdm_booking_platform_db`;
USE `pbdm_booking_platform_db`;

-- Create reference tables --
CREATE TABLE `pbdm_booking_platform_db`.`properties` (
  `property_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `property` VARCHAR(100) UNIQUE NOT NULL,
  PRIMARY KEY (`property_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`payment_methods` (
  `method_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `method` VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY (`method_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`ticket_categories` (
  `category_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(100) UNIQUE NOT NULL,
  PRIMARY KEY (`category_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`ticket_status` (
  `status_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY (`status_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`account_status` (
  `status_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY (`status_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`roles` (
  `role_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(50) UNIQUE NOT NULL,
  `account_type` ENUM('user', 'employee') NOT NULL,
  PRIMARY KEY (`role_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`permissions` (
  `permission_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `permission` VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (`permission_id`)
  );

-- Create entity tables (starting with those without FKs) --
CREATE TABLE `pbdm_booking_platform_db`.`employees` (
  `employee_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) UNIQUE NOT NULL,
  PRIMARY KEY (`employee_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`addresses` (
  `address_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `street_no` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`address_id`)
  );

CREATE TABLE `pbdm_booking_platform_db`.`users` (
  `user_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `status_id` INT NOT NULL DEFAULT 1,
  `pref_pay_method_id` INT,
  `phone` VARCHAR(20),
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`status_id`) REFERENCES `account_status`(`status_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`pref_pay_method_id`) REFERENCES `payment_methods`(`method_id`) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (`address_id`) REFERENCES `addresses`(`address_id`) ON UPDATE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`accommodations` (
  `accomm_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `owner_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `max_guests` INT,
  `bedrooms` INT,
  `bathrooms` INT,
  `listed` DATETIME NOT NULL,
  `updated` DATETIME,
  PRIMARY KEY (`accomm_id`),
  FOREIGN KEY (`owner_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`address_id`) REFERENCES `addresses`(`address_id`) ON UPDATE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`pictures` (
  `pic_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `accomm_id` INT NOT NULL,
  `size` DECIMAL(6,3),
  `format` VARCHAR(10) NOT NULL,
  `preview` BOOLEAN NOT NULL DEFAULT FALSE,
  `uploaded` DATETIME NOT NULL,
  PRIMARY KEY (`pic_id`),
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`availability` (
  `availability_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `available_from` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `available_to` DATE NOT NULL DEFAULT '9999-12-31',
  `accomm_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`availability_id`),
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );
  
CREATE TABLE `pbdm_booking_platform_db`.`tickets` (
  `ticket_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL DEFAULT 12,
  `title` VARCHAR(255) NOT NULL,
  `ticket_text` TEXT NOT NULL,
  `created` DATETIME NOT NULL,
  `last_updated` DATETIME,
  `employee_id` INT,
  `status_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`ticket_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`category_id`) REFERENCES `ticket_categories`(`category_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`status_id`) REFERENCES `ticket_status`(`status_id`)  ON UPDATE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`ticket_updates` (
  `update_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `ticket_id` BIGINT NOT NULL,
  `action` TEXT NOT NULL,
  `updated` DATETIME NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`update_id`),
  FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`ticket_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`) ON UPDATE CASCADE
  );
  
-- Update the last_updated timestamp after creating the ticket_updates table with a trigger --
DELIMITER //

CREATE TRIGGER update_tickets_last_updated
AFTER INSERT ON `pbdm_booking_platform_db`.`ticket_updates`
FOR EACH ROW
BEGIN
	UPDATE `pbdm_booking_platform_db`.`tickets`
    SET `last_updated` = NEW.`updated`
    WHERE `ticket_id` = NEW.`ticket_id`;
END;
//

DELIMITER ;

CREATE TABLE `pbdm_booking_platform_db`.`payments` (
  `payment_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `payment_method_id` INT NOT NULL,
  `amount` DECIMAL(10,2),
  `paid` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `confirmed` BOOLEAN NOT NULL DEFAULT FALSE,
  `refunded` BOOLEAN NOT NULL DEFAULT FALSE,  
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods`(`method_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`bookings` (
  `booking_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `guest_id` INT NOT NULL,
  `accomm_id` INT NOT NULL,
  `booked_from` DATE NOT NULL,
  `booked_to` DATE NOT NULL,
  `no_nights` INT GENERATED ALWAYS AS (DATEDIFF(`booked_to`, `booked_from`)) STORED,
  `no_guests` INT NOT NULL CHECK (`no_guests` > 0),
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  FOREIGN KEY (`guest_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE,
  CHECK (booked_from < booked_to)
  );

CREATE TABLE `pbdm_booking_platform_db`.`ratings` (
  `rating_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `booking_id` BIGINT NOT NULL,
  `rtng_count` INT NOT NULL CHECK (rtng_count BETWEEN 1 AND 5),
  `rtng_text` TEXT,
  `guest_id` INT NOT NULL,
  `accomm_id` INT NOT NULL,
  PRIMARY KEY (`rating_id`),
  FOREIGN KEY (`booking_id`) REFERENCES `bookings`(`booking_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`guest_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`conversations` (
  `conversation_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `guest_id` INT NOT NULL,
  `host_id` INT NOT NULL,
  `accomm_id` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `message_count` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`conversation_id`),
  FOREIGN KEY (`guest_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`host_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE
  );
  
-- Create Trigger to check that host and guest can't be the same user in one conversation --
DELIMITER //

CREATE TRIGGER prevent_conversations_have_same_users
BEFORE INSERT ON conversations
FOR EACH ROW
BEGIN
	IF NEW.`guest_id` = NEW.`host_id` THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guest and host cannot be the same user.';
	END IF;
END;
//

DELIMITER ;

CREATE TABLE `pbdm_booking_platform_db`.`messages` (
  `message_id` BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
  `conversation_id` BIGINT NOT NULL,
  `sender_id` INT NOT NULL,
  `message_text` TEXT,
  `sent` DATETIME NOT NULL,
  `read` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`message_id`),
  FOREIGN KEY (`conversation_id`) REFERENCES `conversations`(`conversation_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`sender_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE
  );

-- Update the message count after creating the messages table --
DELIMITER //

CREATE TRIGGER update_conversations_message_count
AFTER INSERT ON `pbdm_booking_platform_db`.`messages`
FOR EACH ROW
BEGIN
	UPDATE `pbdm_booking_platform_db`.`conversations`
    SET `message_count` = (
		SELECT COUNT(*)
        FROM `pbdm_booking_platform_db`.`messages`
		WHERE `conversation_id` = NEW.`conversation_id`
        )
    WHERE `conversation_id` = NEW.`conversation_id`;
END;
//

DELIMITER ;
  
-- Create mapping tables --
CREATE TABLE `pbdm_booking_platform_db`.`accommodation_properties` (
  `property_id` INT NOT NULL,
  `accomm_id` INT NOT NULL,
  FOREIGN KEY (`property_id`) REFERENCES `properties`(`property_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`favorites` (
  `user_id` INT NOT NULL,
  `accomm_id` INT NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`accomm_id`) REFERENCES `accommodations`(`accomm_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`booking_payments` (
  `payment_id` BIGINT NOT NULL,
  `booking_id` BIGINT NOT NULL,
  FOREIGN KEY (`payment_id`) REFERENCES `payments`(`payment_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`booking_id`) REFERENCES `bookings`(`booking_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );
  
CREATE TABLE `pbdm_booking_platform_db`.`user_roles` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`employee_roles` (
  `employee_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE `pbdm_booking_platform_db`.`role_permissions` (
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`permission_id`) ON UPDATE CASCADE ON DELETE CASCADE
  );
