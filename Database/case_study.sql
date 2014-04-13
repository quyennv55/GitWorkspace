-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2014 at 06:51 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `case_study`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `main_contact` tinyint(4) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `contact_name`, `email`, `tel`, `job_title`, `main_contact`, `customer_id`) VALUES
(1, 'Nguyen Van Quyen', 'quyennv.uet@vnu.edu.vn', '01649645054', 'Manager', 1, 1),
(2, 'Mai Viet Anh', 'your-email@example.com', '89-07383722', 'manager', 1, 2),
(3, 'Nguyen Nhu Toan', 'your-email@example.com', '0998373363', 'employee', 0, 2),
(4, 'Hoang Van Thang', 'thanghv@gmail.com', '09282494209', 'employee', 1, 3),
(5, 'Nguyen Van Cuong', 'cuongnv_55@vnu.edu.vn', '93822920202029', 'Employee', 1, 4),
(6, 'Dang Quoc Viet', 'viethd@gmail.com', '993930303939', 'securitier', 1, 5),
(7, 'Nguyen Thi Loan', 'loannt_55@vnu.edu.vn', '923923020', 'Nhan Vien', 1, 6),
(8, 'Nguyen Thi Loan', 'loannt_55@vnu.edu.vn', '923923020', 'Employee', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `address`, `tel`, `fax`) VALUES
(1, 'Qsoft Company', 'Cau Giay - Hanoi - Vietnam', '0413124141', '41414141-3'),
(2, 'FPT Software', 'Tu Liem - Hanoi - Vietnam', '01295898', '092882512'),
(3, 'Tinh Van .Cops', 'Ba Dinh - Hanoi - Vietnam', '0456563435', '939295205'),
(4, 'Cafe G7', 'Buon Ma Thuot - Tay Nguyen - Vietnam\r\n', '250520205020', '1041041040110'),
(5, 'vinacafe', 'Nha Trang - VIetnam', '293959951', '929599292'),
(6, 'Framgia Vietnam', 'Hanoi - VIetnam', '29922020', '93930303030');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_number` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `contact_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `create_date`, `update_date`, `contact_id`, `status`) VALUES
(1, '2014-04-02', '2014-04-12', 1, 'shipped'),
(2, '2014-04-02', '2014-04-10', 1, 'shipped'),
(3, '2014-04-02', '2014-04-17', 2, 'shipped'),
(4, '2014-04-08', '2014-04-17', 3, 'shipped'),
(5, '2014-04-09', '2014-04-22', 4, 'shipped'),
(6, '2014-04-09', '2014-04-17', 5, 'shipped'),
(7, '2014-04-23', '2014-04-30', 6, 'shipped'),
(8, '2014-04-26', '2014-04-23', 7, 'shipped');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `product_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`product_id`, `order_number`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(5, 3),
(6, 4),
(10, 4),
(5, 5),
(12, 6),
(1, 6),
(4, 6),
(5, 6),
(10, 7),
(1, 8),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `year` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `manufacturer` varchar(60) NOT NULL,
  `model` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `year`, `price`, `manufacturer`, `model`) VALUES
(0, 'Cars', '2990', 100, 'Toyota - Japan', 'VB-903'),
(1, 'Newspaper', '2008', 32, 'vnexpress cops', '34GB'),
(2, 'Winds', '2004', 23, 'Dien Co Thong Nhat', 'BN-3002'),
(3, 'Pencil', '1020', 1, 'Home Cops.', 'RT-334'),
(4, 'Pen', '2000', 2, 'Hong Ha Cops', 'Xanh'),
(5, 'USB 3G', '2008', 12, 'Viettel IT', 'VB-45'),
(6, 'USB 8G', '2012', 34, 'Trancend', 'BR-0393'),
(7, 'FPT Mobile', '2005', 23, 'FPT Groups', 'BT-29'),
(8, 'Mobile', '2004', 200, 'Nokia', '1200'),
(9, 'Cups', '1992', 20, 'Glass', 'BV-393'),
(10, 'Cafe', '2007', 10, 'G7 Groups', 'BC-445'),
(11, 'Milk', '2006', 300, 'Cows Cops', '2009'),
(12, 'Toyota Cars', '2008', 300, 'Toyota My DInh', 'VF-2004');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
