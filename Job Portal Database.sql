-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: Orson.ischool.wisc.edu    Database: user016_DB3
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Employer`
--

DROP TABLE IF EXISTS `Employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employer` (
  `EmployerID` int NOT NULL AUTO_INCREMENT,
  `Emp_CompanyName` varchar(255) NOT NULL,
  `Emp_CompanySize` enum('Small','Medium','Large') NOT NULL DEFAULT 'Medium',
  `Emp_CompanyPhone` varchar(20) DEFAULT NULL,
  `Emp_CompanyEmail` varchar(255) DEFAULT NULL,
  `Emp_Founded_year` int DEFAULT NULL,
  `Emp_IndustryID` int NOT NULL,
  PRIMARY KEY (`EmployerID`),
  KEY `Emp_IndustryID` (`Emp_IndustryID`),
  CONSTRAINT `Employer_ibfk_1` FOREIGN KEY (`Emp_IndustryID`) REFERENCES `Industry` (`IndustryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employer`
--

LOCK TABLES `Employer` WRITE;
/*!40000 ALTER TABLE `Employer` DISABLE KEYS */;
INSERT INTO `Employer` VALUES (1,'AutoTech','Large','678-234-5678','info@autotech.com',1988,1),(2,'MediCare','Medium','789-345-6789','contact@medicare.com',1995,2),(3,'GreenEnergy','Small','890-456-7890','support@greenenergy.com',2000,9),(4,'EduSmart','Large','901-567-8901','hello@edusmart.com',2012,4),(5,'TechInnovate','Large','912-678-3456','contact@techinnovate.com',2015,1),(6,'WellnessCare','Medium','823-456-7891','support@wellnesscare.com',2008,2),(7,'Tech Solutions','Large','111-222-3333','contact@techsolutions.com',2000,1),(8,'Global Health','Medium','222-333-4444','info@globalhealth.com',1998,2),(9,'FinanceCorp','Small','333-444-5555','support@financecorp.com',2010,3),(10,'EduPrime','Large','444-555-6666','hello@eduprime.com',2015,4),(11,'BuildMaster','Medium','555-666-7777','contact@buildmaster.com',1995,5),(12,'GreenTech','Medium','123-456-7890','contact@greentech.com',2005,9),(13,'LogiTrans','Large','234-567-8901','info@logitrans.com',2010,7),(14,'RealEstatePros','Small','345-678-9012','support@realestatepros.com',2018,8);
/*!40000 ALTER TABLE `Employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Industry`
--

DROP TABLE IF EXISTS `Industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Industry` (
  `IndustryID` int NOT NULL,
  `Ind_CategoryName` varchar(255) NOT NULL DEFAULT 'Other',
  PRIMARY KEY (`IndustryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Industry`
--

LOCK TABLES `Industry` WRITE;
/*!40000 ALTER TABLE `Industry` DISABLE KEYS */;
INSERT INTO `Industry` VALUES (1,'Technology'),(2,'Healthcare'),(3,'Finance'),(4,'Education'),(5,'Manufacturing'),(6,'Retail'),(7,'Transportation'),(8,'Real Estate'),(9,'Energy'),(10,'Entertainment'),(11,'Other');
/*!40000 ALTER TABLE `Industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobApplication`
--

DROP TABLE IF EXISTS `JobApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobApplication` (
  `JobApplicationID` int NOT NULL AUTO_INCREMENT,
  `JA_ApplicationDate` date NOT NULL,
  `JA_ApplicationStatus` enum('Pending','Accepted','Rejected','Interview Scheduled') NOT NULL DEFAULT 'Pending',
  `JA_JobSeekerID` int NOT NULL,
  `JA_JobPostingID` int NOT NULL,
  PRIMARY KEY (`JobApplicationID`),
  KEY `JA_JobSeekerID` (`JA_JobSeekerID`),
  KEY `JA_JobPostingID` (`JA_JobPostingID`),
  CONSTRAINT `JobApplication_ibfk_1` FOREIGN KEY (`JA_JobSeekerID`) REFERENCES `JobSeeker` (`JobSeekerID`),
  CONSTRAINT `JobApplication_ibfk_2` FOREIGN KEY (`JA_JobPostingID`) REFERENCES `JobPosting` (`JobPostingID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobApplication`
--

LOCK TABLES `JobApplication` WRITE;
/*!40000 ALTER TABLE `JobApplication` DISABLE KEYS */;
INSERT INTO `JobApplication` VALUES (1,'2024-03-19','Interview Scheduled',1,1),(2,'2024-01-15','Pending',2,2),(3,'2024-02-06','Accepted',3,3),(4,'2024-02-16','Accepted',4,5),(5,'2024-02-18','Rejected',5,4),(6,'2024-01-11','Pending',1,6),(7,'2024-01-30','Interview Scheduled',6,8),(8,'2024-02-14','Pending',5,10),(9,'2024-03-11','Pending',8,12),(10,'2024-03-02','Rejected',12,12);
/*!40000 ALTER TABLE `JobApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobPosting`
--

DROP TABLE IF EXISTS `JobPosting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobPosting` (
  `JobPostingID` int NOT NULL AUTO_INCREMENT,
  `JP_JobTitle` varchar(255) NOT NULL,
  `JP_JobDescription` text NOT NULL,
  `JP_PostDate` date NOT NULL,
  `JP_ExpirationDate` date DEFAULT NULL,
  `JP_Approximate_salary` decimal(10,2) DEFAULT NULL,
  `JP_RequiredQualifications` varchar(500) NOT NULL DEFAULT 'Not specified',
  `JP_WorkLocationID` int NOT NULL,
  `JP_EmployerID` int NOT NULL,
  PRIMARY KEY (`JobPostingID`),
  KEY `JP_WorkLocationID` (`JP_WorkLocationID`),
  KEY `JP_EmployerID` (`JP_EmployerID`),
  CONSTRAINT `JobPosting_ibfk_1` FOREIGN KEY (`JP_WorkLocationID`) REFERENCES `WorkLocation` (`WorkLocationID`),
  CONSTRAINT `JobPosting_ibfk_2` FOREIGN KEY (`JP_EmployerID`) REFERENCES `Employer` (`EmployerID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobPosting`
--

LOCK TABLES `JobPosting` WRITE;
/*!40000 ALTER TABLE `JobPosting` DISABLE KEYS */;
INSERT INTO `JobPosting` VALUES (14,'Data Scientist','Analyze data and build models.','2024-04-01','2024-07-01',110000.00,'Master in Data Science',3,1),(15,'Marketing Manager','Lead marketing campaigns.','2024-04-05','2024-07-10',87000.00,'MBA preferred',2,2),(16,'Cyber Security Analyst','Monitor and secure networks.','2024-04-10','2024-07-15',100000.00,'Cyber Security Certification',2,3),(17,'HR Specialist','Manage human resources tasks.','2024-04-12','2024-07-20',70000.00,'HR Degree Required',1,4),(18,'Software Developer','Develop and maintain applications.','2024-05-01','2024-08-01',90000.00,'Bachelor in CS',1,5),(19,'Medical Researcher','Conduct medical research studies.','2024-05-05','2024-08-05',77000.00,'PhD in Biology',1,6),(20,'Network Engineer','Maintain and improve network infrastructure.','2024-06-01','2024-09-01',100000.00,'CCNA Certification',3,7),(21,'Product Manager','Lead product development team.','2024-06-05','2024-09-10',95000.00,'MBA preferred',2,8),(22,'Network Engineer','Maintain and improve network infrastructure.','2024-06-01','2024-09-01',93000.00,'CCNA Certification',3,9),(23,'Product Manager','Lead product development team.','2024-06-05','2024-09-10',105000.00,'MBA preferred',3,10),(24,'Data Analyst','Analyze data trends and business performance.','2024-06-10','2024-09-15',87000.00,'SQL, Python skills required',2,11),(25,'Software Engineer','Develop web applications.','2024-06-12','2024-09-18',110000.00,'Bachelor in Computer Science',1,12),(26,'HR Specialist','Manage human resources tasks.','2023-04-12','2023-07-20',56000.00,'',2,1),(27,'HR Specialist','Manage human resources tasks.','2023-04-12','2023-07-20',60000.00,'',2,1);
/*!40000 ALTER TABLE `JobPosting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobSeeker`
--

DROP TABLE IF EXISTS `JobSeeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobSeeker` (
  `JobSeekerID` int NOT NULL AUTO_INCREMENT,
  `JS_FirstName` varchar(100) NOT NULL,
  `JS_LastName` varchar(100) NOT NULL,
  `JS_Phone` varchar(20) DEFAULT NULL,
  `JS_Email` varchar(255) NOT NULL,
  `JS_Age` int DEFAULT NULL,
  `JS_Active` tinyint(1) NOT NULL DEFAULT '1',
  `JS_ExpectedSalary` decimal(10,2) DEFAULT NULL,
  `JS_PreferredIndustryID` int DEFAULT NULL,
  `JS_PreferredLocationID` int DEFAULT NULL,
  PRIMARY KEY (`JobSeekerID`),
  KEY `JS_PreferredIndustryID` (`JS_PreferredIndustryID`),
  KEY `JS_PreferredLocationID` (`JS_PreferredLocationID`),
  CONSTRAINT `JobSeeker_ibfk_1` FOREIGN KEY (`JS_PreferredIndustryID`) REFERENCES `Industry` (`IndustryID`),
  CONSTRAINT `JobSeeker_ibfk_2` FOREIGN KEY (`JS_PreferredLocationID`) REFERENCES `WorkLocation` (`WorkLocationID`),
  CONSTRAINT `JobSeeker_chk_1` CHECK ((`JS_Age` between 18 and 75))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobSeeker`
--

LOCK TABLES `JobSeeker` WRITE;
/*!40000 ALTER TABLE `JobSeeker` DISABLE KEYS */;
INSERT INTO `JobSeeker` VALUES (1,'Alice','Brown','325-446-1946','alicebrown@gmail.com',29,1,110000.00,1,3),(2,'Bob','Johnson','442-515-8362','bobjohnson@gmail.com',35,1,90000.00,3,2),(3,'Emily','Clark','535-135-3764','emilyclark@gmail.com',27,1,105000.00,5,1),(4,'David','Williams','426-363-8822','davidwilliams@gmail.com',30,1,68000.00,7,1),(5,'Michael','Scott','777-814-9674','michaelscott@gmail.com',40,1,100000.00,9,1),(6,'Sara','Connor','954-339-1100','saraconnor@gmail.com',32,1,87000.00,2,3),(7,'Daniel','White','123-456-7107','danielwhite@gmail.com',36,1,95000.00,4,3),(8,'Jessica','Lee','456-623-5038','jessicalee@gmail.com',29,1,80000.00,6,2),(9,'Angel','Huang','666-2222-8890','angel87@gmail.com',26,1,170000.00,8,3),(10,'Daniel','White','999-888-7777','danielwhite@email.com',36,1,95000.00,10,1),(11,'Jessica','Lee','777-666-5555','jessicalee@email.com',29,0,90000.00,1,2),(12,'Ethan','Brown','666-555-4444','ethanbrown@email.com',28,1,105000.00,1,1),(13,'Olivia','Davis','555-444-3333','oliviadavis@email.com',31,0,90000.00,1,3);
/*!40000 ALTER TABLE `JobSeeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `View_Employers_With_Multiple_Jobs`
--

DROP TABLE IF EXISTS `View_Employers_With_Multiple_Jobs`;
/*!50001 DROP VIEW IF EXISTS `View_Employers_With_Multiple_Jobs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Employers_With_Multiple_Jobs` AS SELECT 
 1 AS `Emp_CompanyName`,
 1 AS `Job_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Healthcare_Employers`
--

DROP TABLE IF EXISTS `View_Healthcare_Employers`;
/*!50001 DROP VIEW IF EXISTS `View_Healthcare_Employers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Healthcare_Employers` AS SELECT 
 1 AS `Ind_CategoryName`,
 1 AS `Emp_CompanyName`,
 1 AS `Total_Jobs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Highest_Salary_Jobs`
--

DROP TABLE IF EXISTS `View_Highest_Salary_Jobs`;
/*!50001 DROP VIEW IF EXISTS `View_Highest_Salary_Jobs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Highest_Salary_Jobs` AS SELECT 
 1 AS `Emp_CompanyName`,
 1 AS `JobPostingID`,
 1 AS `JP_Approximate_salary`,
 1 AS `JP_JobTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Industry_JobSeeker_Count`
--

DROP TABLE IF EXISTS `View_Industry_JobSeeker_Count`;
/*!50001 DROP VIEW IF EXISTS `View_Industry_JobSeeker_Count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Industry_JobSeeker_Count` AS SELECT 
 1 AS `Ind_CategoryName`,
 1 AS `Total_JobSeekers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Interview_Scheduled`
--

DROP TABLE IF EXISTS `View_Interview_Scheduled`;
/*!50001 DROP VIEW IF EXISTS `View_Interview_Scheduled`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Interview_Scheduled` AS SELECT 
 1 AS `JS_FirstName`,
 1 AS `JS_LastName`,
 1 AS `JA_ApplicationStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Remote_Job_Employers`
--

DROP TABLE IF EXISTS `View_Remote_Job_Employers`;
/*!50001 DROP VIEW IF EXISTS `View_Remote_Job_Employers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Remote_Job_Employers` AS SELECT 
 1 AS `Emp_CompanyName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_Young_Tech_JobSeekers`
--

DROP TABLE IF EXISTS `View_Young_Tech_JobSeekers`;
/*!50001 DROP VIEW IF EXISTS `View_Young_Tech_JobSeekers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_Young_Tech_JobSeekers` AS SELECT 
 1 AS `JS_FirstName`,
 1 AS `JS_LastName`,
 1 AS `Total_Applicants`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `WorkLocation`
--

DROP TABLE IF EXISTS `WorkLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkLocation` (
  `WorkLocationID` int NOT NULL DEFAULT '2',
  `WL_Location` enum('Remote','On-site','Hybrid') NOT NULL DEFAULT 'On-site',
  PRIMARY KEY (`WorkLocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkLocation`
--

LOCK TABLES `WorkLocation` WRITE;
/*!40000 ALTER TABLE `WorkLocation` DISABLE KEYS */;
INSERT INTO `WorkLocation` VALUES (1,'Remote'),(2,'On-site'),(3,'Hybrid');
/*!40000 ALTER TABLE `WorkLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'user016_DB3'
--

--
-- Final view structure for view `View_Employers_With_Multiple_Jobs`
--

/*!50001 DROP VIEW IF EXISTS `View_Employers_With_Multiple_Jobs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Employers_With_Multiple_Jobs` AS select `E`.`Emp_CompanyName` AS `Emp_CompanyName`,count(`JP`.`JobPostingID`) AS `Job_Count` from (`Employer` `E` left join `JobPosting` `JP` on((`E`.`EmployerID` = `JP`.`JP_EmployerID`))) group by `E`.`Emp_CompanyName` having (count(`JP`.`JobPostingID`) > 1) order by `Job_Count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Healthcare_Employers`
--

/*!50001 DROP VIEW IF EXISTS `View_Healthcare_Employers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Healthcare_Employers` AS select `I`.`Ind_CategoryName` AS `Ind_CategoryName`,`E`.`Emp_CompanyName` AS `Emp_CompanyName`,count(`JP`.`JobPostingID`) AS `Total_Jobs` from ((`Industry` `I` join `Employer` `E` on((`I`.`IndustryID` = `E`.`Emp_IndustryID`))) join `JobPosting` `JP` on((`E`.`EmployerID` = `JP`.`JP_EmployerID`))) where (`I`.`Ind_CategoryName` = 'Healthcare') group by `E`.`Emp_CompanyName`,`I`.`Ind_CategoryName` order by `Total_Jobs` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Highest_Salary_Jobs`
--

/*!50001 DROP VIEW IF EXISTS `View_Highest_Salary_Jobs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Highest_Salary_Jobs` AS select `E`.`Emp_CompanyName` AS `Emp_CompanyName`,`JP`.`JobPostingID` AS `JobPostingID`,`JP`.`JP_Approximate_salary` AS `JP_Approximate_salary`,`JP`.`JP_JobTitle` AS `JP_JobTitle` from (`JobPosting` `JP` join `Employer` `E` on((`JP`.`JP_EmployerID` = `E`.`EmployerID`))) where (`JP`.`JP_Approximate_salary` = (select max(`JobPosting`.`JP_Approximate_salary`) from `JobPosting` where (`JobPosting`.`JP_Approximate_salary` is not null))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Industry_JobSeeker_Count`
--

/*!50001 DROP VIEW IF EXISTS `View_Industry_JobSeeker_Count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Industry_JobSeeker_Count` AS select `I`.`Ind_CategoryName` AS `Ind_CategoryName`,count(`JS`.`JobSeekerID`) AS `Total_JobSeekers` from (`JobSeeker` `JS` join `Industry` `I` on((`JS`.`JS_PreferredIndustryID` = `I`.`IndustryID`))) group by `I`.`Ind_CategoryName` having (count(`JS`.`JobSeekerID`) > 2) order by `Total_JobSeekers` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Interview_Scheduled`
--

/*!50001 DROP VIEW IF EXISTS `View_Interview_Scheduled`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Interview_Scheduled` AS select `JS`.`JS_FirstName` AS `JS_FirstName`,`JS`.`JS_LastName` AS `JS_LastName`,`JA`.`JA_ApplicationStatus` AS `JA_ApplicationStatus` from (`JobApplication` `JA` join `JobSeeker` `JS` on((`JA`.`JA_JobSeekerID` = `JS`.`JobSeekerID`))) where (`JA`.`JA_ApplicationStatus` = 'Interview Scheduled') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Remote_Job_Employers`
--

/*!50001 DROP VIEW IF EXISTS `View_Remote_Job_Employers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Remote_Job_Employers` AS select distinct `E`.`Emp_CompanyName` AS `Emp_CompanyName` from ((`JobPosting` `JP` join `Employer` `E` on((`JP`.`JP_EmployerID` = `E`.`EmployerID`))) join `WorkLocation` `WL` on((`JP`.`JP_WorkLocationID` = `WL`.`WorkLocationID`))) where (`WL`.`WL_Location` = 'Remote') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_Young_Tech_JobSeekers`
--

/*!50001 DROP VIEW IF EXISTS `View_Young_Tech_JobSeekers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user016`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_Young_Tech_JobSeekers` AS select `JS`.`JS_FirstName` AS `JS_FirstName`,`JS`.`JS_LastName` AS `JS_LastName`,count(`JS`.`JobSeekerID`) AS `Total_Applicants` from (`JobSeeker` `JS` join `Industry` `I` on((`JS`.`JS_PreferredIndustryID` = `I`.`IndustryID`))) where ((`I`.`Ind_CategoryName` = 'Technology') and (`JS`.`JS_Age` < 30)) group by `JS`.`JS_FirstName`,`JS`.`JS_LastName` */;
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

-- Dump completed on 2025-04-04 14:57:41
