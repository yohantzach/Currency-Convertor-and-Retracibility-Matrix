-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 06:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `css_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '1= admin, 2= staff,3= customer',
  `ticket_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `user_type`, `ticket_id`, `comment`, `date_created`) VALUES
(1, 1, 1, 1, '&lt;p&gt;Sample Comment only&lt;/p&gt; ', '2020-11-09 14:52:16'),
(3, 2, 3, 1, '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', '2020-11-09 15:36:56'),
(4, 1, 1, 4, '&lt;p&gt;Use ur hands&lt;/p&gt;', '2023-04-05 00:11:06'),
(5, 1, 1, 4, '&lt;p&gt;Ticket closed :&lt;/p&gt;&lt;p&gt;Date and Time: 12:11am - 05/04/2023&lt;/p&gt;', '2023-04-05 00:11:58'),
(6, 1, 1, 5, '&lt;p&gt;Restart computer&lt;/p&gt;', '2023-04-05 11:19:59'),
(7, 4, 2, 4, '', '2024-03-01 11:27:27'),
(8, 7, 3, 0, '&lt;p&gt;yujt&lt;/p&gt;', '2024-03-01 12:31:45'),
(10, 4, 2, 4, '&lt;p&gt;Investment done&amp;nbsp;&lt;/p&gt;', '2024-03-02 00:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `system_no` int(20) NOT NULL,
  `system_name` varchar(20) NOT NULL,
  `software` varchar(20) NOT NULL,
  `license` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `date_created`, `system_no`, `system_name`, `software`, `license`) VALUES
(5, 'shalem', 'reddy', 'haswanth ', '98845734', 'kcic', 'hash@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-04-05 00:06:47', 1003, 'HP ', 'Windows', 20003),
(7, 'Haswanth', 'gadu', 'reddy', '7362874', 'Anna Nagar', 'has@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-02-28 09:43:48', 1876, '14525', '287634', 29874),
(8, 'Yola', 'gadu', 'reddy', '123244235', 'kcic', 'yola@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-01 10:03:10', 132123, '1343', '3434', 32424),
(9, 'yohan', 'as', 'qsod', '1244', 'kcic', 'yohant@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-04 12:05:46', 1245, '355', '344', 23553),
(10, 'ahwin', 'asf', 'sdihg', '12444235', 'anna nagar', 'ash@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-05 00:26:31', 12344, '214234', '34243', 2342434);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'Basic Savings Plan ', 'Basic Plan', '2020-11-09 11:43:18'),
(2, 'Savings Plan Plus', 'Better Savings PLan', '2020-11-09 11:44:08'),
(5, 'Managed Stock Investments', 'Unlimited Investments per year', '2023-04-06 22:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `system_no` int(20) NOT NULL,
  `system_name` varchar(20) NOT NULL,
  `software` varchar(20) NOT NULL,
  `license` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `department_id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `date_created`, `system_no`, `system_name`, `software`, `license`) VALUES
(1, 1, 'George', 'Wilson', 'D', '+6948 8542 623', 'Sample Address', 'gwilson@sample.com', 'd40242fb23c45206fadee4e2418f274f', '2020-11-09 11:59:01', 0, '', '', 0),
(2, 1, 'john', 'C', 'Ena', '326780', 'Sample ', 'yo@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-03-30 21:21:01', 1001, 'HP', 'windows', 2001),
(3, 1, 'Hemanth', 'lance', 'reddy ', '567734', 'kcic', 'yohan@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-04-04 21:23:15', 9485894, 'HP', 'windows', 993948),
(4, 1, 'yoyo', 'gadu', 'reddy', '73628743', 'kcic', 'yoyo@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-03-01 11:26:52', 12323, '1234', '123132', 3124234);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(30) NOT NULL,
  `subject` text NOT NULL,
  `specialist` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Pending,1=on process,2= Closed',
  `department_id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `staff_id` int(30) NOT NULL,
  `admin_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `subject`, `specialist`, `description`, `status`, `department_id`, `customer_id`, `staff_id`, `admin_id`, `date_created`) VALUES
(1, 'Sample ticket', 'Romnic', '&lt;h3 style=&quot;font-family: &amp;quot;Source Sans Pro&amp;quot;, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;; color: rgb(33, 37, 41);&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Software Bug&amp;nbsp;&lt;/span&gt;&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin accumsan velit, et aliquam mi mollis vitae. Vivamus pellentesque placerat vehicula. Pellentesque vulputate diam nisi, bibendum pharetra lectus ultrices vel. Ut in ipsum tristique, iaculis velit id, convallis justo. Donec aliquam justo quis purus consequat rutrum. Sed sed velit at ante tincidunt dictum id eget ipsum. Proin a tellus felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis sagittis urna nec lorem pharetra, quis commodo libero efficitur. Ut odio lectus, blandit nec dapibus nec, scelerisque a lectus. In hac habitasse platea dictumst.&lt;/span&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Test&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;sample&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;bug&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 1, 2, 1, 1, '2020-11-09 13:44:43'),
(2, 'Dave', 'Shalem', '&lt;p&gt;&lt;b&gt;Laptop not starting&lt;/b&gt;&lt;/p&gt;&lt;p&gt;The laptop is not working because haswanth is a certificate&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 2, 1, 1, 0, 1, '2023-03-30 23:43:26'),
(3, 'Computer broken', 'John', '&lt;p&gt;egdfg&lt;/p&gt;', 0, 1, 1, 0, 1, '2023-04-01 18:00:53'),
(4, 'investments', 'Yohan', '&lt;p&gt;Initial Lump Sum: 300&lt;/p&gt;&lt;p&gt;Monthly amount : 1500&lt;/p&gt;', 2, 1, 5, 4, 1, '2023-04-05 00:08:21'),
(5, 'Laptop not running', 'Yohan', '&lt;p&gt;laptop not strating when being used&lt;/p&gt;', 2, 1, 2, 0, 1, '2023-04-05 11:19:13'),
(6, 'wow', '', '&lt;p&gt;123123123&lt;/p&gt;', 0, 5, 7, 0, 0, '2024-03-01 10:27:02'),
(7, 'wow', '', '&lt;p&gt;asdadfasd23&lt;/p&gt;', 0, 5, 7, 0, 0, '2024-03-01 11:25:18'),
(8, 'wow', '', '&lt;p&gt;123124&lt;/p&gt;', 3, 5, 7, 0, 1, '2024-03-01 12:43:09'),
(9, 'investments', '', '&lt;p&gt;intial Lump Sum: 1234&lt;/p&gt;&lt;p&gt;Monthly amount : 12134&lt;/p&gt;', 3, 5, 8, 0, 0, '2024-03-01 15:54:06'),
(10, 'Investment ', '', '&lt;p&gt;Initial lump sum: 1212&lt;/p&gt;&lt;p&gt;Monthly amount : 12313&lt;/p&gt;', 2, 2, 7, 0, 0, '2024-03-01 23:58:31'),
(11, 'Investments', '', '&lt;p&gt;Initial lump sum: 1234&lt;/p&gt;&lt;p&gt;Monthly amount : 2134&lt;/p&gt;', 0, 5, 7, 0, 0, '2024-03-04 12:02:10'),
(12, 'investments', '', '&lt;p&gt;initial lump sum: 1233&lt;/p&gt;&lt;p&gt;monthly investment: 1234&lt;/p&gt;', 0, 5, 7, 0, 0, '2024-03-05 00:23:54'),
(13, 'Investments', '', '&lt;p&gt;123 123 shibin&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, 2, 7, 0, 0, '2024-03-05 16:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 = Admin,2=support',
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `role`, `username`, `password`, `date_created`) VALUES
(1, 'Administrator', '', '', 1, 'admin', '0192023a7bbd73250516f069df18b500', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tickets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
