-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2022 at 01:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gravityexplore22`
--

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `connection` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` (`connection`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `camp_id` int(5) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `grade` int(2) NOT NULL,
  `contact` int(9) DEFAULT NULL,
  `guardian_name` varchar(40) NOT NULL,
  `guardian_contact` int(9) NOT NULL,
  `whatsapp` int(9) DEFAULT NULL,
  `payment` int(6) NOT NULL,
  `evt_entrance` int(1) NOT NULL,
  `evt_exit` int(1) NOT NULL,
  `evt_tea` int(1) NOT NULL,
  `enter_time` varchar(30) NOT NULL,
  `exit_time` varchar(30) NOT NULL,
  `tea_time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `camp_id`, `first_name`, `last_name`, `birth_date`, `grade`, `contact`, `guardian_name`, `guardian_contact`, `whatsapp`, `payment`, `evt_entrance`, `evt_exit`, `evt_tea`, `enter_time`, `exit_time`, `tea_time`) VALUES
(1, 34242, 'Anupama', 'Balasooriya', '2022-08-26', 11, 779935421, 'Anupama Balasooriya', 779935421, 779935421, 1000, 1, 0, 1, '0', '0', '0'),
(8, 80595, 'Naveen', 'Balasooriya', '2004-06-17', 7, 779935421, 'Naveen Balasooriya', 779935421, 779935421, 1000, 1, 0, 0, '0', '0', '0'),
(9, 37794, 'Roronoa', 'Zoro', '2004-06-17', 10, 779935421, 'Naveen Balasooriya', 779935421, 779935421, 1000, 0, 0, 0, '0', '0', '0'),
(10, 35663, 'Edward', 'Teach', '2004-06-17', 10, 779935421, 'Naveen Balasooriya', 779935421, 779935421, 1000, 1, 0, 1, '0', '0', '0'),
(11, 28748, 'Asada', 'Shino', '2004-06-17', 10, 779935421, 'Naveen Balasooriya', 779935421, 779935421, 1000, 0, 0, 0, '0', '0', '0'),
(12, 83321, 'Julian', 'Balasooriya', '2022-08-26', 11, 779935421, 'Anupama Balasooriya', 779935421, 779935421, 1000, 0, 0, 0, '0', '0', '0'),
(13, 34489, 'Julianewgr', 'Balasooriya', '2022-08-26', 11, 779935421, 'Anupama Balasooriya', 779935421, 779935421, 1000, 0, 0, 0, '0', '0', '0'),
(14, 24887, 'dfhshsdf', 'Balasooriya', '2022-08-26', 11, 779935421, 'Anupama Balasooriya', 779935421, 779935421, 1000, 0, 0, 0, '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `last_login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user_name`, `password`, `type`, `last_login`) VALUES
(1, 'admin', 'admin', 'Admin', '2022-08-24 23:16:23'),
(2, 'user', 'user', 'Moderator', '2022-08-24 23:16:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
