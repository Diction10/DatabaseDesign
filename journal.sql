-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 05:39 PM
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
-- Database: `journal`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `Name` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Affiliation` text NOT NULL,
  `Mailing Address` text NOT NULL,
  `Manuscripts_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `editor`
--

CREATE TABLE `editor` (
  `Full Name` varchar(100) NOT NULL,
  `Phone Number` text NOT NULL,
  `Years of Expertise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Rating` int(11) NOT NULL,
  `Recommendation` text NOT NULL,
  `Reviewer_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `Number` int(11) NOT NULL,
  `Volume` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Season` text NOT NULL,
  `Date` date NOT NULL,
  `Manuscript_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manuscripts`
--

CREATE TABLE `manuscripts` (
  `Number` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Date` date NOT NULL,
  `Status` text NOT NULL,
  `Editor_Fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Clarity` int(11) NOT NULL,
  `Appropriatenesss` int(11) NOT NULL,
  `Methodology` int(11) NOT NULL,
  `Contribution` int(11) NOT NULL,
  `Reviewer_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `Number` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Affiliation` text NOT NULL,
  `Area of Interest` text NOT NULL,
  `Editor_Fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `Reviewer_Number` int(11) NOT NULL,
  `Manuscript_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typesetting`
--

CREATE TABLE `typesetting` (
  `Font Name` text NOT NULL,
  `Font Size` int(11) NOT NULL,
  `Font Style` text NOT NULL,
  `Line Spacing` int(11) NOT NULL,
  `Justification` text NOT NULL,
  `Number of Pages` int(11) NOT NULL,
  `Manuscript_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `written`
--

CREATE TABLE `written` (
  `Manuscript_Number` int(11) NOT NULL,
  `Author_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `Manuscripts_Number` (`Manuscripts_Number`);

--
-- Indexes for table `editor`
--
ALTER TABLE `editor`
  ADD PRIMARY KEY (`Full Name`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `Reviewer_Number` (`Reviewer_Number`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `Manuscript_Number` (`Manuscript_Number`);

--
-- Indexes for table `manuscripts`
--
ALTER TABLE `manuscripts`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `Editor_Fullname` (`Editor_Fullname`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Reviewer_Number` (`Reviewer_Number`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `Editor_Fullname` (`Editor_Fullname`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD KEY `Manuscript_Number` (`Manuscript_Number`),
  ADD KEY `Reviewer_Number` (`Reviewer_Number`);

--
-- Indexes for table `typesetting`
--
ALTER TABLE `typesetting`
  ADD KEY `Manuscript_Number` (`Manuscript_Number`);

--
-- Indexes for table `written`
--
ALTER TABLE `written`
  ADD KEY `Author_Name` (`Author_Name`),
  ADD KEY `Manuscript_Number` (`Manuscript_Number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`Manuscripts_Number`) REFERENCES `manuscripts` (`Number`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Reviewer_Number`) REFERENCES `reviewer` (`Number`);

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`Manuscript_Number`) REFERENCES `manuscripts` (`Number`);

--
-- Constraints for table `manuscripts`
--
ALTER TABLE `manuscripts`
  ADD CONSTRAINT `manuscripts_ibfk_1` FOREIGN KEY (`Editor_Fullname`) REFERENCES `editor` (`Full Name`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`Reviewer_Number`) REFERENCES `reviewer` (`Number`);

--
-- Constraints for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD CONSTRAINT `reviewer_ibfk_1` FOREIGN KEY (`Editor_Fullname`) REFERENCES `editor` (`Full Name`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Manuscript_Number`) REFERENCES `manuscripts` (`Number`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Reviewer_Number`) REFERENCES `reviewer` (`Number`);

--
-- Constraints for table `typesetting`
--
ALTER TABLE `typesetting`
  ADD CONSTRAINT `typesetting_ibfk_1` FOREIGN KEY (`Manuscript_Number`) REFERENCES `manuscripts` (`Number`);

--
-- Constraints for table `written`
--
ALTER TABLE `written`
  ADD CONSTRAINT `written_ibfk_1` FOREIGN KEY (`Author_Name`) REFERENCES `author` (`Name`),
  ADD CONSTRAINT `written_ibfk_2` FOREIGN KEY (`Manuscript_Number`) REFERENCES `manuscripts` (`Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
