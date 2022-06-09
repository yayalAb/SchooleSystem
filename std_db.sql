-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 07:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `std_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `i_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `index_number`, `full_name`, `i_name`, `gender`, `address`, `phone`, `email`, `image_name`, `reg_date`) VALUES
(1, 100, 'fayyisaa tesfayee', 'fayyisaa tesfayee', 'Male', 'kuyu', '092-216-6384', 'admin@gmail.com', 'uploads/2022051025559.jpg', '2018-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `sender_index` bigint(11) NOT NULL,
  `sender_type` varchar(255) NOT NULL,
  `receiver_index` bigint(11) NOT NULL,
  `receiver_type` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `_isread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_room`
--

CREATE TABLE `class_room` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `student_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_room`
--

INSERT INTO `class_room` (`id`, `name`, `student_count`) VALUES
(27, 'Class A', 50),
(28, 'Class B', 50),
(29, 'Class C', 50);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `grade_id` varchar(255) NOT NULL,
  `create_by` bigint(11) NOT NULL,
  `creator_type` varchar(255) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `note`, `color`, `category_id`, `grade_id`, `create_by`, `creator_type`, `start_date_time`, `end_date_time`, `year`, `month`) VALUES
(3, 'bara barnota gaarii hawuu', 'waltajii irraattii akkaa argamtan guyyoota isiinif himne kanat  nagaha wajjiin', '#000000', 1, '', 100, 'Admin', '2022-05-02 00:00:00', '2022-05-06 23:59:00', 2022, 4);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_category_type`
--

CREATE TABLE `event_category_type` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`) VALUES
(7, 'first sem'),
(8, 'second sem');

-- --------------------------------------------------------

--
-- Table structure for table `exam_range_grade`
--

CREATE TABLE `exam_range_grade` (
  `id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `mark_range` varchar(255) NOT NULL,
  `_from` int(11) NOT NULL,
  `_to` int(11) NOT NULL,
  `mark_grade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_range_grade`
--

INSERT INTO `exam_range_grade` (`id`, `grade_id`, `mark_range`, `_from`, `_to`, `mark_grade`) VALUES
(81, 16, '85-100', 85, 100, 'A+'),
(82, 16, '75-84', 75, 84, 'B'),
(83, 16, '60-74', 60, 74, 'B-'),
(84, 16, '50-59', 50, 59, 'C'),
(85, 16, '0-49', 0, 49, 'F'),
(86, 17, '85-100', 85, 100, 'A+'),
(87, 17, '75-84', 75, 84, 'B'),
(88, 17, '60-74', 60, 74, 'B-'),
(89, 17, '50-59', 50, 59, 'C'),
(90, 17, '0-49', 0, 49, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetable`
--

CREATE TABLE `exam_timetable` (
  `id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `start_time` double(11,2) NOT NULL,
  `end_time` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `admission_fee` double(11,2) NOT NULL,
  `hall_charge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `admission_fee`, `hall_charge`) VALUES
(16, 'Grade 11', 100.00, 250),
(17, 'Grade 12', 100.00, 250);

-- --------------------------------------------------------

--
-- Table structure for table `group_message`
--

CREATE TABLE `group_message` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sender_index` bigint(11) NOT NULL,
  `sender_type` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_notifications`
--

CREATE TABLE `main_notifications` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `_isread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_notifications`
--

INSERT INTO `main_notifications` (`id`, `notification_id`, `_status`, `year`, `month`, `date`, `_isread`) VALUES
(5, 3, 'Events', 2022, 'May', '2022-05-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `my_friends`
--

CREATE TABLE `my_friends` (
  `id` int(11) NOT NULL,
  `my_index` bigint(11) NOT NULL,
  `friend_index` bigint(11) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `my_type` varchar(255) NOT NULL,
  `friend_type` varchar(255) NOT NULL,
  `_isread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `my_friends`
--

INSERT INTO `my_friends` (`id`, `my_index`, `friend_index`, `_status`, `conversation_id`, `my_type`, `friend_type`, `_isread`) VALUES
(7, 100, 29, 'Friend', 1, 'Admin', 'Student', 1),
(8, 29, 100, 'Friend', 1, 'Student', 'Admin', 1),
(9, 100, 1, 'Friend', 9, 'Admin', 'Teacher', 1),
(10, 1, 100, 'Friend', 9, 'Teacher', 'Admin', 1),
(11, 29, 1, 'Friend', 11, 'Student', 'Teacher', 1),
(12, 1, 29, 'Friend', 11, 'Teacher', 'Student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_history`
--

CREATE TABLE `notification_history` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `_isread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_history`
--

INSERT INTO `notification_history` (`id`, `notification_id`, `index_number`, `user_type`, `_isread`) VALUES
(11, 3, 29, 'Student', 0),
(12, 3, 1, 'Teacher', 0),
(13, 3, 0, 'Parents', 0);

-- --------------------------------------------------------

--
-- Table structure for table `online_chat`
--

CREATE TABLE `online_chat` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_index` bigint(11) NOT NULL,
  `msg` longtext NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `_isread` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` int(11) NOT NULL,
  `index_number` varchar(255) NOT NULL,
  `my_son_index` bigint(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `i_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `b_date` date NOT NULL,
  `reg_date` date NOT NULL,
  `reg_year` year(4) NOT NULL,
  `reg_month` varchar(255) NOT NULL,
  `_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `index_number`, `my_son_index`, `full_name`, `i_name`, `gender`, `address`, `phone`, `email`, `image_name`, `b_date`, `reg_date`, `reg_year`, `reg_month`, `_status`) VALUES
(19, 'G-29', 29, ' tesfaye', ' tesfaye', 'Male', 'ku', '243-677-5655', 'tes@gmail.com', 'uploads/2022052023560.jpg', '0000-00-00', '2022-05-02', 2022, 'May', ''),
(20, 'G-30', 30, 'Bido Rasa', 'Bido', 'Male', 'guj', '243-677-5655', 'bid@gmail.com', 'uploads/2022053065535.jpg', '0000-00-00', '2022-05-03', 2022, 'May', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment_notifications`
--

CREATE TABLE `payment_notifications` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `_status` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash`
--

CREATE TABLE `petty_cash` (
  `id` int(11) NOT NULL,
  `received_by` bigint(11) NOT NULL,
  `approved_by` bigint(11) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `paid` double(11,2) NOT NULL,
  `received_type` varchar(255) NOT NULL,
  `_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_history`
--

CREATE TABLE `petty_cash_history` (
  `id` int(11) NOT NULL,
  `_desc` varchar(255) NOT NULL,
  `received_by` bigint(11) NOT NULL,
  `approved_by` bigint(11) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` double(11,2) NOT NULL,
  `total_paid` double(11,2) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `received_type` varchar(255) NOT NULL,
  `_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reportcard`
--

CREATE TABLE `reportcard` (
  `schname` varchar(30) DEFAULT 'Tepi preparatory school',
  `id` int(30) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `sex` int(10) NOT NULL,
  `mphone` varchar(30) NOT NULL,
  `hphone` int(11) NOT NULL,
  `ayear` int(10) NOT NULL,
  `grade` int(20) NOT NULL DEFAULT 11,
  `promoted` int(20) NOT NULL,
  `amharic1` int(10) NOT NULL,
  `amharic2` int(10) NOT NULL,
  `amharic3` int(10) NOT NULL,
  `english1` int(10) NOT NULL,
  `english2` int(10) NOT NULL,
  `english3` int(10) NOT NULL,
  `maths1` int(10) NOT NULL,
  `maths2` int(10) NOT NULL,
  `maths3` int(10) NOT NULL,
  `physics1` int(10) NOT NULL,
  `physics2` int(10) NOT NULL,
  `physics3` int(10) NOT NULL,
  `biology1` int(10) NOT NULL,
  `biology2` int(10) NOT NULL,
  `biology3` int(10) NOT NULL,
  `chemistry1` int(10) NOT NULL,
  `chemistry2` int(10) NOT NULL,
  `chemistry3` int(10) NOT NULL,
  `geography1` int(10) NOT NULL,
  `geography2` int(10) NOT NULL,
  `geography3` int(10) NOT NULL,
  `economics1` int(10) NOT NULL,
  `economics2` int(10) NOT NULL,
  `economics3` int(10) NOT NULL,
  `bussines1` int(10) NOT NULL,
  `bussines2` int(10) NOT NULL,
  `bussines3` int(10) NOT NULL,
  `history1` int(10) NOT NULL,
  `history2` int(10) NOT NULL,
  `history3` int(10) NOT NULL,
  `civics1` int(10) NOT NULL,
  `civics2` int(10) NOT NULL,
  `civics3` int(10) NOT NULL,
  `hpe1` int(10) NOT NULL,
  `hpe2` int(10) NOT NULL,
  `hpe3` int(10) NOT NULL,
  `it1` int(10) NOT NULL,
  `it2` int(10) NOT NULL,
  `it3` int(10) NOT NULL,
  `total1` int(10) NOT NULL,
  `total2` int(10) NOT NULL,
  `total3` int(10) NOT NULL,
  `avarage1` int(10) NOT NULL,
  `avarage2` int(10) NOT NULL,
  `avarage3` int(10) NOT NULL,
  `rank1` int(10) NOT NULL,
  `rank2` int(10) NOT NULL,
  `rank3` int(10) NOT NULL,
  `con1` varchar(10) NOT NULL,
  `con2` varchar(10) NOT NULL,
  `con3` varchar(10) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `remark` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reportcard2`
--

CREATE TABLE `reportcard2` (
  `schname` varchar(30) NOT NULL,
  `stuid` int(11) NOT NULL,
  `stname` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `sex` char(20) NOT NULL,
  `mphone` varchar(32) NOT NULL,
  `hphone` varchar(32) NOT NULL,
  `ayear` int(10) NOT NULL,
  `grade` int(20) NOT NULL DEFAULT 12,
  `promoted` int(20) NOT NULL,
  `amharic1` int(10) NOT NULL,
  `amharic2` int(10) NOT NULL,
  `amharic3` int(10) NOT NULL,
  `english1` int(10) NOT NULL,
  `english2` int(10) NOT NULL,
  `english3` int(10) NOT NULL,
  `maths1` int(10) NOT NULL,
  `maths2` int(10) NOT NULL,
  `maths3` int(10) NOT NULL,
  `physics1` int(10) NOT NULL,
  `physics2` int(10) NOT NULL,
  `physics3` int(10) NOT NULL,
  `biology1` int(10) NOT NULL,
  `biology2` int(10) NOT NULL,
  `biology3` int(10) NOT NULL,
  `chemistry1` int(10) NOT NULL,
  `chemistry2` int(10) NOT NULL,
  `chemistry3` int(10) NOT NULL,
  `geography1` int(10) NOT NULL,
  `geography2` int(10) NOT NULL,
  `geography3` int(10) NOT NULL,
  `economics1` int(10) NOT NULL,
  `economics2` int(10) NOT NULL,
  `economics3` int(10) NOT NULL,
  `bussines1` int(10) NOT NULL,
  `bussines2` int(10) NOT NULL,
  `bussines3` int(10) NOT NULL,
  `history1` int(10) NOT NULL,
  `history2` int(10) NOT NULL,
  `history3` int(10) NOT NULL,
  `civics1` int(10) NOT NULL,
  `civics2` int(10) NOT NULL,
  `civics3` int(10) NOT NULL,
  `hpe1` int(10) NOT NULL,
  `hpe2` int(10) NOT NULL,
  `hpe3` int(10) NOT NULL,
  `it1` int(10) NOT NULL,
  `it2` int(10) NOT NULL,
  `it3` int(10) NOT NULL,
  `total1` int(10) NOT NULL,
  `total2` int(10) NOT NULL,
  `total3` int(10) NOT NULL,
  `avarage1` int(10) NOT NULL,
  `avarage2` int(10) NOT NULL,
  `avarage3` int(10) NOT NULL,
  `rank1` int(10) NOT NULL,
  `rank2` int(10) NOT NULL,
  `rank3` int(10) NOT NULL,
  `con1` varchar(10) NOT NULL,
  `con2` varchar(10) NOT NULL,
  `con3` varchar(10) NOT NULL,
  `tname` varchar(10) NOT NULL,
  `remark` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `i_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `b_date` date NOT NULL,
  `_status` varchar(255) NOT NULL,
  `reg_year` year(4) NOT NULL,
  `reg_month` varchar(255) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `index_number`, `full_name`, `i_name`, `gender`, `address`, `phone`, `email`, `image_name`, `b_date`, `_status`, `reg_year`, `reg_month`, `reg_date`) VALUES
(29, 29, 'kefale tesfaye', 'kefale', 'Male', 'ku', '343-323-3333', 'kef@gmail.com', 'uploads/2022052023559.jpg', '0000-00-00', '', 2022, 'May', '2022-05-02'),
(30, 30, 'Daniel Bido', 'Daniel', 'Male', 'wku', '343-323-3333', 'dan@gmail.com', 'uploads/2022053065534.jpg', '0000-00-00', '', 2022, 'May', '2022-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `date` date NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `time` time NOT NULL,
  `_status1` varchar(255) NOT NULL,
  `_status2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `index_number`, `date`, `month`, `year`, `time`, `_status1`, `_status2`) VALUES
(9, 29, '2022-05-03', 'May', 2022, '06:45:01', 'intime', 'Present'),
(10, 29, '2022-05-03', 'May', 2022, '06:45:12', 'outtime', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `student_exam`
--

CREATE TABLE `student_exam` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `marks` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_exam`
--

INSERT INTO `student_exam` (`id`, `index_number`, `grade_id`, `exam_id`, `subject_id`, `marks`, `year`, `date`) VALUES
(78, 29, 16, 7, 34, '88', 2022, '2022-05-02'),
(79, 29, 16, 7, 35, '90', 2022, '2022-05-02'),
(80, 30, 16, 7, 36, '88', 2022, '2022-05-03'),
(81, 30, 16, 7, 37, '90', 2022, '2022-05-03'),
(82, 29, 16, 7, 36, '88', 2022, '2022-05-03'),
(83, 29, 16, 7, 37, '90', 2022, '2022-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `student_grade`
--

CREATE TABLE `student_grade` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_grade`
--

INSERT INTO `student_grade` (`id`, `index_number`, `grade_id`, `year`) VALUES
(97, 1, 16, 2022),
(98, 28, 16, 2022),
(99, 29, 16, 2022),
(100, 30, 16, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `student_payment`
--

CREATE TABLE `student_payment` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `paid` double(11,2) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `student_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payment`
--

INSERT INTO `student_payment` (`id`, `index_number`, `year`, `month`, `date`, `paid`, `_status`, `student_status`) VALUES
(254, 1, 2022, 'May', '2022-05-02', 100.00, 'Admission Fee', ''),
(255, 1, 2022, 'May', '2022-05-02', 100.00, 'Admission Fee', ''),
(256, 29, 2022, 'May', '2022-05-02', 100.00, 'Admission Fee', ''),
(257, 29, 2022, 'May', '2022-05-02', 500.00, 'Monthly Fee1', ''),
(258, 30, 2022, 'May', '2022-05-03', 100.00, 'Admission Fee', ''),
(259, 30, 2022, 'May', '2022-05-03', 500.00, 'Monthly Fee1', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_payment_history`
--

CREATE TABLE `student_payment_history` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_fee` double(11,2) NOT NULL,
  `subtotal` double(11,2) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `date` date NOT NULL,
  `invoice_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payment_history`
--

INSERT INTO `student_payment_history` (`id`, `index_number`, `grade_id`, `subject_id`, `teacher_id`, `subject_fee`, `subtotal`, `_status`, `month`, `year`, `date`, `invoice_number`) VALUES
(673, 29, 16, 34, 17, 250.00, 250.00, 'Monthly Fee', 'May', 2022, '2022-05-02', 256),
(674, 29, 16, 35, 17, 250.00, 250.00, 'Monthly Fee', 'May', 2022, '2022-05-02', 256),
(675, 30, 16, 34, 17, 250.00, 250.00, 'Monthly Fee', 'May', 2022, '2022-05-03', 258),
(676, 30, 16, 35, 17, 250.00, 250.00, 'Monthly Fee', 'May', 2022, '2022-05-03', 258);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `sr_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `reg_month` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`id`, `index_number`, `_status`, `sr_id`, `year`, `reg_month`) VALUES
(317, 29, '', 42, 2022, ''),
(318, 30, '', 42, 2022, '');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
(36, 'math'),
(37, 'english'),
(38, 'chem'),
(39, 'physics');

-- --------------------------------------------------------

--
-- Table structure for table `subject_routing`
--

CREATE TABLE `subject_routing` (
  `id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `fee` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_routing`
--

INSERT INTO `subject_routing` (`id`, `grade_id`, `subject_id`, `teacher_id`, `fee`) VALUES
(39, 16, 34, 17, 250.00),
(40, 16, 35, 17, 250.00),
(41, 16, 36, 17, 250.00),
(42, 16, 37, 18, 250.00),
(43, 17, 36, 17, 250.00),
(44, 17, 37, 18, 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `i_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `full_name`, `i_name`, `gender`, `address`, `phone`, `email`, `image_name`, `index_number`, `reg_date`) VALUES
(17, 'dinaol adugna', 'dinaol', 'Male', 'kuy', '093-915-0102', 'din@gmail.com', 'uploads/2022052021939.jpg', 1, '2022-05-02'),
(18, 'Firaol  Negera', 'Firaol', 'Male', 'wku', '233-322-5555', 'fir@gmail.com', 'uploads/2022053065301.jpg', 2, '2022-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `date` date NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `time` time NOT NULL,
  `_status1` varchar(255) NOT NULL,
  `_status2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`id`, `index_number`, `date`, `month`, `year`, `time`, `_status1`, `_status2`) VALUES
(1, 1, '2022-05-02', 'May', 2022, '03:45:44', 'intime', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_salary`
--

CREATE TABLE `teacher_salary` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `date` date NOT NULL,
  `paid` double(11,2) NOT NULL,
  `_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_salary`
--

INSERT INTO `teacher_salary` (`id`, `index_number`, `month`, `year`, `date`, `paid`, `_status`) VALUES
(1, 1, 'May', 2022, '2022-05-02', -10066.00, 'Advance');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_salary_history`
--

CREATE TABLE `teacher_salary_history` (
  `id` int(11) NOT NULL,
  `index_number` bigint(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_fee` double(11,2) NOT NULL,
  `student_count` int(11) NOT NULL,
  `hall_charge` int(11) NOT NULL,
  `subtotal` double(11,2) NOT NULL,
  `paid` double(11,2) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `date` date NOT NULL,
  `invoice_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_salary_history`
--

INSERT INTO `teacher_salary_history` (`id`, `index_number`, `grade_id`, `subject_id`, `subject_fee`, `student_count`, `hall_charge`, `subtotal`, `paid`, `_status`, `month`, `year`, `date`, `invoice_number`) VALUES
(1, 1, 16, 34, 250.00, 1, 250, -375.00, -10066.00, 'Advance', 'May', 2022, '2022-05-02', 1),
(2, 1, 16, 35, 250.00, 1, 250, -375.00, -10066.00, 'Advance', 'May', 2022, '2022-05-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `start_time` double(11,2) NOT NULL,
  `end_time` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `grade_id`, `day`, `subject_id`, `teacher_id`, `classroom_id`, `start_time`, `end_time`) VALUES
(84, 16, 'Monday', 34, 17, 27, 2.00, 3.00),
(85, 16, 'Monday', 35, 17, 28, 3.00, 4.00),
(86, 16, 'Monday', 34, 0, 27, 7.00, 8.00),
(87, 16, 'Sunday', 36, 0, 28, 2.00, 3.00),
(88, 16, 'Monday', 36, 17, 27, 2.00, 4.00),
(89, 16, 'Wednesday', 37, 18, 28, 2.00, 3.00),
(90, 16, 'Wednesday', 36, 17, 29, 3.00, 4.00),
(91, 16, 'Friday', 36, 17, 28, 7.00, 8.00);

-- --------------------------------------------------------

--
-- Table structure for table `transcript`
--

CREATE TABLE `transcript` (
  `pobox` int(100) NOT NULL,
  `tell2` varchar(32) NOT NULL,
  `schoolname` varchar(30) NOT NULL DEFAULT 'Tepi preparatory school',
  `id` int(32) NOT NULL,
  `fname` varchar(10) NOT NULL,
  `mname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `sex` char(20) NOT NULL,
  `attend` varchar(32) NOT NULL,
  `year` int(10) NOT NULL,
  `detained` varchar(20) NOT NULL,
  `reason` varchar(32) NOT NULL,
  `amharic1` int(10) NOT NULL,
  `amharic2` int(10) NOT NULL,
  `amharic3` int(10) NOT NULL,
  `amharic4` int(10) NOT NULL,
  `amharic5` int(10) NOT NULL,
  `amharic6` int(10) NOT NULL,
  `english1` int(10) NOT NULL,
  `english2` int(10) NOT NULL,
  `english3` int(10) NOT NULL,
  `english4` int(10) NOT NULL,
  `english5` int(10) NOT NULL,
  `english6` int(10) NOT NULL,
  `maths1` int(10) NOT NULL,
  `maths2` int(10) NOT NULL,
  `maths3` int(10) NOT NULL,
  `maths4` int(10) NOT NULL,
  `maths5` int(10) NOT NULL,
  `maths6` int(10) NOT NULL,
  `physics1` int(10) NOT NULL,
  `physics2` int(10) NOT NULL,
  `physics3` int(10) NOT NULL,
  `physics4` int(10) NOT NULL,
  `physics5` int(10) NOT NULL,
  `physics6` int(10) NOT NULL,
  `biology1` int(10) NOT NULL,
  `biology2` int(10) NOT NULL,
  `biology3` int(10) NOT NULL,
  `biology4` int(10) NOT NULL,
  `biology5` int(10) NOT NULL,
  `biology6` int(10) NOT NULL,
  `chemistry1` int(10) NOT NULL,
  `chemistry2` int(10) NOT NULL,
  `chemistry3` int(10) NOT NULL,
  `chemistry4` int(10) NOT NULL,
  `chemistry5` int(10) NOT NULL,
  `chemistry6` int(10) NOT NULL,
  `geography1` int(10) NOT NULL,
  `geography2` int(10) NOT NULL,
  `geography3` int(10) NOT NULL,
  `geography4` int(10) NOT NULL,
  `geography5` int(10) NOT NULL,
  `geography6` int(10) NOT NULL,
  `economics1` int(10) NOT NULL,
  `economics2` int(10) NOT NULL,
  `economics3` int(10) NOT NULL,
  `economics4` int(10) NOT NULL,
  `economics5` int(10) NOT NULL,
  `economics6` int(10) NOT NULL,
  `bussines1` int(10) NOT NULL,
  `bussines2` int(10) NOT NULL,
  `bussines3` int(10) NOT NULL,
  `bussines4` int(10) NOT NULL,
  `bussines5` int(10) NOT NULL,
  `bussines6` int(10) NOT NULL,
  `history1` int(10) NOT NULL,
  `history2` int(10) NOT NULL,
  `history3` int(10) NOT NULL,
  `history4` int(10) NOT NULL,
  `history5` int(10) NOT NULL,
  `history6` int(10) NOT NULL,
  `civics1` int(10) NOT NULL,
  `civics2` int(10) NOT NULL,
  `civics3` int(10) NOT NULL,
  `civics4` int(10) NOT NULL,
  `civics5` int(10) NOT NULL,
  `civics6` int(10) NOT NULL,
  `hpe1` int(10) NOT NULL,
  `hpe2` int(10) NOT NULL,
  `hpe3` int(10) NOT NULL,
  `hpe4` int(10) NOT NULL,
  `hpe5` int(10) NOT NULL,
  `hpe6` int(10) NOT NULL,
  `it1` int(10) NOT NULL,
  `it2` int(10) NOT NULL,
  `it3` int(10) NOT NULL,
  `it4` int(10) NOT NULL,
  `it5` int(10) NOT NULL,
  `it6` int(10) NOT NULL,
  `total1` int(10) NOT NULL,
  `total2` int(10) NOT NULL,
  `total3` int(10) NOT NULL,
  `total4` int(10) NOT NULL,
  `total5` int(10) NOT NULL,
  `total6` int(10) NOT NULL,
  `avarage1` int(10) NOT NULL,
  `avarage2` int(10) NOT NULL,
  `avarage3` int(10) NOT NULL,
  `avarage4` int(10) NOT NULL,
  `avarage5` int(10) NOT NULL,
  `avarage6` int(10) NOT NULL,
  `rank1` int(10) NOT NULL,
  `rank2` int(10) NOT NULL,
  `rank3` int(10) NOT NULL,
  `rank4` int(10) NOT NULL,
  `rank5` int(10) NOT NULL,
  `rank6` int(10) NOT NULL,
  `con1` varchar(10) NOT NULL,
  `con2` varchar(10) NOT NULL,
  `con3` varchar(10) NOT NULL,
  `con4` varchar(10) NOT NULL,
  `con5` varchar(10) NOT NULL,
  `con6` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `type`) VALUES
(1, 'admin@gmail.com', '12345', 'Admin'),
(82, 'din@gmail.com', '12345', 'Teacher'),
(83, 'kef@gmail.com', '12345', 'Student'),
(84, 'tes@gmail.com', '12345', 'Parents'),
(85, 'kef@gmail.com', '12345', 'Student'),
(86, 'kef@gmail.com', '12345', 'Student'),
(87, 'tes@gmail.com', '12345', 'Parents'),
(88, 'fir@gmail.com', '12345', 'Teacher'),
(89, 'dan@gmail.com', '12345', 'Student'),
(90, 'bid@gmail.com', '12345', 'Parents');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_room`
--
ALTER TABLE `class_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_category_type`
--
ALTER TABLE `event_category_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_range_grade`
--
ALTER TABLE `exam_range_grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_message`
--
ALTER TABLE `group_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_notifications`
--
ALTER TABLE `main_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_friends`
--
ALTER TABLE `my_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_history`
--
ALTER TABLE `notification_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_chat`
--
ALTER TABLE `online_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_notifications`
--
ALTER TABLE `payment_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petty_cash`
--
ALTER TABLE `petty_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petty_cash_history`
--
ALTER TABLE `petty_cash_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reportcard`
--
ALTER TABLE `reportcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reportcard2`
--
ALTER TABLE `reportcard2`
  ADD PRIMARY KEY (`stuid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_exam`
--
ALTER TABLE `student_exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_grade`
--
ALTER TABLE `student_grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_payment`
--
ALTER TABLE `student_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_payment_history`
--
ALTER TABLE `student_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_routing`
--
ALTER TABLE `subject_routing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_salary`
--
ALTER TABLE `teacher_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_salary_history`
--
ALTER TABLE `teacher_salary_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transcript`
--
ALTER TABLE `transcript`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_room`
--
ALTER TABLE `class_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_category_type`
--
ALTER TABLE `event_category_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_range_grade`
--
ALTER TABLE `exam_range_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `group_message`
--
ALTER TABLE `group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_notifications`
--
ALTER TABLE `main_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `my_friends`
--
ALTER TABLE `my_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification_history`
--
ALTER TABLE `notification_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `online_chat`
--
ALTER TABLE `online_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment_notifications`
--
ALTER TABLE `payment_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `petty_cash`
--
ALTER TABLE `petty_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petty_cash_history`
--
ALTER TABLE `petty_cash_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reportcard`
--
ALTER TABLE `reportcard`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88879;

--
-- AUTO_INCREMENT for table `reportcard2`
--
ALTER TABLE `reportcard2`
  MODIFY `stuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6686;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_exam`
--
ALTER TABLE `student_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `student_grade`
--
ALTER TABLE `student_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `student_payment`
--
ALTER TABLE `student_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `student_payment_history`
--
ALTER TABLE `student_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=677;

--
-- AUTO_INCREMENT for table `student_subject`
--
ALTER TABLE `student_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `subject_routing`
--
ALTER TABLE `subject_routing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_salary`
--
ALTER TABLE `teacher_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_salary_history`
--
ALTER TABLE `teacher_salary_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
