CREATE DATABASE  IF NOT EXISTS `gradingsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gradingsystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gradingsystem
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(40) DEFAULT NULL,
  `courseMaxYears` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseID`),
  UNIQUE KEY `courseName_UNIQUE` (`courseName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'BS ARCHITECTURE',5),(2,'BS INFORMATION TECHNOLOGY',4),(3,'BS Criminology',4),(4,'BS Accountancy',5),(5,'BS HRM',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradesheet`
--

DROP TABLE IF EXISTS `gradesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradesheet` (
  `gradeID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` int(11) DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  PRIMARY KEY (`gradeID`),
  KEY `studentID` (`studentID`),
  KEY `subjectID` (`subjectID`),
  KEY `profID` (`profID`),
  CONSTRAINT `gradesheet_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  CONSTRAINT `gradesheet_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  CONSTRAINT `gradesheet_ibfk_3` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradesheet`
--

LOCK TABLES `gradesheet` WRITE;
/*!40000 ALTER TABLE `gradesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `profID` int(11) NOT NULL AUTO_INCREMENT,
  `profFirstName` varchar(50) DEFAULT NULL,
  `profMiddleInitial` varchar(6) DEFAULT NULL,
  `profLastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`profID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Lady','L','Gaga'),(2,'Michael','J','Jackson'),(3,'Korina','S','Sanchez'),(4,'Britney','S','Spears'),(5,'Kevin','D','Durant'),(6,'Gloria','M','Arroyo');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentID` int(11) NOT NULL AUTO_INCREMENT,
  `studentFirstName` varchar(50) DEFAULT NULL,
  `studentMiddleInitial` varchar(6) DEFAULT NULL,
  `studentLastName` varchar(50) DEFAULT NULL,
  `courseTakenID` int(11) DEFAULT NULL,
  `yearStanding` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  KEY `courseTakenID` (`courseTakenID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseTakenID`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Allan','D','Guzman',1,2),(2,'Bart','B','Boromeo',2,4),(3,'Charice','P','Pempengco',1,2),(4,'Danica','T','Te',2,2),(5,'Empoy','E','Adarna',1,5),(6,'Frank','F','Fernandez',2,4),(7,'Frank','F','Fernandez',3,1),(8,'Gilbert','G','Gomez',4,2),(9,'Hannah','H','Horandeza',3,3),(10,'Inigo','I','Indevida',4,4),(11,'Jason','J','Jipos',3,2),(12,'Zaldy','Z','Zerox',4,5);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectCode` varchar(6) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL,
  `courseOfClass` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `subjectCode` (`subjectCode`),
  KEY `profID` (`profID`),
  KEY `courseOfClass` (`courseOfClass`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`),
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`courseOfClass`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'PE4',1,1),(2,'NS201',2,2),(3,'IT332',3,1),(4,'MTH501',3,3),(5,'DES112',3,4),(6,'HIST69',3,1),(7,'ENG202',2,3),(8,'RECESS',1,3),(9,'DRAW10',2,2),(10,'FIL2A',3,2);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_professorlist`
--

DROP TABLE IF EXISTS `view_professorlist`;
/*!50001 DROP VIEW IF EXISTS `view_professorlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_professorlist` AS SELECT 
 1 AS `First Name`,
 1 AS `Middle Initial`,
 1 AS `Last Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'gradingsystem'
--
/*!50003 DROP FUNCTION IF EXISTS `getGrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getGrade`(`studID` INT, `subjID` INT) RETURNS varchar(1) CHARSET utf8
BEGIN
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
        RETURN 'X';
    END IF;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCourse`(
in inCourseName varchar(40),
in inMaxYears INTEGER
)
BEGIN	
		
    INSERT INTO course(courseName,courseMaxYears) VALUES (inCourseName,inMaxYears);		
    select "successful";
    




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addGrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGrade`(IN `studID` INTEGER, IN `subjID` INTEGER, IN `profID` INTEGER, IN `inGrade` DOUBLE)
BEGIN

	DECLARE result INTEGER;

    SELECT COUNT(`gradeID`) INTO result FROM gradesheet WHERE `studentID` = studID AND `subjectID` = subjID;

	

    IF (result = 0) THEN

		IF(inGrade >= 50 && inGrade <=100) THEN
			INSERT INTO `gradesheet`(`studentID`,`subjectID`,`profId`,`grade`) VALUES (studID,subjID,profId,inGrade);
			select "success";
		END IF;
        else select "unsuccessful";
	
	END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addProfessor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProfessor`(
in inFn varchar(50),
in inMi varchar(6),
in inLn varchar(50)
)
BEGIN	
	DECLARE result INTEGER;
	SELECT count(profID) FROM professor WHERE profFirstName LIKE "%inFn%" AND profMiddleInitial LIKE "%inMi%" AND profLastName LIKE "%inLn%";
    
    if (result = 0) THEN
		INSERT INTO professor(profFirstName,profMiddleInitial,profLastName) VALUES (inFn,inMi,inLn);
        select "success";
	else select "unsuccessful";
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudent`(IN `fn` VARCHAR(50), IN `mi` VARCHAR(6), IN `ln` VARCHAR(50), IN `inputCourseID` INTEGER, IN `inYear` INTEGER)
BEGIN

	DECLARE result INTEGER;

    

    SELECT `courseMaxYears` INTO result FROM `course` WHERE `courseID` = inputCourseID LIMIT 1;

    

    IF (result = 4 AND inYear <=4) THEN

		INSERT INTO student(`studentFirstName`,`studentMiddleInitial`,`studentLastName`,

        `courseTakenID`,`yearStanding`) VALUES

        (fn,mi,ln,inputCourseID,inYear);
        select "successful";

        

	elseif(result = 5 AND inYear <=5) THEN

		INSERT INTO student(`studentFirstName`,`studentMiddleInitial`,`studentLastName`,

        `courseTakenID`,`yearStanding`) VALUES

        (fn,mi,ln,inputCourseID,inYear); 
        select "successful";
	
    else select "unsuccessful";
    END IF;

    



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSubject`(
in inSubjectCode varchar(6),
in inProfId INTEGER,
in inCourseId INTEGER
)
BEGIN	

	INSERT INTO subject(`subjectCode`,`prodID`,`courseOfClass`) VALUES (inSubjectCode,inProfId,inCourseId);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_professorlist`
--

/*!50001 DROP VIEW IF EXISTS `view_professorlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_professorlist` AS (select `professor`.`profFirstName` AS `First Name`,`professor`.`profMiddleInitial` AS `Middle Initial`,`professor`.`profLastName` AS `Last Name` from `professor`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-15  1:06:58
