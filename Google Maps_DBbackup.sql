-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2023 at 08:42 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `googlemap`
--

-- --------------------------------------------------------

--
-- Table structure for table `confirmation`
--

CREATE TABLE `confirmation` (
  `UserID` int(11) NOT NULL,
  `ConfirmationID` int(11) NOT NULL,
  `IncidentID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `confirmation`
--

INSERT INTO `confirmation` (`UserID`, `ConfirmationID`, `IncidentID`, `Timestamp`) VALUES
(1, 1, 1, '2023-01-20 16:15:30'),
(1, 2, 2, '2023-01-20 20:15:30'),
(1, 3, 3, '2023-03-20 19:15:30'),
(2, 4, 4, '2023-04-22 19:15:30'),
(3, 5, 5, '2023-04-25 19:15:30'),
(1, 6, 6, '2023-05-20 15:15:30'),
(1, 7, 7, '2023-06-20 19:15:30'),
(1, 8, 8, '2023-07-20 19:15:30'),
(2, 9, 9, '2023-08-22 19:15:30'),
(3, 10, 10, '2023-09-25 19:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `IncidentID` int(11) NOT NULL,
  `DataID` int(11) NOT NULL,
  `RoadID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EndTime` timestamp NULL DEFAULT NULL,
  `IncidentType` enum('Fire','Construction','Accident','Block','Police','Weather') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`IncidentID`, `DataID`, `RoadID`, `LocationID`, `StartTime`, `EndTime`, `IncidentType`) VALUES
(1, 5, 1, 1, '2023-01-20 16:15:30', '2023-04-21 19:25:30', 'Accident'),
(2, 4, 2, 2, '2023-01-20 20:15:30', '2023-04-21 21:15:30', 'Block'),
(3, 3, 3, 3, '2023-03-20 19:15:30', '2023-03-21 19:15:30', 'Block'),
(4, 2, 5, 4, '2023-04-22 19:15:30', '2023-04-22 20:15:30', 'Construction'),
(5, 1, 5, 5, '2023-04-25 19:15:30', '2023-04-25 19:45:30', 'Fire'),
(6, 5, 1, 1, '2023-01-20 16:15:11', '2023-04-21 19:25:30', 'Accident'),
(7, 4, 1, 1, '2023-01-20 20:15:45', '2023-04-21 21:15:30', 'Block'),
(8, 3, 1, 1, '2023-03-20 19:15:14', '2023-03-21 19:15:30', 'Block'),
(9, 2, 4, 4, '2023-04-22 23:15:30', '2023-04-22 23:25:30', 'Construction'),
(10, 1, 5, 5, '2023-04-25 23:18:30', '2023-04-25 23:45:30', 'Fire');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Latitude` float NOT NULL,
  `Longtitude` float NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Zipcode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `Latitude`, `Longtitude`, `Address`, `City`, `State`, `Country`, `Zipcode`) VALUES
(1, 39.9678, 77.0138, '540 Independence Ave SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22201),
(2, 39.1136, 76.0151, '400 Maryland Ave SW, Washington, DC 20202', 'Washington DC', 'State of Washington', 'US', 22202),
(3, 40.9789, 77.0119, '330 Independence Ave SW, Washington, DC 20237', 'Washington DC', 'State of Washington', 'US', 22203),
(4, 38.9131, 78.0132, '550 C St SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22204),
(5, 39.9678, 77.0138, '400 C St SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22205),
(6, 39.9611, 78.0138, '541 Independence Ave SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22206),
(7, 40.9118, 79.0138, '401 Maryland Ave SW, Washington, DC 20202', 'Washington DC', 'State of Washington', 'US', 22207),
(8, 41.9458, 80.0138, '331 Independence Ave SW, Washington, DC 20237', 'Washington DC', 'State of Washington', 'US', 22208),
(9, 42.9148, 76.0138, '551 C St SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22209),
(10, 43.9678, 77.1145, '410 C St SW, Washington, DC 20024', 'Washington DC', 'State of Washington', 'US', 22210);

-- --------------------------------------------------------

--
-- Table structure for table `mapuser`
--

CREATE TABLE `mapuser` (
  `UserID` int(11) NOT NULL,
  `CurrentLocationID` int(11) NOT NULL,
  `Email` varchar(10) DEFAULT NULL,
  `UserName` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mapuser`
--

INSERT INTO `mapuser` (`UserID`, `CurrentLocationID`, `Email`, `UserName`, `PhoneNumber`) VALUES
(1, 1, 'a@g.com', 'Mr. A', '+12675302407'),
(2, 2, 'b@g.com', 'Mr. B', '+12024012000'),
(3, 3, 'c@g.com', 'Mr. C', '+12022034000'),
(4, 4, 'd@g.com', 'Mr. D', '+12024794000'),
(5, 5, 'e@g.com', 'Mr. E', '+12024840803'),
(6, 6, 'f@g.com', 'Mr. F', '+12675301107'),
(7, 7, 'g@g.com', 'Mr. G', '+12024042000'),
(8, 8, 'h@g.com', 'Mr. H', '+12022054000'),
(9, 9, 'i@g.com', 'Mr. I', '+12024791000'),
(10, 10, 'j@g.com', 'Mr. J', '+12024441903');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IncidentID` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `PriorityLevel` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `TimeStamp`, `IncidentID`, `Description`, `PriorityLevel`) VALUES
(1, '2023-01-20 16:17:40', 1, 'Accident happen 3km away from your position, please be careful!', '73'),
(2, '2023-01-20 20:17:40', 1, 'There is block 2km from your position, please pay attention to notice.', '40'),
(3, '2023-03-20 19:18:40', 1, 'There is block 3.5km from your position, please pay attention to notice.', '50'),
(4, '2023-04-22 19:18:40', 1, 'There is constructed road 2km from your position. please pay attention to notice', '30'),
(5, '2023-04-25 19:18:40', 1, 'Fire happend 6km from your position, please consider change path.', '89'),
(6, '2023-02-20 16:17:40', 1, 'Accident happen 3km away from your position, please be careful!', '72'),
(7, '2023-03-20 19:17:40', 1, 'There is block 2km from your position, please pay attention to notice.', '39'),
(8, '2023-05-20 19:18:40', 1, 'There is block 3.5km from your position, please pay attention to notice.', '59'),
(9, '2023-07-22 19:18:40', 1, 'There is constructed road 2km from your position. please pay attention to notice', '30'),
(10, '2023-08-25 19:18:40', 1, 'Fire happend 6km from your position, please consider change path.', '90');

-- --------------------------------------------------------

--
-- Table structure for table `notificationforuser`
--

CREATE TABLE `notificationforuser` (
  `UserID` int(11) NOT NULL,
  `NotificationID` int(11) NOT NULL,
  `TargetLocation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificationforuser`
--

INSERT INTO `notificationforuser` (`UserID`, `NotificationID`, `TargetLocation`) VALUES
(2, 4, 'I St SW Near around'),
(3, 5, 'K St SW Near around'),
(3, 6, 'A St SW Near around'),
(3, 7, 'B St SW Near around'),
(3, 10, 'H St SW Near around'),
(4, 1, 'C St SW Near around'),
(5, 2, 'E St SW Near around'),
(5, 3, 'G St SW Near around'),
(8, 8, 'D St SW Near around'),
(9, 9, 'G St SW Near around');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `UserID` int(11) NOT NULL,
  `ReportID` int(11) NOT NULL,
  `RoadID` int(11) NOT NULL,
  `ConfirmationID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Description` varchar(200) DEFAULT NULL,
  `ReportStatus` enum('Pending','Confirmed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`UserID`, `ReportID`, `RoadID`, `ConfirmationID`, `Timestamp`, `Description`, `ReportStatus`) VALUES
(1, 1, 1, 1, '2023-01-20 16:15:40', 'Accident happen', 'Pending'),
(1, 2, 2, 2, '2023-01-20 20:15:40', 'Block in this street', 'Confirmed'),
(1, 3, 3, 3, '2023-03-20 19:15:40', 'We could not pass', 'Pending'),
(2, 4, 4, 4, '2023-04-22 19:15:40', 'Seems some construction', 'Confirmed'),
(3, 5, 5, 5, '2023-04-25 19:15:40', 'It has fire, dangerous', 'Pending'),
(1, 6, 6, 6, '2023-05-20 15:15:40', 'Accident happen,no one hurt, but need more time', 'Pending'),
(5, 7, 7, 7, '2023-06-20 19:15:40', 'Block in this street', 'Confirmed'),
(6, 8, 8, 8, '2023-07-20 19:15:40', 'Event, could not pass', 'Pending'),
(7, 9, 9, 9, '2023-08-22 19:15:40', 'Seems holding some event', 'Confirmed'),
(8, 10, 10, 10, '2023-09-25 19:15:40', 'Many car, traffic jam', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `road`
--

CREATE TABLE `road` (
  `RoadID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `RoadName` varchar(100) NOT NULL,
  `RoadType` enum('Freeways','Highways','Arterial','Collector','Local','Pedestrian','Private') NOT NULL,
  `SpeedLimit` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `road`
--

INSERT INTO `road` (`RoadID`, `LocationID`, `RoadName`, `RoadType`, `SpeedLimit`) VALUES
(1, 1, 'C St SW', 'Freeways', 50),
(2, 2, 'E St SW', 'Highways', 60),
(3, 3, 'G St SW', 'Arterial', 70),
(4, 4, 'I St SW', 'Pedestrian', 50),
(5, 5, 'K St SW', 'Private', 40),
(6, 6, 'A St SW', 'Freeways', 60),
(7, 7, 'B St SW', 'Highways', 60),
(8, 8, 'D St SW', 'Arterial', 65),
(9, 9, 'Z St SW', 'Pedestrian', 55),
(10, 10, 'Y St SW', 'Private', 45);

-- --------------------------------------------------------

--
-- Table structure for table `satellitedata`
--

CREATE TABLE `satellitedata` (
  `DataID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Latitude` float NOT NULL,
  `Longtitude` float NOT NULL,
  `RoadConditionStatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satellitedata`
--

INSERT INTO `satellitedata` (`DataID`, `TimeStamp`, `Latitude`, `Longtitude`, `RoadConditionStatus`) VALUES
(1, '2023-04-20 19:15:30', 38.9136, 78.1142, 'Normal'),
(2, '2023-04-20 19:15:30', 39.1136, 76.0151, 'Traffic Jam'),
(3, '2023-04-21 19:15:30', 40.9789, 77.0119, 'Block'),
(4, '2023-04-22 19:15:30', 38.9131, 78.0132, 'Normal'),
(5, '2023-04-23 19:15:30', 39.9678, 77.0138, 'Incident'),
(6, '2023-04-24 19:15:30', 39.9611, 78.0138, 'Incident'),
(7, '2023-04-25 19:15:30', 40.9118, 79.0138, 'Traffic Jam'),
(8, '2023-05-23 19:15:30', 41.9458, 80.0138, 'Incident'),
(9, '2023-06-23 19:15:30', 42.9148, 76.0138, 'Normal'),
(10, '2023-07-23 19:15:30', 43.9678, 77.1145, 'Block');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD PRIMARY KEY (`ConfirmationID`),
  ADD KEY `CONFIRMATION_FK1` (`UserID`),
  ADD KEY `CONFIRMATION_FK2` (`IncidentID`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`IncidentID`),
  ADD KEY `INCIDENT_FK1` (`DataID`),
  ADD KEY `INCIDENT_FK2` (`RoadID`),
  ADD KEY `INCIDENT_FK3` (`LocationID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `mapuser`
--
ALTER TABLE `mapuser`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `MapUSER_FK` (`CurrentLocationID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `NOTIFICATION_FK` (`IncidentID`);

--
-- Indexes for table `notificationforuser`
--
ALTER TABLE `notificationforuser`
  ADD PRIMARY KEY (`UserID`,`NotificationID`),
  ADD KEY `NOTIFICATIONFORUSER_FK2` (`NotificationID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `REPORT_FK1` (`UserID`),
  ADD KEY `REPORT_FK2` (`RoadID`),
  ADD KEY `REPORT_FK3` (`ConfirmationID`);

--
-- Indexes for table `road`
--
ALTER TABLE `road`
  ADD PRIMARY KEY (`RoadID`),
  ADD KEY `road_FK` (`LocationID`);

--
-- Indexes for table `satellitedata`
--
ALTER TABLE `satellitedata`
  ADD PRIMARY KEY (`DataID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD CONSTRAINT `CONFIRMATION_FK1` FOREIGN KEY (`UserID`) REFERENCES `mapuser` (`UserID`),
  ADD CONSTRAINT `CONFIRMATION_FK2` FOREIGN KEY (`IncidentID`) REFERENCES `incident` (`IncidentID`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `INCIDENT_FK1` FOREIGN KEY (`DataID`) REFERENCES `satellitedata` (`DataID`),
  ADD CONSTRAINT `INCIDENT_FK2` FOREIGN KEY (`RoadID`) REFERENCES `road` (`RoadID`),
  ADD CONSTRAINT `INCIDENT_FK3` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `mapuser`
--
ALTER TABLE `mapuser`
  ADD CONSTRAINT `MapUSER_FK` FOREIGN KEY (`CurrentLocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `NOTIFICATION_FK` FOREIGN KEY (`IncidentID`) REFERENCES `incident` (`IncidentID`);

--
-- Constraints for table `notificationforuser`
--
ALTER TABLE `notificationforuser`
  ADD CONSTRAINT `NOTIFICATIONFORUSER_FK1` FOREIGN KEY (`UserID`) REFERENCES `mapuser` (`UserID`),
  ADD CONSTRAINT `NOTIFICATIONFORUSER_FK2` FOREIGN KEY (`NotificationID`) REFERENCES `notification` (`NotificationID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `REPORT_FK1` FOREIGN KEY (`UserID`) REFERENCES `mapuser` (`UserID`),
  ADD CONSTRAINT `REPORT_FK2` FOREIGN KEY (`RoadID`) REFERENCES `road` (`RoadID`),
  ADD CONSTRAINT `REPORT_FK3` FOREIGN KEY (`ConfirmationID`) REFERENCES `confirmation` (`IncidentID`);

--
-- Constraints for table `road`
--
ALTER TABLE `road`
  ADD CONSTRAINT `road_FK` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
