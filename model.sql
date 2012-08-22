-- I choose to use a traditional relational database approach. 
-- This way, I can take advantage on relationships management done by the DB engine, atomicity support, etc.
-- 
-- -----------------------------------------------------
-- Table `hotels`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `hotels` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

CREATE INDEX `idx_name` ON `hotels` (`name` ASC) ;


-- -----------------------------------------------------
-- Table `rooms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rooms` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `hotel_id` INT UNSIGNED NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `pax` INT UNSIGNED NOT NULL ,
  `quantity` INT UNSIGNED NOT NULL ,
  `price_per_night` DECIMAL UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_rooms_hotels`
    FOREIGN KEY (`hotel_id` )
    REFERENCES `hotels` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_rooms_hotels` ON `rooms` (`hotel_id` ASC) ;


-- -----------------------------------------------------
-- Table `customers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `customers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `surname` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

CREATE INDEX `idx_name` ON `customers` (`name` ASC) ;

CREATE INDEX `idx_surname` ON `customers` (`surname` ASC) ;

CREATE INDEX `idx_email` ON `customers` (`email` ASC) ;

CREATE UNIQUE INDEX `uq_email` ON `customers` (`email` ASC) ;


-- -----------------------------------------------------
-- Table `bookings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bookings` (
  `id` INT UNSIGNED NOT NULL ,
  `room_id` INT UNSIGNED NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  `arrival` DATETIME NOT NULL ,
  `leaving` DATETIME NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `status` INT NOT NULL COMMENT '1 = confirmed, -1 = cancelled' ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_reservations_rooms1`
    FOREIGN KEY (`room_id` )
    REFERENCES `rooms` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservations_customers1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `customers` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_reservations_rooms1` ON `bookings` (`room_id` ASC) ;

CREATE INDEX `fk_reservations_customers1` ON `bookings` (`customer_id` ASC) ;

CREATE INDEX `idx_arrival` ON `bookings` (`arrival` ASC) ;

CREATE INDEX `idx_leaving` ON `bookings` (`leaving` ASC) ;

CREATE INDEX `idx_created_at` ON `bookings` (`created_at` ASC) ;

CREATE UNIQUE INDEX `uq_customer_room_arrival_leaving` ON `bookings` (`room_id` ASC, `customer_id` ASC, `arrival` ASC, `leaving` ASC) ;
