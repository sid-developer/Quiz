-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2019 at 11:28 PM
-- Server version: 5.7.26-0ubuntu0.19.04.1
-- PHP Version: 7.1.29-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ans`
--

CREATE TABLE `quiz_ans` (
  `ans_id` int(11) NOT NULL,
  `ans_ques_id` int(11) NOT NULL,
  `ans_text` text NOT NULL,
  `ans_status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz_ans`
--

INSERT INTO `quiz_ans` (`ans_id`, `ans_ques_id`, `ans_text`, `ans_status`) VALUES
(1, 1, 'Private Home Page', '1'),
(2, 1, 'PHP: Hypertext Preprocessor', '1'),
(3, 1, 'Personal Hypertext Processor', '1'),
(4, 2, '.html', '1'),
(5, 2, '.php', '1'),
(6, 2, '.jpeg', '1'),
(7, 2, '.png', '1'),
(8, 3, 'echo \"Hello World\";,', '1'),
(9, 3, '\"Hello World\";', '1'),
(10, 3, 'Document.Write(\"Hello World\");', '1'),
(11, 4, '$', '1'),
(12, 4, '@', '1'),
(13, 4, '#', '1'),
(14, 4, '!', '1'),
(15, 5, ';', '1'),
(16, 5, '//', '1'),
(17, 5, '</php>', '1'),
(18, 5, 'New Line', '1');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_qna`
--

CREATE TABLE `quiz_qna` (
  `qna_id` int(11) NOT NULL,
  `qna_question` text NOT NULL,
  `qna_options` text NOT NULL,
  `qna_ans` text NOT NULL,
  `qna_status` enum('0','1') NOT NULL COMMENT '1:Active',
  `qna_submission` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_qna`
--

INSERT INTO `quiz_qna` (`qna_id`, `qna_question`, `qna_options`, `qna_ans`, `qna_status`, `qna_submission`) VALUES
(1, 'What does PHP stand for?', '', '2', '1', '2019-05-22 17:55:33'),
(2, 'PHP files have a default file extension of_______?', '', '5', '1', '2019-05-22 17:57:42'),
(3, 'How do you write \"Hello World\" in PHP?', '', '8', '1', '2019-05-22 18:03:47'),
(4, 'All variables in PHP start with which symbol?', '', '11', '1', '2019-05-22 18:05:31'),
(5, '\r\nWhat is the correct way to end a PHP statement?', '', '15', '1', '2019-05-22 18:06:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz_ans`
--
ALTER TABLE `quiz_ans`
  ADD PRIMARY KEY (`ans_id`);

--
-- Indexes for table `quiz_qna`
--
ALTER TABLE `quiz_qna`
  ADD PRIMARY KEY (`qna_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz_ans`
--
ALTER TABLE `quiz_ans`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `quiz_qna`
--
ALTER TABLE `quiz_qna`
  MODIFY `qna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
