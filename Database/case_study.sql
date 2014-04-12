-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2014 at 08:54 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `contact_name`, `email`, `tel`, `job_title`, `main_contact`, `customer_id`) VALUES
(1, 'Nguyen Van Quyen', 'quyennv.uet@vnu.edu.vn', 'fafaf', 'student', 1, 1),
(2, 'Viet anh', 'vafaf', '5205i2', 'nhan vien', 1, 2),
(3, 'Toan', 'ga', 'aa', 'a', 0, 2),
(4, 'Hoang Van Thang', 'thanghv@gmail.com', '09282494209', 'employee', 1, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `address`, `tel`, `fax`) VALUES
(1, 'Qsoft coporation', 'A', 'A', 'A'),
(2, 'FPT Software', 'Hanoi', '012958', '928825'),
(3, 'Tinh Van .Cops', 'Hanoi', '0456563435', '939295205');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `create_date`, `update_date`, `contact_id`, `status`) VALUES
(1, '2014-04-02', '2014-04-12', 1, 'shipped'),
(2, '2014-04-02', '2014-04-10', 1, 'shipped'),
(3, '2014-04-02', '2014-04-17', 2, 'shipped'),
(4, '2014-04-08', '2014-04-17', 3, 'shipped'),
(5, '2014-04-09', '2014-04-22', 4, 'shipped');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `product_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
