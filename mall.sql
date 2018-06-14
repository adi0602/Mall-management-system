-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 12:21 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mall`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_id` (IN `dept` VARCHAR(20), OUT `genid` INT)  BEGIN
	SELECT COUNT(store_id) INTO genid from employee_details JOIN (SELECT id from stores WHERE department = dept)st ON employee_details.store_id=st.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_manager` (IN `strname` VARCHAR(20), OUT `fullname` VARCHAR(50))  NO SQL
BEGIN
	SELECT concat(fname,' ',mname,' ',lname) INTO fullname FROM employee_details WHERE id = (SELECT manager_id FROM stores WHERE name=strname);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `all_products`
--

CREATE TABLE `all_products` (
  `product_id` int(11) NOT NULL COMMENT 'foreign key',
  `store_id` int(11) NOT NULL COMMENT 'foreign key',
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_products`
--

INSERT INTO `all_products` (`product_id`, `store_id`, `price`, `stock`) VALUES
(1, 1, 1000, 245),
(1, 2, 1200, 225),
(1, 4, 1800, 750),
(1, 5, 1900, 600),
(1, 6, 1450, 550),
(1, 7, 1650, 550),
(2, 1, 1400, 304),
(2, 3, 2400, 150),
(2, 5, 900, 500),
(2, 6, 1450, 550),
(2, 7, 1400, 500),
(3, 1, 2200, 600),
(3, 5, 2100, 650),
(3, 6, 1450, 550),
(3, 7, 950, 650),
(4, 1, 1300, 550),
(4, 4, 1700, 700),
(4, 5, 2900, 800),
(4, 6, 2250, 750),
(4, 7, 650, 900),
(5, 1, 700, 950),
(5, 3, 2000, 350),
(5, 5, 1500, 550),
(6, 1, 1500, 450),
(6, 2, 1800, 100),
(6, 3, 2100, 150),
(6, 4, 1100, 550),
(6, 5, 1750, 750),
(7, 2, 1800, 100),
(7, 3, 2000, 50),
(7, 7, 2100, 800),
(8, 2, 1800, 100),
(8, 3, 2000, 50),
(8, 4, 1100, 350),
(8, 5, 1450, 950),
(8, 6, 2150, 850),
(9, 2, 3500, 850),
(9, 3, 1600, 550),
(9, 6, 1750, 700),
(9, 7, 1450, 750),
(10, 4, 1500, 650),
(11, 1, 2700, 350),
(11, 2, 7700, 150),
(11, 4, 1900, 400),
(12, 1, 2500, 650),
(12, 2, 6500, 250),
(12, 4, 1700, 450),
(13, 2, 3500, 600),
(13, 3, 2900, 700),
(13, 4, 1600, 450),
(13, 6, 2050, 950),
(13, 7, 2450, 650),
(14, 3, 1200, 500),
(14, 5, 1100, 750),
(14, 6, 1950, 350),
(14, 7, 1150, 950),
(15, 10, 250, 600),
(15, 14, 140, 600),
(16, 10, 250, 550),
(16, 14, 140, 600),
(17, 10, 250, 540),
(17, 14, 180, 600),
(18, 8, 55, 529),
(18, 9, 20, 450),
(18, 11, 45, 550),
(18, 12, 70, 800),
(18, 13, 30, 800),
(18, 14, 50, 600),
(19, 8, 55, 548),
(19, 9, 20, 540),
(19, 11, 45, 550),
(19, 12, 70, 800),
(19, 13, 30, 800),
(19, 14, 50, 600),
(20, 8, 55, 498),
(20, 9, 20, 950),
(20, 11, 45, 550),
(20, 12, 70, 800),
(20, 13, 30, 800),
(20, 14, 50, 600),
(21, 8, 55, 524),
(21, 9, 20, 700),
(21, 11, 45, 550),
(21, 12, 70, 800),
(21, 13, 30, 800),
(21, 14, 50, 600),
(22, 14, 35, 800),
(23, 9, 50, 450),
(23, 10, 150, 550),
(23, 11, 85, 550),
(23, 13, 80, 800),
(24, 9, 45, 450),
(24, 10, 150, 550),
(24, 13, 85, 800),
(25, 9, 50, 800),
(25, 10, 150, 550),
(25, 11, 95, 550),
(25, 13, 90, 800),
(26, 8, 450, 464),
(26, 12, 400, 800),
(27, 8, 350, 544),
(27, 12, 500, 800),
(28, 8, 550, 528),
(28, 12, 400, 800),
(29, 12, 100, 800),
(30, 9, 25, 750),
(30, 10, 200, 550),
(30, 11, 60, 550),
(30, 13, 90, 800);

--
-- Triggers `all_products`
--
DELIMITER $$
CREATE TRIGGER `product_stock_on_insert` BEFORE INSERT ON `all_products` FOR EACH ROW BEGIN
update products 
set stock=stock+new.stock
WHERE new.product_id=id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_stock_on_update` BEFORE UPDATE ON `all_products` FOR EACH ROW BEGIN
UPDATE products set stock=stock-old.stock+new.stock 
WHERE old.product_id=id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Bottomwear'),
(2, 'Topwear'),
(3, 'Fast food'),
(4, 'Beverages'),
(5, 'desserts');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fname`, `mname`, `lname`, `phone`, `address`, `city`, `state`, `pincode`, `country`, `email`, `DOB`) VALUES
(1, 'Pranav', 'Sanjeev', 'Agrawal', '9765229963', 'c/o Ajay Traders,R b street,netaji chowk ,kamptee.', 'nagpur', 'maharashtra', '441002', 'India', 'pranavagrawal012@gmail.com', '1997-11-22'),
(2, 'Aditya', NULL, 'Kabra', '7744968453', NULL, NULL, NULL, NULL, NULL, NULL, '1997-06-02'),
(3, 'Motish', '', 'Mehta', '9422247762', 'ghar', 'pune', 'maharashtra', '411046', 'India', '', '2017-09-30'),
(4, 'Shubham', '', 'Bangad', '8888568988', 'home', 'pune', 'maharashtra', '411046', 'India', '', '2017-09-21'),
(7, 'Rohan', '', 'Deb', '7744112255', 'ghar', 'pune', 'maharashtra', '415263', 'India', '', '1997-10-02'),
(8, 'Anuj', '', 'Pahade', '9049300087', '1=1', 'Pune', 'Maharashtra', '741258', 'India', 'anujp4545@gmail.com', '5454-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` varchar(4) COLLATE utf16_unicode_ci NOT NULL DEFAULT '001',
  `status` varchar(10) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'Active',
  `fname` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `mname` varchar(100) COLLATE utf16_unicode_ci DEFAULT NULL,
  `lname` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL,
  `country` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `phone` bigint(10) NOT NULL,
  `email` varchar(100) COLLATE utf16_unicode_ci DEFAULT NULL,
  `birth_date` date NOT NULL,
  `title` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT 'foreign key',
  `supervisor` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `salary` int(11) NOT NULL,
  `ecd_fname` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_mname` varchar(100) COLLATE utf16_unicode_ci DEFAULT NULL,
  `ecd_lname` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_address` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_city` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_state` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_pincode` int(11) NOT NULL,
  `ecd_country` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `ecd_phone` bigint(10) NOT NULL,
  `ecd_relationship` varchar(100) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `status`, `fname`, `mname`, `lname`, `address`, `city`, `state`, `pincode`, `country`, `phone`, `email`, `birth_date`, `title`, `store_id`, `supervisor`, `start_date`, `salary`, `ecd_fname`, `ecd_mname`, `ecd_lname`, `ecd_address`, `ecd_city`, `ecd_state`, `ecd_pincode`, `ecd_country`, `ecd_phone`, `ecd_relationship`) VALUES
('A001', 'Active', 'Motish', 'Ashokkumar', 'Mehta', 'Katraj', 'Pune', 'Maharashtra', 411049, 'India', 9422247762, 'mehta.motish1197@gmail.com', '1997-11-11', 'Admin', NULL, 'A001', '2015-01-01', 100000, 'Pranav', 'Sanjeev', 'Agrawal', 'Katraj', 'Pune', 'Maharashtra', 411049, 'India', 9765229963, 'Friend'),
('C001', 'Active', 'John', 'Holland', 'Smith', '32 Baner Road', 'Pune', 'Maharashtra', 411045, 'United States', 1234567890, 'john_holland@gmail.com', '2017-09-20', 'Store Manager', 1, 'A001', '2017-09-22', 25000, 'Samuel', 'Holland', 'Smith', '32 Baner Road ', 'Pune', 'Maharashtra', 411035, 'United States', 1111111111, 'Brother'),
('C002', 'Active', 'Will', 'John', 'Smith', 'abc circle', 'Pune', 'maharashtra', 411065, 'India', 9658741236, 'willsmith@abc.com', '2016-12-31', 'Store Manager', 2, 'A001', '2017-01-01', 35000, 'John', '', 'smith', 'Kondhwa', 'Pune', 'Maharashtra', 411046, 'India', 1236547890, 'Father'),
('C003', 'Active', 'Ranbir', 'Rishi', 'Kapoor', 'Warli', 'Mumbai', 'Maharashtra', 400018, 'India', 2147483647, 'r.123@gmail.com', '1991-01-05', 'Store Manager', 3, 'A001', '2014-01-01', 10000, 'Katrina', '', 'Kaif', 'Warli', 'Mumbai', 'Maharashtra', 400018, 'India', 2147483647, 'Girl Friend'),
('C004', 'Active', 'Katrina', '', 'Kaif', 'Warli', 'Mumbai', 'Maharashtra', 400018, 'India', 2147483647, 'kat@gmail.com', '1997-11-11', 'Store Manager', 4, 'A001', '2015-11-11', 10000, 'Ranbir', '', 'Kapoor', 'Katraj', 'Pune', 'Maharashtra', 411049, 'India', 2147483647, 'Boyfriend'),
('C005', 'Active', 'Aditya', 'Krishna', 'Dixit', 'Aundh', 'Pune', 'Maharashtra', 411007, 'India', 9587624789, NULL, '1988-06-11', 'Store Manager', 5, 'A001', '2017-09-11', 25000, 'Amit', NULL, 'Dixit', 'Aundh', 'Pune', 'Maharashtra', 411007, 'India', 9877894565, 'Father'),
('C006', 'Active', 'Akshit', 'Akash', 'Singh', 'Pimpri', 'Pune', 'Maharashtra', 411044, 'India', 9877894565, NULL, '1983-06-19', 'Store Manager', 6, 'A001', '2017-09-11', 25000, 'Akash', NULL, 'Singh', 'Pimpri', 'Pune', 'Maharashtra', 411044, 'India', 8756598451, 'Father'),
('C007', 'Active', 'Ayush', 'Manish', 'Tripathi', 'Shivaji Nagar', 'Pune', 'Maharashtra', 411007, 'India', 9876523658, NULL, '1983-04-22', 'Store Manager', 7, 'A001', '2017-09-11', 25000, 'Manish', NULL, 'Tripathi', 'Shivaji Nagar', 'Pune', 'Maharashtra', 411007, 'India', 9547682147, 'Father'),
('C008', 'Active', 'Rishabh', 'xyz', 'Tatia', '10 hills', 'pune', 'maharashtra', 411052, 'India', 2147483647, '', '2017-10-02', 'Store Manager', 15, 'A001', '2017-10-02', 123546, 'Anuj', '', 'Maheshwari', 'Ghar', 'Pune', 'maharashtra', 410520, 'India', 7896541230, 'Friend'),
('F001', 'Active', 'Soham', '', 'Ray', '9 hills', 'Pune', 'maharashtra', 411060, 'India', 2147483647, '', '1997-02-19', 'Store Manager', 8, 'A001', '2017-09-20', 50000, 'sharan', '', 'Rajani', 'bhosri', 'Pune', 'maharashtra', 411052, 'India', 2147483647, 'bitch'),
('F002', 'Active', 'Shreyas', 'Sanjay', 'Chaudhari', 'Hinjewadi', 'Pune', 'Maharashtra', 411057, 'India', 9403311146, 'shre2398@gmail.com', '1998-02-12', 'Store Manager', 9, 'A001', '2017-09-04', 25000, 'Sanjay', '', 'Chaudhari', 'Hinjewadi', 'Pune', 'Maharashtra', 411057, 'India', 9214587633, 'father'),
('F003', 'Active', 'Rajesh', 'Sohan', 'Agrawal', 'Loni\r\n', 'Pune\r\n', 'Maharashtra', 413736, 'India', 9558866741, 'Rajesh@gmail.com', '1988-10-14', 'Store Manager', 10, 'A001', '2017-09-09', 25000, 'Sohan', NULL, 'Agrawal', 'Loni', 'Pune', 'Maharashtra', 413736, 'India', 9865425461, 'father'),
('F004', 'Active', 'Atharva', 'Kunal', 'Ghote', 'Shivaji Nagar\r\n', 'Pune\r\n', 'Maharashtra', 411005, 'India', 9887724563, 'Atharva@gmail.com', '1983-11-10', 'Store Manager', 11, 'A001', '2017-09-10', 25000, 'Kunal', NULL, 'Ghote', 'Shivaji Nagar', 'Pune', 'Maharashtra', 411005, 'India', 9756842139, 'father'),
('F005', 'Active', 'Hari', 'Kishore', 'Warse', ' Aundh\r\n', 'Pune\r\n', 'Maharashtra', 411007, 'India', 9874747651, 'Hari@gmail.com', '1986-12-09', 'Store Manager', 12, 'A001', '2017-09-11', 25000, 'Kishore', NULL, 'Warse', ' Aundh', 'Pune', 'Maharashtra', 411007, 'India', 9856245879, 'father'),
('F006', 'Active', 'Rishabh', 'Rohan', 'Shetty', 'Pimpri', 'Pune', 'Maharashtra', 411044, 'India', 9654785126, NULL, '1981-12-20', 'Store Manager', 13, 'A001', '2017-09-12', 25000, 'Rohan', NULL, 'Shetty', 'Pimpri', 'Pune', 'Maharashtra', 411044, 'India', 9685474154, 'Father'),
('F007', 'Active', 'Mihir', 'Aditya', 'karkare', 'Shivaji Nagar', 'Pune', 'Maharashtra', 411005, 'India', 9756489215, NULL, '1986-07-12', 'Store Manager', 14, 'A001', '2017-09-12', 25000, 'Aditya', NULL, 'Karkare', 'Shivaji Nagar', 'Pune', 'Maharashtra', 411005, 'India', 9875621478, 'Father'),
('F008', 'Active', 'Anuj', '', 'Maheshwari', 'Ghar', 'Pune', 'Maharashtra', 411052, 'India', 8855223366, '', '1997-10-10', 'Store Manager', 16, 'A001', '2017-10-02', 302010, 'Aditya', '', 'Kabra', 'Ghar', 'Pune', 'Maharashtra', 411052, 'India', 7744112255, 'Friend'),
('F009', 'Inactive', 'Rohit', '', 'Sharma', 'Naya Ghar', 'NewMumbai', 'Maharashtra', 748522, 'India', 9966322553, 'meranayaemail@gmail.com', '1996-12-31', 'Store Manager', 16, 'A001', '2017-09-03', 500000, 'Ritika', '', 'Sharma', 'Rohit ka naya ghar', 'NewMumbai', 'Maharashtra', 741258, 'India', 9966558877, 'Wife'),
('M001', 'Active', 'Aditya', '', 'Kabra', 'Kohinoor Bungalow, Aadishakti society-1', 'Pune', 'Maharashtra', 411043, 'India', 7744968453, NULL, '1997-06-02', 'Manager', NULL, 'A001', '2017-10-03', 10000000, 'Nitesh', NULL, 'Kabra', 'Bohra market', 'Ichalkaranji', 'Maharashtra', 416115, 'India', 8888410022, 'Brother'),
('M002', 'Active', 'Pranav', '', 'Agrawal', 'Agrawal Bungalow, Agrawal society-1', 'Pune', 'Maharashtra', 411043, 'India', 9765229963, NULL, '1997-11-22', 'Manager', NULL, 'A001', '2017-10-03', 10000000, 'Anant', NULL, 'Gandhi', 'Agrawal Bungalow, Agrawal society-1', 'Pune', 'Maharashtra', 411043, 'India', 7744558899, 'Friend');

--
-- Triggers `employee_details`
--
DELIMITER $$
CREATE TRIGGER `delete_employee` BEFORE DELETE ON `employee_details` FOR EACH ROW BEGIN
    UPDATE stores
    SET stores.manager_id=NULL
    WHERE manager_id=OLD.id;
    
    DELETE FROM login_details WHERE login_details.employee_id=OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `employee_id` varchar(4) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(12) NOT NULL COMMENT 'length(9-12)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`employee_id`, `password`) VALUES
('A001', '987654321'),
('C001', '123456789'),
('C007', '007'),
('C008', 'farsan'),
('F001', '123456789'),
('F007', '007'),
('F008', '123654789');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL COMMENT 'foreign key',
  `customer_id` int(11) NOT NULL COMMENT 'foreign key',
  `employee_id` varchar(4) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL DEFAULT '001' COMMENT 'foreign key',
  `date` date NOT NULL,
  `items_quantity` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `store_id`, `customer_id`, `employee_id`, `date`, `items_quantity`, `total_amount`) VALUES
(1, 1, 1, 'C001', '2017-09-25', 3, 3000),
(2, 10, 2, 'F003', '2017-09-30', 30, 7500),
(3, 8, 3, 'F001', '2017-09-30', 25, 5325),
(6, 8, 4, 'F001', '2017-09-30', 40, 15050),
(8, 8, 4, 'F001', '2017-09-30', 25, 5325),
(9, 8, 1, 'F001', '2017-09-30', 5, 275),
(13, 8, 7, 'F001', '2017-10-02', 10, 550),
(14, 8, 7, 'F001', '2017-10-02', 5, 1750),
(17, 8, 3, 'F001', '2017-10-02', 3, 460),
(18, 8, 1, 'F001', '2017-10-02', 4, 1010),
(19, 1, 1, 'C001', '2017-10-04', 1, 1400),
(22, 1, 3, 'C001', '2017-10-04', 1, 990),
(23, 1, 3, 'C001', '2017-10-04', 1, 990),
(24, 8, 8, 'F001', '2017-10-05', 4, 1620);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL COMMENT 'foreign key',
  `product_id` int(11) NOT NULL COMMENT 'foreign key',
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `final_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `total_price`, `discount`, `final_price`) VALUES
(1, 1, 3, 3000, 0, 3000),
(2, 15, 20, 5000, 0, 5000),
(2, 17, 10, 2500, 0, 2500),
(3, 20, 15, 825, 0, 825),
(3, 26, 10, 4500, 0, 4500),
(6, 18, 10, 550, 0, 550),
(6, 26, 20, 9000, 0, 9000),
(6, 28, 10, 5500, 0, 5500),
(8, 21, 15, 825, 0, 825),
(8, 26, 10, 4500, 0, 4500),
(9, 20, 5, 275, 0, 275),
(13, 21, 10, 550, 0, 550),
(14, 27, 5, 1750, 0, 1750),
(17, 20, 2, 110, 0, 110),
(17, 27, 1, 350, 0, 350),
(18, 18, 1, 55, 0, 55),
(18, 21, 1, 55, 0, 55),
(18, 26, 2, 900, 0, 900),
(19, 2, 1, 1400, 0, 1400),
(22, 1, 1, 1000, 1, 990),
(23, 1, 1, 1000, 1, 990),
(24, 26, 4, 1800, 10, 1620);

--
-- Triggers `order_details`
--
DELIMITER $$
CREATE TRIGGER `Order_details_insert` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
set new.total_price=new.quantity*(select price from all_products where product_id=new.product_id and store_id=(select store_id from orders where id=new.order_id));

set new.final_price=new.total_price*(1-new.discount/100);

UPDATE orders
SET items_quantity=items_quantity+new.quantity 
WHERE id=new.order_id;

UPDATE orders
SET total_amount=total_amount+new.final_price
WHERE id=new.order_id;

UPDATE all_products
set stock=stock-new.quantity
where product_id=new.product_id and store_id=(select store_id from orders where id=new.order_id);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'foreign key',
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `stock`) VALUES
(1, 'black jeans', 1, 2920),
(2, 'white shirt', 2, 2004),
(3, 'Blue Jeans', 1, 2450),
(4, 'Black Shirt', 2, 3700),
(5, 'Round neck T-Shirt full sleeves', 2, 1850),
(6, 'Cotton Shorts', 1, 2000),
(7, 'Hosiery Shorts', 1, 950),
(8, 'Printed Shorts', 1, 2300),
(9, 'Round neck T-Shirt half sleeves', 2, 2850),
(10, 'Round neck T-Shirt sleeveless', 2, 650),
(11, 'POLO T-Shirt full sleeves', 2, 900),
(12, 'POLO T-Shirt half sleeves', 2, 1350),
(13, 'ONE PIECE', 2, 3350),
(14, 'SKIRT', 1, 2550),
(15, 'Hara Bhara Kebab Sub', 3, 1200),
(16, 'Paneer Tikka Sub', 3, 1150),
(17, 'Turkey And Chicken Sub', 3, 1140),
(18, 'Coke', 4, 3729),
(19, 'Mountain Dew', 4, 3838),
(20, '7up', 4, 4198),
(21, 'Mirinda', 4, 3974),
(22, 'Cookie', 5, 800),
(23, 'Paneer tikka burger', 3, 2350),
(24, 'Veg cheese sandwich', 3, 1800),
(25, 'veg cheese burger', 3, 2700),
(26, 'Veg Peppy Paneer Pizza', 3, 1264),
(27, 'Barbeque Chicken Pizza', 3, 1344),
(28, 'Country Special Pizza', 3, 1328),
(29, 'Stuffed Garlic Bread', 3, 800),
(30, 'Coffee', 4, 2650);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(20) NOT NULL,
  `manager_id` varchar(4) CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL,
  `floor` int(11) NOT NULL,
  `block` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `department`, `manager_id`, `floor`, `block`) VALUES
(1, 'Allen Solly', 'Clothing', 'C001', 1, 1),
(2, 'SuperDry', 'Clothing', 'C002', 1, 2),
(3, 'Zara', 'Clothing', 'C003', 1, 3),
(4, 'USPA', 'Clothing', 'C004', 1, 4),
(5, 'UCB', 'Clothing', 'C005', 1, 5),
(6, 'Arrow', 'Clothing', 'C006', 1, 6),
(7, 'Forever 21', 'Clothing', 'C007', 1, 7),
(8, 'Domino\'s', 'Food', 'F001', 2, 1),
(9, 'Haldirams', 'Food', 'F002', 2, 2),
(10, 'Starbucks Coffee', 'Food', 'F003', 2, 3),
(11, 'McDonald\'s', 'Food', 'F004', 2, 4),
(12, 'Pizza Hut', 'Food', 'F005', 2, 5),
(13, 'Indian Coffee House', 'Food', 'F006', 2, 6),
(14, 'Subway', 'Food', 'F007', 2, 7),
(15, 'Louis Philippe', 'Clothing', 'C008', 1, 8),
(16, 'Mad Over Donuts', 'Food', NULL, 2, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_products`
--
ALTER TABLE `all_products`
  ADD PRIMARY KEY (`product_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `supervisor` (`supervisor`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `manager_id` (`manager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_products`
--
ALTER TABLE `all_products`
  ADD CONSTRAINT `all_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `all_products_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `employee_details_ibfk_2` FOREIGN KEY (`supervisor`) REFERENCES `employee_details` (`id`);

--
-- Constraints for table `login_details`
--
ALTER TABLE `login_details`
  ADD CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employee_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
