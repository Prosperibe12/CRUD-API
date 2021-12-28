-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2021 at 12:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staffdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `country_details`
--

CREATE TABLE `country_details` (
  `no` int(11) NOT NULL,
  `country_id` varchar(44) NOT NULL,
  `country_name` varchar(77) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country_details`
--

INSERT INTO `country_details` (`no`, `country_id`, `country_name`, `created_at`, `updated_at`) VALUES
(1, '40', 'Kenya', '2021-12-27 14:03:07', '2021-12-27 20:52:06'),
(2, '77', 'Russia', '2021-12-27 14:03:07', '2021-12-27 20:52:13'),
(3, '29', 'India', '2021-12-27 14:03:51', '2021-12-27 20:52:20'),
(4, '51', 'Japan', '2021-12-27 14:03:51', '2021-12-27 20:52:25'),
(5, '23', 'Nigeria', '2021-12-27 14:04:43', '2021-12-27 20:52:30'),
(6, '74', 'United States of America', '2021-12-27 14:04:43', '2021-12-27 20:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `dept_details`
--

CREATE TABLE `dept_details` (
  `no` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_details`
--

INSERT INTO `dept_details` (`no`, `dept_id`, `dept_name`, `created_at`, `updated_at`) VALUES
(1, 101, 'Admin', '2021-12-27 13:37:26', '2021-12-27 13:37:26'),
(2, 102, 'Accounts', '2021-12-27 13:37:26', '2021-12-27 13:37:26'),
(3, 103, 'Production', '2021-12-27 13:38:22', '2021-12-27 13:38:22'),
(4, 104, 'Quality Assurance', '2021-12-27 13:38:22', '2021-12-27 13:38:22'),
(5, 105, 'Engineering', '2021-12-27 13:39:09', '2021-12-27 13:39:09'),
(6, 106, 'warehouse', '2021-12-27 13:39:09', '2021-12-27 13:39:09'),
(7, 107, 'Logistics', '2021-12-27 13:39:31', '2021-12-27 13:39:31'),
(8, 108, 'Management', '2021-12-27 14:49:41', '2021-12-27 14:49:41'),
(9, 109, 'ICT', '2021-12-27 16:45:37', '2021-12-27 16:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `level_details`
--

CREATE TABLE `level_details` (
  `no` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level_name` varchar(66) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_details`
--

INSERT INTO `level_details` (`no`, `level_id`, `level_name`, `created_at`, `updated_at`) VALUES
(1, 800, 'Outsourced', '2021-12-27 13:49:02', '2021-12-27 13:49:02'),
(2, 410, 'Trainee', '2021-12-27 13:49:02', '2021-12-27 13:49:02'),
(3, 202, 'Junior Staff', '2021-12-27 13:49:52', '2021-12-27 13:49:52'),
(4, 110, 'Senior Staff', '2021-12-27 13:49:52', '2021-12-27 13:49:52'),
(5, 400, 'Junior Manager', '2021-12-27 13:50:44', '2021-12-27 13:51:06'),
(6, 300, 'Middle Manager', '2021-12-27 13:50:44', '2021-12-27 13:51:11'),
(7, 200, 'Senior Manager', '2021-12-27 13:52:15', '2021-12-27 13:52:15'),
(8, 100, 'Expatriate', '2021-12-27 13:52:15', '2021-12-27 13:52:15'),
(9, 111, 'Director', '2021-12-27 13:52:47', '2021-12-27 13:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `staff_detail`
--

CREATE TABLE `staff_detail` (
  `no` int(11) NOT NULL,
  `staff_id` varchar(111) NOT NULL,
  `staff_name` varchar(111) NOT NULL,
  `staff_email` varchar(111) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `country_id` varchar(11) NOT NULL,
  `staff_dateemployed` varchar(111) NOT NULL,
  `status` enum('active','leave','deleted','') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_detail`
--

INSERT INTO `staff_detail` (`no`, `staff_id`, `staff_name`, `staff_email`, `dept_id`, `level_id`, `country_id`, `staff_dateemployed`, `status`, `created_at`) VALUES
(1, '23108100', 'Prosper Ibe', 'Prosperibe12@gmail.com', 108, 100, '23', '25 Sept 1992', 'deleted', '2021-12-27 16:40:21'),
(2, '74109100', 'Tim Cook', 'Timcook@gmail.com', 109, 100, '74', '20 Jan 1940', 'active', '2021-12-27 16:44:54'),
(3, '7410910010', 'Elon Musk', 'elon@musk.com', 109, 100, '74', '20 Jan 1940', 'active', '2021-12-28 11:42:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country_details`
--
ALTER TABLE `country_details`
  ADD PRIMARY KEY (`no`),
  ADD UNIQUE KEY `country_id` (`country_id`);

--
-- Indexes for table `dept_details`
--
ALTER TABLE `dept_details`
  ADD PRIMARY KEY (`no`),
  ADD UNIQUE KEY `dept_id` (`dept_id`);

--
-- Indexes for table `level_details`
--
ALTER TABLE `level_details`
  ADD PRIMARY KEY (`no`),
  ADD UNIQUE KEY `level_id` (`level_id`);

--
-- Indexes for table `staff_detail`
--
ALTER TABLE `staff_detail`
  ADD PRIMARY KEY (`no`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country_details`
--
ALTER TABLE `country_details`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dept_details`
--
ALTER TABLE `dept_details`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `level_details`
--
ALTER TABLE `level_details`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `staff_detail`
--
ALTER TABLE `staff_detail`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
