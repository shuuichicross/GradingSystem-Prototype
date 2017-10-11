-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2017 at 07:11 PM
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
-- Database: `gradingsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGrade` (IN `studID` INTEGER, IN `subjID` INTEGER, IN `profID` INTEGER, IN `inGrade` DOUBLE)  BEGIN

	DECLARE result INTEGER;

    SELECT COUNT(`gradeID`) INTO result FROM gradesheet WHERE `studentID` = studID AND `subjectID` = subjID;

	

    IF (result = 0) THEN

		IF(inGrade >= 50 && inGrade <=100) THEN

			INSERT INTO `gradesheet`(`studentID`,`subjectID`,`profId`,`grade`) VALUES (studID,subjID,profId,inGrade);

		END IF;

	END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudent` (IN `fn` VARCHAR(50), IN `mi` VARCHAR(6), IN `ln` VARCHAR(50), IN `inputCourseID` INTEGER, IN `inYear` INTEGER)  BEGIN

	DECLARE result INTEGER;

    

    SELECT `courseMaxYears` INTO result FROM `course` WHERE `courseID` = inputCourseID LIMIT 1;

    

    IF (result = 4 AND inYear <=4) THEN

		INSERT INTO student(`studentFirstName`,`studentMiddleInitial`,`studentLastName`,

        `courseTakenID`,`yearStanding`) VALUES

        (fn,mi,ln,inputCourseID,inYear);

        

	elseif(result = 5 AND inYear <=5) THEN

		INSERT INTO student(`studentFirstName`,`studentMiddleInitial`,`studentLastName`,

        `courseTakenID`,`yearStanding`) VALUES

        (fn,mi,ln,inputCourseID,inYear);      

    END IF;

    



END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getGrade` (`studID` INT, `subjID` INT) RETURNS VARCHAR(1) CHARSET utf8 BEGIN
DECLARE sqlGrade DOUBLE;
    DECLARE rowResult INTEGER;
    SELECT COUNT(gradeID) INTO rowResult from gradesheet WHERE studentID =studID AND subjectID=subjID;
	
    
    if(rowResult <> 0) THEN
        SELECT grade INTO sqlGrade from gradesheet WHERE studentID =studID AND subjectID=subjID;

		IF (sqlGrade >= 95 AND sqlGrade <=100) THEN
			RETURN 'A';
		ELSEIF (sqlGrade >=90 AND sqlGrade <= 94) THEN
			RETURN 'B';
		ELSEIF (sqlGrade >=85 AND sqlGrade <= 89) THEN
			RETURN 'C'; 
		ELSEIF (sqlGrade >=80 AND sqlGrade <= 84) THEN
			RETURN 'D';
		ELSEIF (sqlGrade >=75 AND sqlGrade <= 79) THEN
			RETURN 'E';
		else
		RETURN 'F';
		END IF;	
    END IF;
    

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(40) DEFAULT NULL,
  `courseMaxYears` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `courseName`, `courseMaxYears`) VALUES
(3, 'BSIT', 4),
(4, 'BSA', 4);

-- --------------------------------------------------------

--
-- Table structure for table `gradesheet`
--

CREATE TABLE `gradesheet` (
  `gradeID` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `profID` int(11) NOT NULL,
  `profFirstName` varchar(50) DEFAULT NULL,
  `profMiddleInitial` varchar(6) DEFAULT NULL,
  `profLastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`profID`, `profFirstName`, `profMiddleInitial`, `profLastName`) VALUES
(4, 'Gem Harvey', 'O.', 'Pedida'),
(5, 'Dummy', 'D.', 'Dummy'),
(6, 'Richard Louie', 'T.', 'Orilla'),
(7, 'Magnolia', 'A.', 'Raz');

-- --------------------------------------------------------

--
-- Stand-in structure for view `professorlist`
-- (See below for the actual view)
--
CREATE TABLE `professorlist` (
`First Name` varchar(50)
,`Middle Initial` varchar(6)
,`Last Name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `studentFirstName` varchar(50) DEFAULT NULL,
  `studentMiddleInitial` varchar(6) DEFAULT NULL,
  `studentLastName` varchar(50) DEFAULT NULL,
  `courseTakenID` int(11) DEFAULT NULL,
  `yearStanding` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `subjectCode` varchar(6) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL,
  `courseOfClass` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `professorlist`
--
DROP TABLE IF EXISTS `professorlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `professorlist`  AS  (select `professor`.`profFirstName` AS `First Name`,`professor`.`profMiddleInitial` AS `Middle Initial`,`professor`.`profLastName` AS `Last Name` from `professor`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `gradesheet`
--
ALTER TABLE `gradesheet`
  ADD PRIMARY KEY (`gradeID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `subjectID` (`subjectID`),
  ADD KEY `profID` (`profID`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`profID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `courseTakenID` (`courseTakenID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`),
  ADD UNIQUE KEY `subjectCode` (`subjectCode`),
  ADD KEY `profID` (`profID`),
  ADD KEY `courseOfClass` (`courseOfClass`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gradesheet`
--
ALTER TABLE `gradesheet`
  MODIFY `gradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `profID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `gradesheet`
--
ALTER TABLE `gradesheet`
  ADD CONSTRAINT `gradesheet_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `gradesheet_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  ADD CONSTRAINT `gradesheet_ibfk_3` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseTakenID`) REFERENCES `course` (`courseID`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`),
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`courseOfClass`) REFERENCES `course` (`courseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
