-- MySQL dump 10.13  Distrib 5.5.20, for Win64 (x86)
--
-- Host: localhost    Database: collegemgmt
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `assignmentfolder`
--

DROP TABLE IF EXISTS `assignmentfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignmentfolder` (
  `userid` varchar(45) NOT NULL,
  `assignmentid` varchar(45) NOT NULL,
  `file` varchar(45) NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userid`,`assignmentid`) USING BTREE,
  KEY `fk21_idx` (`assignmentid`),
  CONSTRAINT `fk20` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk21` FOREIGN KEY (`assignmentid`) REFERENCES `assignmentnotice` (`assignmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentfolder`
--

LOCK TABLES `assignmentfolder` WRITE;
/*!40000 ALTER TABLE `assignmentfolder` DISABLE KEYS */;
INSERT INTO `assignmentfolder` VALUES ('ashu','1','DropdownCheckbox.rar',10,0),('stu2','2','college31.sql',NULL,0);
/*!40000 ALTER TABLE `assignmentfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentnotice`
--

DROP TABLE IF EXISTS `assignmentnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignmentnotice` (
  `assignmentid` varchar(45) NOT NULL,
  `assignmentname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `file` varchar(45) DEFAULT NULL,
  `maximarks` int(11) DEFAULT NULL,
  `dateofallotment` varchar(45) NOT NULL,
  `dateofsubmission` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`assignmentid`),
  KEY `fk18_idx` (`subjectid`),
  KEY `fk19_idx` (`classid`),
  CONSTRAINT `fk18` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk19` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentnotice`
--

LOCK TABLES `assignmentnotice` WRITE;
/*!40000 ALTER TABLE `assignmentnotice` DISABLE KEYS */;
INSERT INTO `assignmentnotice` VALUES ('1','abc','cs-101','class1','college31.sql',NULL,'Fri Nov 01 11:46:37 IST 2013',NULL,0,'aman'),('2','aa','cs-105','class2','.classpath',NULL,'Fri Nov 01 11:47:47 IST 2013',NULL,0,'aman');
/*!40000 ALTER TABLE `assignmentnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `lectid` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `lectsdelivered` int(11) DEFAULT NULL,
  PRIMARY KEY (`lectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('1','cs-101','class1','2009-08-07',NULL),('10','cs-102','class1','2005-02-04',NULL),('2','cs-101','class1','2008-07-06',NULL),('3','cs-101','class1','2001-02-04',NULL),('4','cs-101','class1','2005-03-02',NULL),('5','cs-101','class1','2005-02-04',NULL),('6','cs-101','class1','2005-02-04',NULL),('7','cs-101','class1','2005-02-04',NULL),('8','cs-101','class1','2005-02-04',NULL),('9','cs-101','class1','2005-02-04',NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchid` varchar(45) NOT NULL,
  `branchname` varchar(45) NOT NULL,
  PRIMARY KEY (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('cse-1','cse'),('mech-1','mech');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classattendance`
--

DROP TABLE IF EXISTS `classattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classattendance` (
  `lectid` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `attended` varchar(45) DEFAULT NULL,
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lectid`,`userid`) USING BTREE,
  KEY `fk25_idx` (`userid`),
  CONSTRAINT `fk25` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk26` FOREIGN KEY (`lectid`) REFERENCES `attendance` (`lectid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classattendance`
--

LOCK TABLES `classattendance` WRITE;
/*!40000 ALTER TABLE `classattendance` DISABLE KEYS */;
INSERT INTO `classattendance` VALUES ('1','aman','p',0),('1','ashu','a',1),('1','manik','p',0),('1','ram','a',0),('1','sham','a',0),('1','virdi','a',0),('10','aman','p',0),('10','manik','p',0),('10','virdi','p',0),('2','aman','p',0),('2','manik','p',0),('2','ram','a',0),('2','sham','p',0),('2','virdi','a',0),('3','aman','a',0),('3','ashu','p',1),('3','manik','a',0),('3','ram','p',0),('3','sham','a',0),('3','virdi','p',0),('4','aman','a',0),('4','manik','p',0),('4','ram','p',0),('4','sham','a',0),('4','virdi','p',0),('5','aman','a',0),('5','manik','a',0),('5','ram','a',0),('5','sham','p',0),('5','virdi','p',0);
/*!40000 ALTER TABLE `classattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `classid` varchar(45) NOT NULL,
  `classname` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`classid`),
  KEY `fk7_idx` (`branchid`),
  CONSTRAINT `fk7` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('class1','3rd','cse-1',1),('class2','5th','cse-1',1),('class3','7th-a','cse-1',1),('class4','7th-b','cse-1',1),('class5','3rd','mech-1',1);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerial`
--

DROP TABLE IF EXISTS `coursematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerial` (
  `materialid` varchar(45) NOT NULL,
  `materialname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `dateupload` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`materialid`),
  KEY `fk13_idx` (`subjectid`),
  KEY `fk14_idx` (`classid`),
  CONSTRAINT `fk13` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk14` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerial`
--

LOCK TABLES `coursematerial` WRITE;
/*!40000 ALTER TABLE `coursematerial` DISABLE KEYS */;
INSERT INTO `coursematerial` VALUES ('34','bn','cs-105','class2','Tue Oct 29 12:32:06 IST 2013','imag005.jpg',1,'aman'),('36','bn','cs-101','class1','Tue Oct 29 12:48:49 IST 2013','Arcadian Technocrats Presentation updated.ppt',1,'aman'),('aa','dd','cs-101','class1','Tue Oct 29 12:11:35 IST 2013','data model.PNG',1,'aman'),('m123','manik','cs-101','class1','Tue Oct 29 12:04:30 IST 2013','collegemgmt.sql',1,'aman'),('manik','manik','cs-101','class1','Tue Oct 29 11:48:18 IST 2013','pom.xml',1,'aman');
/*!40000 ALTER TABLE `coursematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradedomains`
--

DROP TABLE IF EXISTS `gradedomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradedomains` (
  `domainid` varchar(45) NOT NULL,
  `domainame` varchar(45) NOT NULL,
  `maximarks` varchar(45) NOT NULL,
  PRIMARY KEY (`domainid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradedomains`
--

LOCK TABLES `gradedomains` WRITE;
/*!40000 ALTER TABLE `gradedomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradedomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouppermissions`
--

DROP TABLE IF EXISTS `grouppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouppermissions` (
  `groupid` varchar(45) NOT NULL,
  `permissionid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`,`permissionid`),
  KEY `fk4_idx` (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouppermissions`
--

LOCK TABLES `grouppermissions` WRITE;
/*!40000 ALTER TABLE `grouppermissions` DISABLE KEYS */;
INSERT INTO `grouppermissions` VALUES ('1001','1',1),('1001','2',1),('1001','3',1),('1001','8',1),('1002','101',1),('1002','102',1),('1002','103',1),('1002','104',1),('1002','105',1),('1002','106',1),('1002','12',1),('1002','13',1),('1002','16',1),('1002','2',1),('1002','21',1),('1002','23',1),('1002','24',1),('1002','28',1),('1002','3',1),('1002','4',1),('1002','5',1),('1002','8',1),('1003','10',1),('1003','101',1),('1003','102',1),('1003','106',1),('1003','11',1),('1003','12',1),('1003','13',1),('1003','15',1),('1003','16',1),('1003','18',1),('1003','19',1),('1003','20',1),('1003','21',1),('1003','24',1),('1003','25',1),('1003','26',1),('1003','31',1),('1003','8',1),('1003','9',1),('1004','106',1),('1004','108',1),('1004','12',1),('1004','14',1),('1004','17',1),('1004','22',1),('1004','27',1),('1004','29',1),('1004','30',1),('1004','6',1),('1004','7',1),('1004','8',1);
/*!40000 ALTER TABLE `grouppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` varchar(45) NOT NULL,
  `groupname` varchar(45) NOT NULL,
  `groupdesc` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('1001','admin','adds hod and teachers in user table',1),('1002','hod','adds student in user table and user groups automatically gets updated',1),('1003','lecturer','performs certain upload functions',1),('1004','student','end user of the product',1),('2001','cse','department of cse',1),('2002','mech','department of mech',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `lectureid` varchar(45) NOT NULL,
  `lecturename` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `file` longblob NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`lectureid`),
  KEY `fk15_idx` (`subjectid`),
  KEY `fk16_idx` (`classid`),
  CONSTRAINT `fk15` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk16` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES ('1','ca','cs-101','class1',NULL,'data.sql',1,'aman');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailing`
--

DROP TABLE IF EXISTS `mailing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailing` (
  `messageid` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `sender` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `fk27_idx` (`receiver`),
  KEY `fk28_idx` (`sender`),
  CONSTRAINT `fk27` FOREIGN KEY (`receiver`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk28` FOREIGN KEY (`sender`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailing`
--

LOCK TABLES `mailing` WRITE;
/*!40000 ALTER TABLE `mailing` DISABLE KEYS */;
INSERT INTO `mailing` VALUES ('','aman','                                 dscdc           ','00:00:09','2005-04-03',1,'aman','sdcvdws'),('1','aman','hello hello mic check hello','00:00:09','2005-10-12',0,'aman','hi');
/*!40000 ALTER TABLE `mailing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `permissionid` varchar(45) NOT NULL,
  `permissionname` varchar(45) NOT NULL,
  `permissiondesc` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `pic` blob,
  `servletname` varchar(45) NOT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('1','add user','create new user',1,'','AddUser'),('101','course content','course content',1,'\0JFIF\0\0`\0`\0\0\0C\0      	\r\n	\n  \n\r\n\n\r\n\r\n\r\n\r\n\r\n 	\r\r\n\r\n\r\n\r\n\r\n\0C\r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\0\0P\0P\"\0\0\0\0\0\0\0\0\0\0\0\0 	\n\r\n\0\0\0\0}\0!1AQa \"q2#BR$3br	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\0\0\0\0\0\0\0 	\n\r\n\0\0 \0w\0!1AQ aq\"2B	#3Rbr\n$4%\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\r\n\0\0?\0(\0PN>lvOz<;nn\r\nۆ;aNBYv*\Z;(,MF*RI6ݒ0?kxk}2	A-w!\"+Khdφ8$*<\Z;˿V߃?vk\rĂ84ۭ,zVx$cȒ?l#\0P_xWH$+f̲%MUe\'`*n\0b悚hSEcA:L\r<v=T|>WjM&&ն]Ƴo19|#:Qѷ{Mm?[m\0 <^ Ge\\%\0	+d,:ŀYI#c1Wbjԝԗ\0qg1PNpoz=ĝŤ-m,Y1/5 q^T(IYIN&QE5VdIG\'CUյ\r\n+Ke`5/$*F\r\n31\0\0I8)\nAyg׍\'Fcl,-pY$)U\0\0d]O?	|9yk~ƺNa_ĩ(?pɮGZ/u?9O;Fшy\r\nX\Z?Y+?/lL\0y?|۹?M\0ؤgaĶ{mЭ&Ao\\/Q\0,ھ	POҭv+Jvt\0ZmHk.˱g\r\nBWգN\0u6H%ojw\\ֽEmk4Amon,M\"(,̀\0$@\0x<<\'us*`cJ7>$Z|?nu]ZYO(̳#(as$Hh(@Z|\0w26zj!#IG2D$+25~?\r\n{?:>\ZK?ّBP겣rM27Co#$\Z}{w?o)	H#ljWQ\0]ᬮXh{z[/-:b8\'_pO@]=jD\r?X˃Ý\Z@E?q3ew~\0\0Fg5x/g-#S6I:k\n<~Y7ʒ\\<$vsa\'7,Tg ot-Rه,=~ib\n)Uzݿ]y\\&Ƃ|%~}\0Z\0ei~:7-[p|u=NQ[.c\nO``v(Ury x\'KQK\r G}mPH/+gF\0nK6 `\0\0 u\Z-_q$(%N\r_ݞav#p@upT-@L\0={pb\r\nWNS8G[=h3r\0IYk	_\r\n^iq&\r\n\0\0|̂vEqY?!/5ys.<G[64\r\n\'n\0yf: ~/;xO\r\n\Z$Qr{V9P_Uo{tO0_HGߢ2/DӾ\n\rk.dNӭS̺`ğ$2rd\r\nV6\0z<[,\0|\\\"V)\r\ntI[ `l6GL(e9|wksm\Z\nk\"mJd?v6!\r[A}\05A\0W%o\rbj,]M\"[v^m~m+Zok$_C=gnQp\rOgi|t~_ڽ/j5+,g==3_@\0\0l\0.{\\7=\"AB0.`b9Vtto2xCO>6}dq\Zq%擟23C\Z^|ڒu%FVk7kg饷u$*nwWtn<߱GƯW\r\n}T=3:|PƎz/08Qn\rxڸ&%n~_U|\0)&h׷@g: 9`d>4oQxMo[ImmobVx$le]{7\r\nyjpPŻw9,-:&m9o61@_UtxnPw$xi T\r\n^\\m\r\nh|](Mg6qqşuX0ǌK<Gk\0[q\0W?\0&Mmmy\"6<DlH\rB diHS&bx\r\n\r\n;oK5]xw\r\nc^-Si>_\r\np3_]#^z_jגs5@\"\"hg|EXτ\r\ndߋ5H[\0~GD$1^\0>\"\'?	i<KumfbQbJrI$`G\'6zg4GK[;XAj0I$NI$kIP^owIWӲױIP4}\0\r\nzoN \\\r\nER:R2Fihi%g_siٗ\r3UpSÁiG+ּ;^aE~ȐIkǿZvdk#s,D+lh# \Z(ueRӇit{tyS\'=}Wj\0drk6r.~h\r\n|ȧrs/omFB燼1koxű%d[gq+\r\n0TbG¿\rj)Ğ[o.f-~\r\n$7#t\0kg5\\j:w,5+xaM-b1uU2ǐ1Ǫx5t5wviu]ig~?lgAu&oVXsjv\\Q<Q8A]WVMԨޭ\Z0NZ$QEfj','CourseContent'),('102','lectures','lectures',1,'\0JFIF\0\0d\0d\0\0\0C\0      	\r\n	\n  \n\r\n\n\r\n\r\n\r\n\r\n\r\n 	\r\r\n\r\n\r\n\r\n\r\n\0C\r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\0\0P\0P\"\0\0\0\0\0\0\0\0\0\0\0\0 	\n\r\n\0\0\0\0}\0!1AQa \"q2#BR$3br	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\0\0\0\0\0\0\0 	\n\r\n\0\0 \0w\0!1AQ aq\"2B	#3Rbr\n$4%\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\r\n\0\0?\0U6weD@Y\0 s\\4ߵ;yZ9>\"x9ᕵ@T2l\0FiU-n5<c`ܞ7̖/I#C૞+éVeTKw=7*Qn6N\0zm\0\rO7\0\0\Z-?~ۗi ^M8~?GM?U_\'43\0[S\0??o?h_ڷ6\0	>\"xMC=F,ufc]Dm/9\'#Cg<;\0	>\"h+hmhuI3c Jr\0\0>\07K\0\r\0E<d1^%n^}Ge>88C\ro//\0a\0Ey\0\0\Zc\r\nO9_z?\0\0|(\0%W\r\r\n\0[xS\0??|d|E!,p\02%vnmi]AukrXfđʄd29W?n;\r_ݓ\05S\0ék.mxZNiLiyޜJ\0c\r\n=zt\n**jW_3:ues4N-h\08\0BǨt=\0_)尸i\'|6\0~DPzfh*cG\0Ig;08;]b? H\0`Q߲Z959JNO	y&rQm\0`Q/E\ZYP?<ҿ\\,~}#X.p؟\n??:\\%B3ʰ$Um$Z<ʙ\"qi\r\nh#\0/<	p<$W\0!A_Br>S__IA>#TUPP\0?>9Us57{R_gE93ҿ\Z\n0~\0Ie⋅ O\r\n\0\ZkMS|hC:cs\0+lMʶDڎVETnr|twsKDa\'\0JH\rjs\r\nuoj\nv%;+Z؈ql˲ʴp+A{$^��5U\r\n2# zEgq\"\"u<mn\r\np\0����֯hu.)܀F2}x5\r\nu{Sʣ\n-+/VN;σ\r\nL89nkB{o\r\nrqo*5\0\r\nLSrMiAJjqueߴگՏ&%O/UH/$(ݏ/ʿ$RÂ\\=S	AO	vT7@k\0+)A\ZS[4r[҇Ϋ\n*%BV\'٘Y]\r\n<YM^Vsjv|5Â h_\r0NVn\\K<؂3AV\r\n8*E|\')[|@K` uR}+iT̲e|F\ZN\\8qe\\CR*:rk+ߧ߂\nEZlm-uD7;E\r\nw2 9>\"ǧ27&\r\nWj[Xbc>?ލr:]ti3u9u%൹Yy]NHl\r\npX>PeO|H-5Bx~x`7WVrc9!9*cF\Z.GIԣeˤNY,\Z~GxJm\'?M>=:sՍ2VFZB\r _Z0c˿KQӴinVwz[)y1\"2xM]BÐM!ȸm/\'9ƙ+G\ru$k&<wn}7??G.MުW\"fۜ\'C\\ԗ\Z3;\'Jm|I\'_t5[o5Ž4)#Ms\ryVo^~Ӧ`k8kRHb*#YH|kӭ=L:S˛˯\n~\rdi:c{}>G6dP} [g,O\0rk	g}a?闖&	ܪZ+ER:C^\0F_:i	p?e\r\n~Z=\Z6Rd\r\nJl**H,I5X3TMi.fݭm[x_(WJTu*I;\0j+&\0gn sbĐ%Ǥ`Wv\0d~ď\r\nxQ\nIɩμ2@}>Њ	|6|?q$^]_,}mcs\'~__O|Q	jV:\0On|T	Rl7FW<d~54[=3O^ma@ E(TQ@¾O)֩1ⶍW[]_/ƽ(`hI>{aL3~^-Aծ49WmM\"I-cw^KxP~\r\n]USAv֦EE>\nm0xO\0+k^\"S\0 \"iiyM+d#ϙw\Zc2L8q/~eԌ>2ryKrV{{mn9g\rj:Fm$E(\"%e\0fBmLķפ9v{+$uE\r\n\"3J]c)c?_~\0~)I j^#Xĕ\r\nPUNXH̧%iƖ\'\r)Ӗ]VCT^IFk?%/Mm5	뉭Q*-|$v8ugRi\ZoԪ8ZK*VQh','Lectures'),('103','attendance','attendance as teacher',1,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0\0\0\0sRGB\0\0\0\0gAMA\0\0\r\na\0\0\0	pHYs\0\0\0\0+\0\0\0bKGD\0\0\0\0\0\0C\0\0\0	vpAg\0\0\0\0\0@@\0\0\0%tEXtcreate-date\02009-09-28T11:27:59-04:00+\\\0\0\0%tEXtmodify-date\02009-05-29T10:46:34-04:00G<\0\0\0tEXtSoftware\0Adobe ImageReadyqe<\0\0#`IDATx^|	|]ekn=MӦF)*(\"U@~ (8\"|*# PߠhGJ)mitO6͞s{Ӧ$Qs\0?oDVT\0{wcѼ]ڐ!N|\\IS7cAfq^\0oq8\0~K	/ng6v0d\0iw;QZ`F#\r%L\'9\r\noP \0|߮8+\0e\0V3:<\0ۖǑÒ]\0	Hpۣ~?\r\nO>!TT:a#Xa#`6+:-q7v>\r\nm\0+Nv;\Z;cNwȩ[kǣ?w J0P]SɌ	dڌ~;q+Yy\0e4\0ZkmVjV4NC)\rg_*b?a[aQ\r\nNBm vL-\\\"L:\r\nu?|\rsw C_@Ar˂8)+\"M&s<ykq&;3RN(4K001 rSl4\r\nPQPGq_9cB;bAm\r\nŮ4\\d[%#1!4#I\\`9VxSdebq \0p\nHaw1D*L3`]poQwҸOvR$ԺT\0K/N`^uE0<ٕq4$PIНA#K;#\nC?f(U(\"qYYX|ڈ\0}NnzTm;>\r\n?Cb+Q. cTggt~\'`ut2Pm$iq{niwmfD7?Vc:C; 	\r\nYעm`y\09ª!:*ü>jy\0qu;݈vP\0[m;a; w3{\r\nHfr\ZeL@Cq.fW\\i\0[iE(O]L <p^Dz`r(1ʦHoJjSVeI=&\",C_40{HF4Lϋ;3diIR]FQp}۴E\0-L(Zڎ8@\0n\'\\O_:*\\~U8K\'c`%ppy\r\nMˮU^9O #}ƼSyC(\r\nt#G\0YP0Rqn\r\r\n ygcZu#\n=x.\r\n=-&`KpPWZ8u.|6J|E8e\'O]{<II;w8x\0T`RLtOEºS#Nt۔a_h)*\r\nxo>l3cc1\r\nm>;;JNkJ;물���� [;C8W)=4\0Z99>DZ)ou:aB9\nDZKJW:c\\Թ(A	mBHpFQW(8@\rH\Z.t_@˴c∿\"\rˇ8Y9:2JPi^s+4ƎgD/b9(-Pc%R@d](9{\\~g6gi#8@eh,1%����ͦ\"FKkMX	j\r\nA2)MgF+iQ	hY=J}d&NJC{~59@~R[Vqt*i.2=H~XQر)Bՙ<]DէŊ\r\n&cVgyOD\\=䙌L̞<gom\r\nf*4^pcWO\r\n~E}¦R\0\'\\DIsJ4P7X2<J\neibaF)8AD\r\n=Єh(X8/ʘ\'U0)X_Z}]J)hFy+,s1QU{\Zlқ\\u\0QA^`9c7bYRP\'C>9Ga){ԼLǞsɘ\'euzx%ުAyo=D6@t\\H<FP5ôksH\038	^*-`Q3T\Z`\0^|\\&䫡\rHo(@KW#MBAHpUjnX3	0<v	H\0%\re [ƢRXBIOTW1о_i$6MCuZq\\h&mP̨6qK&(Z;a)\r\nAp\"Z3J,\Z&p,&F$ H7;syH~L-koilShZ\\K{Տg_:,ߐS5s!8\ZDB?ƴbaLYI̘?*1!K3̧A*BZVacRXDu}uSQ{:/s)%\'?F8P=&d2 >)F|.QQ?EuD,v^h\rpr,Rn|M|AQef-@w_\0m=a_GvΊzl݃> 9S.%\r-{)qI3tR&Hˢ-x֜xГ[+:M?Y߮Y?+ku{O\ZlA+i\"2PRh͸n3U&Ę.#FԪ5p[zU\r\n3&(1IuSJ4dV\0&tO`dOVR砧}3V*G(}8lfkxjjl6bc\n\"x\'Tu*	aefW0P*(U0j<a6͡QtNU=a/N\Zgew06SOԄW{fO	`z|X{-atviS\0\0+\Zf[^P4i\Z\"Mu1x^7h,E@O\nfA\0EDbq C !ǈ&EEG>7v5+gM¡\r\nC\'i9g#p<TC)qn`vW/ЯՎ	5C!k����<w_(F8K )P<h_%&7N퍿n§~#F[8wL1(ߤLK^mqm0\0i#Jѡ y6+%[1@1A360ƣB?B6&$̟s3uOE|bA\05d,3ڊKo $Z&,M^LԢ$\\z%:UHM4#b\nYb\09BC7flhǭym <683I?FD>%oJֳo5Ei~g%\Z߯f;>vM%I\r\ni^\nх%E\nk &? P`@(VĐ\Zm| Obnco\"n|@ ]4K`IPq9Pd69{[As;r[:6aî$hy]\r\n0{ʸ\'	bR$mX\Z{@ommWI\rdGFd(s{^v?-*p*>k(2g\"?U](& dEzS.\nzc̽LFE[e$bcl:L^Ubt`7Bf۲M[Zp!Kw!A???/^ڽw41x N\')(v鑚xg||\'+*#J[U09o/{[h\r\n,\r\nLD$e\ZfF;Y4 QVCCe!&{P]D炓 ;1i1}\ZiU[DN\"[v5\0& #eDT/N\\{\'\n!\0酌?eYϼ0+HjB\r\nƙ1ܺw\r\nx[E;:бc K*uZ=g\0\n| SN6nmGgŉKC!|)/aЁebgs+nZ_,@i	v??m؇{\0z9Pa2na\r\n=0ҢjladŃYFW.Zto\r\n {Ȋj\\/.{:cѩg2Q].~uب$;n3\Z\r\nS\rPKt)Nbw\'qw~q\0\"v;}3f}ţ1ƶ46S]f\Z.C:t塲1#D0eמgQë\"#8`E+nGfGIY2\n@͏<\nCE1ɘ2\r\n \r\nߟt\nzʦJҸCL$L=z3]#8`I1:72rҌ1Fho1\\{=<鍠f@T~fwxP+E{,?<,cWf@1ACXpP0k)\'^TW\'<] wSfe\"xp?X^{\r\n*YfrJ)rdWa~ڎ]Aq\r\ncl\nAU\')Ps]Ԟ]8G-xT.G}nW9g33\"(IpOb+.Y1Ml	4r5D13ڝߛ\rߺ_.tbc#Q}\0\r\nrx2kP3eg$]-TI/L-$i\"*:)sŷ\r\n9ATPyΨ\0QSX/u\'qj`vMD?CZZ2?r>Zxm^`/8?qtjھ}z(zXeZkniAc_iX;lyf)KP.\"[T#j!R@`t��(Fy\n+7|\0R6@sƯżchz<o8%Be~=CkBV\r\n b}3ڵvd&qVu\"̲p_\'\nhz}A}M{ha#v囹deLKQ\r\nh1du6=$ ;wB0	/6\ZmHx\nv|	aH- %<皮0Fd;qMcBňXVs}=m\Z*+p׊Fy \"s7W_:,?~[PmNfNUrl2əP}	t86BTxQVwv+n]P\\|yJFEA3쑭[\"KU>:[׌Gt\'ҼWӞ=%HXP}\'vH1k7}tx\0a)7\njRqPh7jҫ|m]83p\'\"Br]+$۶ώ;#賙of2L\nε\n:RR,5*眗\r\nU\"\0GХu\"\r\n]6le\0Yjс$;Zcdl\n,HyC&8YmTiW_bJ@Sڨpa6|ň\09]5r?@ghȍ\r\nUYqM\0 #@M6}#Q]w\\g	%C5;ny]%\nbv3ֽ!Sq}>o+ԧNEevnI+*\Zvt]#\nRSsSiSmB\r\n\"a:Y\r\n+WRDc㐠6w@ߓa_&\0NjG9)0K	\'tz۰}~*O7BVpqf^\r?j\ra,Hi;DTjBjێ&\n<\nlCSg]s>5o[e5xaő!-k$JU6[0ei\"exo_\'w1d.d6&6H7PtT8\nsV[ʶmVk:Iեc\0QHL=\r\n1lIO|\r\n||p\'7+fJ9jPPaʕկRIE^X+s\'WxW-@wøK\"+rN?ccdu>Yș\r\nTdS4lMnBoI(C:\"nN,xV5aLRЩP4ɗ~,gb%^xJm59\\(SIpju̓\n?]$I+\r\n{QB^%ړ )5chcj_Q\"M\r\n{Xr}8ڄuV=; _i\0RdaK*O2%Ð<HoO.v(tY<\\^ר^dvq\r\nMט	^sWX?nJ&9Ta#\r`r&Vo56mu\\wQ>+# P=\"!\ZB0.~?=t\r\n5ð\"[+炱CbH*qM\'N	ЊM~Ȓkڙg-28Tz8G\\T\'3<5rETϢs R2lV2f\'@x&8&ԅȮu[W2!}&ir\'l)+vNVRIF-x\0/7(l,r)K!	YjZ\n\0W{kpntx6Мښ4i)u\nrt+HkP\\AEZ}M?]$IEw& ȮX#ay=\n|w\"\n\n(`F;VF4d ^q*8Hj}jh,.@\ra/I2mFM\'YP4	Yg١-\"Ȓ[Q~}^\r\nHt#\0z?~Sj|6ڄ?&㺢3-gOypTⓇ\0xcʞQ4_x)\\@R[R/]qݔleBMb6,J6	ӝSܐ׬tJGMMfа8_z\"ξi\\čVanAߒЖ\'fV}XeKC\"xYqqU|QP1T\0?}\"(g>rq`igC#)Mt2$\ZUUEkENnU!)W)IYP݇sfDNe?G^)b͋_xଲ\r\nGɉb +@\'3NrJ5Ж22\npRK˴嗖lD?rh	oY\r\n\')&(\r\njk8l|,H}êep~P{Xһ?\\ϯ-nO\Z߸V/~鞣6NY~|cQX\\ZxJ{w7D}\\*U3m\\l	s\Z\'˼/3dx\Z[l,;1p\Z	p#UԥhznY	~rV?Yq)8kv5ӞiJ\r\ng%p(b%IBU$44LA3\"EH.rY\r\n~`aZ__݇:q\Z9F6df_eZ\r\ng|rE\r\nkmŔ|\\[92\r\nt1Hlm,-_(r\'QXI3%mV0ci2vH}.(g=ZcFhbIy\"طo:[jA SRiibɫ!r)}7n=2dic/hNg]Bu+؀CU*.E Ox}ӱλ1i)L\0T*Xz݁X\r\nDX~<LcJaj4ub1*vG\' P&KWW0\\֪um*PbO	n;s2{ܤ+Ar\ZZ1sqܒeg2-aydˮ__XxcPA:\'OFa!_e6F\Z1M㶗9;Xےe8ݗ\rt|WU{fˉ:= A*`\r\nM?X\r\n0ݮdLdY\rI9zX<tx.`*)\ZPSShm\0\Z J,-ĺvd\'k\r i/*,HM6xQ`J\n3Wm8ⶽHf! U,nÑk!¤zqY\r\n(ק,dJKќHõqؐ\"\r\nnnnokŋmǺ:i/ȱ\" ,鶰\"AL	qqCngչsIѮ	z\\Zcxqis8EQ]uu5Չr<RW\0\rj E6\n]0فݍ7dYFRe\0dWl;\ZIhVr\r\nu[Vb}tl85@Q~JΊ*!{[;fVė^TTT*))w\0sWK(J䣰v)zqAuk\r\n׃NN({$X*ʴzqNL)qnL96Jg|\\4R1d|+qb~c9N7\Z延KQRR\'IOrBem1odLX}rBKl¼;/X\0\'sB%o.*ug)~bZP.9PSE]8[}Em\rMJ岷P\0\Za}`<FX+,qK+em]CP\"Z]Hhxqn(*8IMA.A1\0q@}޿	l\r\n!\\U]J<veEuWߚ&R,[`ԋ)1Q\Z7܆MX\'e@\r\n{F*\Z[ܾr@\0\0\0\0IENDB`','ViewClassAttendance'),('104','assignments','assignments',1,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0\0\0\0sRGB\0\0\0\0gAMA\0\0\r\na\0\0\0	pHYs\0\0\0\0+\0\0#IDATx^\\{wu>}{vqbNB$N hD\"!	@TUV_T只(UUmZ*j	@hT\"!	<k]{~w73^M£bV;{}ss~gnE~\\2K> *c&5[ؖ pA\0A	gɖ%vfUP24\03S6I\0!Voe$HK&+i5NKCr]7!K4 @\0KMiI[x\r )\"9SNہm\r\npuٍp<7`Y\0!J\rhq\n1 W+&m1ѼNm!dl\r\n`פŇUjɔZ|1=Vp}	\0=wq|/@{~\0&eANas\Z\0A;%,_)l^\Z9)r+If9iV z6\r\nǿJJu m|ԔLk.篃خ3dsYO 82\Zs5kv\r\n>0\r@*5)\Z:Zà\r\nav	eiJ]\Z曇,gvCK9\0`	t%X<5@Š<U&crYg㋀s>}[8$`sud/ZF\0bK0&q>\\C\\- \ZCo\n\0> f|мW\0-wa\007L )\"9gv\0\r\n\0%\r2K`Q+T`DiAbA.GxqWu>`iwhYjeOyaSJD+\"ߗ\\~\0b%mb\0&UD2nkkOuoX&֚f{,hF⏀V%D M!%KUTu`3@\r{f\0\",*Xx7\01fg3[e)\nWXVu0)ME#ҕϕ	X鿭DS0?TNZIe ΫGmz\Z}:a9ϝLV*Xb@hdgjz% Q IQ:_Mi43P_<uV6\rI3^y0FE5\'_\Zآ+}LsgE	\n5VDcZ_v	ɍ$BF6I?/x% x<Yo/ș`TN Ge<8 d:sRZHJ\"BY&pCn0<1e<ϥ\r\n1f9@FS!X)  +c7no9w\\c{<_].0a\0q(Go^ԓ	uLÃ2*S2.3.aT*\n\nE3G>/wݍ8ҿ\Z~Ė_h/vH/\\t4FnJ\0zQ|hH:;!{NJ.[R\r\r\nB`\"\rF`9{\n \'3#r<\'g2c2?%p.׷d|bҬJe).m` \Z)	) c	\nãK\r\nӤ\\(l+|S>(a7 ;\\:7*8pql\r hf`@u&A76\0|4+\rHZ8/ї$\r\nxmiƤ4K}f\\z LJ����D\r\n4X\\A.PRgp\0כ5SVA\\!l?S}YZ}z )3&^yRoȖvRVJНp2\rie\"cpSIFG{(*Q20\ZM04Y.п9,a	f@l^\r\nFYF[gY+\0:}l`0atV\0Ni!\r\n6f\'K;!IT;(AY\r\nObH!D]\Z}ZG9\nfـdT\rҋ:t%n\"֐n\r\n\r\n=Qry驗=rrzjLL\r\nJ\ZIgG	\0{q=Kd\r\n$\nʹ9HyajUO#C\0xC2\0L4Cag\r\n;\r\nyn}\"vH8<}tȡ%{GuzL,gi^0-c͕YzS摆6dߗ΍wHߓ,][?.38CN\Z\0tQ\0 ,f⒨}$޼U``jC	@A0WZ\01OsNY\n`%NY\r\nZa$W\'T3\Zp4Bkl-CrQ9{z[\rY;cjn\r\nd b~e~Y玲OAs+,CvC\Znx-Hm~I4F4P|8	=4`5a˻fggb\\n7`96>.\0AP土(c\r\n \r\nڙ$6p\Z]0I\rfjuk]L>) _wds/L\0Y}i\Z) ?1\r\n_G _}k\0g$(΍>iXzرCo.}&ܰW{~frA\09V\'|MI@m.رS<AkPlyz~֙<YX8!criOȁQcaJdy\r\nJXzxCUo,rÐP6\r˶ˇvB>mZ\r\nQ-لLЬR>\r$LMd^8��zQ	`0w\\\Z䙞1tX0YԺ!,img! \n\0S4&ឃMM4\"|U*,\Zx \n\\jbjL3tM|l:I	Z͐W\\IWLMS 	=ff˕@Z ү BVF\',=ɫ<,gTke8 R,I춁)pfqYWc漏=MPGU ۈX*W-Ȑ?*<#߾+}9r[匒-M	Y5!pS|}k9_-q,Z44#[k̞Tb*&8GᬙG.YLcR\ZL[C&x\0g-s}~%@g%?\\ViCQ0 ao8nPL/. bz$9SA_:x]Z+lz1Zfz;ָ*LHy\"fi1V(4٩JKyLY\r\n-_]@N@<g55|IPV|! \"8sĊ	^K&LNrl\'| M&hlq~-Ԍ1Exx3&eNʄuʘW*E@se-P/05ATۘSHLGP6W\\u1\r\n0<e`l1t#N*@ \" $3NP\r\nyNa>^+S\r\n>\0 gۜX_؏DTLȸX8m\0@[LI50q\0[6¢ [Z|qV7e3}N`UL7ao&dP>3(ālb\0F0&\r\nߥ6\'%ᅜM幪RjpfB tQ?,AQG}6^㢁3\r\n̏m5ah6\r\n<T\n>>0 Z*p.ڄuB:.\rDddu=#{`8ahh:&ln\nqTw5F3aMF\r\n Z&Xe&ch`<r^dԄ	`ӮHQ\0Ui@$IiKF|2\"}5#lTG\rU攁6[\0YyÃ~BʁA\0xqb#@S,ZGe`q.K0Ế[E711!I 0\\\0نVP0@c\0TjBVZnN#0dEtN3o2BkΊ\r+v!sƌLd \0\"	޵]o:|g \nT悡 \r\nṁsK` [\"T¸}& \\ZkG_+0Ke+Wdm\ne=bf섴g$\"sYY`㢰\nqvFņY\"&NB܀R\0%%4@?Wc\\P΁.@/ϐρx=hlis\01=6\0\\Jx0=i=:UDb!9ץAwqFd%0o\ZR\ZoNSO?-?<?(t2RϰT0p>0\r\n_?⁳h϶[,](|Qz\r\nU^Y^B[_>04] \r\nr;$&jzs~2ߧrP\'?DJC6\rHGM\0hQRYJ\r\nsU#+:\r\n-mޓmWpZ3V3\ruYcE`d+) ,<әh(Z\Z2:[Ee!6;gl6BYdg}_:?);95q\r\n{\0	@_H:Lv\r\nNR$U|~ \0K1p-p1\\@07>F1A$i*i5`f)Hv2Ѽ^\nbvL\"ۮ\r\nx>d\r^(y\'1_&9h+5\'\"+H )p۫11`B77%9A(f5(jNO\r\n@[D?7mFjNҞÄҁ\'>.Jֿ//lVq5+N5&?PL·hk*-@o\",9\0n@\045#S[Ёv~\n\r\n6`=D ߝk9fd]Y+@kAbQ}n;fg*:s̋hqU \'Wb)o]. @X4>\0\n\r\nFE@lÌY d>\rJ4fVFGBopZ\"Њ>&%jI=0)[Y&sZHTiC1NL;Ѯ~ӜZKXe\0\"yD\0q^~N/·Xif?HRԙuYҚ\\Kf)  )|oK<(N&ٍTf^=\r\nSIOE{FD?r4(+&@2nsΙ=c0U,u, &Lv?vـ@-%BriꁉA`tfpZ  <\0¢hu$h<\'h-3s.\n4T7yNcbnd*i-7(5ӔK	tu\Zh}s|\'U߁\rZ`0fn`\"0 2M%U-OKYܮa]<r׋<-HFreMUT\\@8ٹϠQ /0C*2Bj!υ5\r\n៚/A㰰tLsNLlyk]V\"zAp;(sq{g.|M&\"RԄ	8 vu@TV0y\r\npƳhlA{e5GB\"A >\ZJ&p,AF#b͟AȯэU1Z /t~K\r\n`i5E>(c@Ȃ5r/Z\r\n\r@\rс$mi$rڰ<BrN066?gTF}9s6<|%I!w8SuUb,X.O=`z` [Z$VQ1	L	\nW\Z@Jd_|W)\0[BXRw\n\"5D-ٺ*Y-ɛ	@˙= [v\'!aZ	;\rg̬\n$\r[<;HnĄ( Jy\r\r\n`z+\ZZ޼zMx\0iHcw\r\n;3?ö((F3@lB0q#ӹ0A}F\0ؤm8ui%/Df\r\n7!: Zzl@(|UfӢEr%뤇 ^bH\r\n࢙,b \nƉt%ZMhK·8j4k\072F-cQdJ<kFOȚ-f䊙Xh4ؐ% ?&]KgP6U6aj>x5 B\Z43\"IgC5f~WG3<ץ~50H53+>z\n8./(էte\rП9fدyε,1a\0X@Y2u%^m>e,m17Εx3̷*3O2VMQ_yd8R+{]ýV\0WE\rs\r7 S\r\nM\'e\r\n\r\nδ-PNDU\r\n0[pҘkYd&:0y=0i4\n \'DqLY<I0&Nl(nj*Mvݿ+\\.SS28c&pR\r\nY{#J0qFNXrQCx\rАhmc%.p3¬5gI\nb2[`7qIqՃ.\0Vz߸x\rā S2؏^a!\'ݽ0X\r\nHdI50\r\nt,T:w6\0T9FSG\Zt^H8vQ4΅L<\r(K$[ҢLS箑6ߖ!߲QA\0Z渱PWGԸG\Z+3\"Q[(D!@i|LT*20	/]д,rLˀ$3zUm*Z3cr 	\\kNOVJi\0D\05d9g!> \ZJ%4҃1CfU8g}im~4\"IX]^`#$xx&%lR 	p萗b2$4?U<O>xǦ\0`>4)E)9W<P@ϳr>}l ֨͛ Ǯ[N::fdg+e-.A98vyype-, S+YmfĴQ2g2&3\r\n|*m<X3\"`ֹc\"����26!*E%lˏ\r\nnX13VA&&Nr-p|ڸ\r\n>{&xמK@1XEK /\'s#\\R4qødeU\0qi%xD]\\U5l*ϓg\'GGyi|dNStWHTPH;M)O+F:~^DǶg #[ gv&s*ri{q3+~_Ǟ6Ջ(2XD;_@M؝os6F0|5:18S8:QXJ\"Mw˖-rW.\r\nr낟>^9yhNNþ9+`4Cq`zp=+Є޷P_nPM}!]HsUiUi	J\ZD0@̝ufy3&f3pRQ<n~kM\0SnϤʁ[CN|nE\nŁ$/xS\rJG}!5J]0|ASA0\\TfKQ`Q&FHHKaGeV͟\\	\\Q^)yqCNkse1\Z^%\0/\r\nn)2j5J\0vo]\ZROu2**ʊӁ.\0E8p<dc ϲoVߋBٺutӍf^|	U7+\'?{i<fe&7&y դ#s	y\r\nlU6c}֥\',$HVM:g.\"Iu+iE2?Y8]F\\˲&^D^#{>yïЧ=2q,p%r(mL=\\e֧gӟGt#w\r\nڌ/L\0Xg.^#avmu`dP^Ko\"}?TJke{r;xvמ˭>.zHF\ZwS07(?q鞂 4-YUul`gJTR})M>cSZ+a&u;O|D:5o#q\\s wLr|ZxZ| >+~L_in9V1q,^)Q6蹻$:I$L\"rNt\"<	{lRȚd5̭TQSk;ZL}rw3pGeˊ<}8~5\r\nIvC2x,V7ZzQX㷴R\r\nLm\r\n~]COo?D(褴C-Caom{i9>.;}yrÍ7Cs\0WPEaߔs,q}t\0SvT=sA(l݅*dS/#b@ӒÓFtw}\\ZKCsUϡ|\r\nr_`z\0ǏI`ʖu`eWZA_EC7ʟo=&ԞǏ=bqc,	-\\7>W\n`JG+\Z@6ʋёYyܽ]`gGkC\"{_?|9;^\\_	tQ౑W/C?w~Mgdڐ2~b(~k2eMkϯ/edMDQjK9\r\n\rсo:\0Ku\0\0\0\0IENDB`','Assignments'),('105','tests','tests',1,'\0JFIF\0\0`\0`\0\0\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n\0\0C\0      	\r\n	\n  \n\r\n\n\r\n\r\n\r\n\r\n\r\n 	\r\r\n\r\n\r\n\r\n\r\n\0C\r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\0\0P\0P\"\0\0\0\0\0\0\0\0\0\0\0\0 	\n\r\n\0\0\0\0}\0!1AQa \"q2#BR$3br	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\0\0\0\0\0\0\0 	\n\r\n\0\0 \0w\0!1AQ aq\"2B	#3Rbr\n$4%\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\0\r\n\0\0?\054ӡ@08׃#z}1O`\rg]x\r\n\'$$£jdkZ|E4( v4[ ;ͿKo6`0c\nrAN~M2C$6lpoXT# < \0\"Xӌ`t7\nܠR@)5PY%@\'\0c899>\r\nPۧ\\6ie-v6yO[c,\r\nlISn8aZňГt^=����x  䏔6\ZeH2.U\nꏦ+YQ:ӃúE}濵 qG@Gv9- X^sTohgzF.$մK7ZNRX_\'$FėHI`\r\nu\r\n57iFp\r\n\r!ZO.~b_S\'\n[\\nS#\\;\0#ob\0|G]km!>\ZmuI,+G=7awh<jf�� \r\nxFR㏪\0:rN\"f˚2iz7OͳO*UURndTXӭGp&\r\'=S UKu6՛8	@|Wgvbqon~4xy Yര0(&\"~	 G8$w5_TR\r>/fpkh|ȭHcA,yd[Zg{8]?ZAT\'d:_f՞Y5;\'veRF	>Rb1t}6ZD%o,H䓴\r\nP3ajRe-p+\0k+By-#18\05sSvy)7?.tB̊2ʻat_-Ƙqm۶^o|%R3jym[ொl/~acG;Cx2rC$##ϔz)ڿ\0٫O\0\'\r\n\r\nIiwFu]d@\n@WM>m_\ni?hԣ\"܅5FIWf\r\n9xrx]գh8$0o#|>ѫ#%3.Jqn\'fۦ+\0q8o)|q}K_FwCe\r\n\r\nJ!Ob!gOZwc6+>*W˟{J~ZOs_^kZ:72]H,͒IZao_\0M4K(u(/,S|{WQ*\rJZ4ݖว\rZ4cB4\0?|7fek3%ku\r6.[n87ciK w3O(Dy\r\n\np\0f]jv7_ݹD\\HB4rTIb\0\0xgѬ>s.gxK?Z(eV4R\r\nU=U||;\rwTյIlñXg)4O	I	Te\rXE\0ć!@DgǢ1W1!I%TrpdbI$\r\'υҴ[k}+GBn!#v,I,K1\'s\\8pĚ5mti\ZTgYbQ㐨8\\ʴ{_O-,u=k:-ws&TҭDrb3t(lq#\r<G#N>ܞb!#*{.~xWpxR\'I.Y&dbhh\0Ԓq<YߔQb%GmVl+2^3pI<o?үQN[.vV(7שgмKi6w\r0g?3gda\r\nJbI/%wQ#2k׼\rx^x|IˮLGY7g2\".d!#ƾMjwI\r3:/NHПWqG akw?G%<M]Z[\0qx[I9_pH(\r\n+O<=&/YS\'%6߲%׼Wc<l<SEr#^h]$n\0}Dt:BR *3I2O [)ɱjV2~}	FWa%ϭ}{6%M5t8h#xg\r\n\r խp@0YR\0\r\nwc<\0sYzO|@ׯ.nV%{l\'\'UT.$GgG)E5;gqk~$WK\"Oq^4:Մi\r\n8Tw3O qE$wXI$I$j{-<=a%ŵ$ȱ\nb@ICƑOk5tM8\\lY\r\nkϴ[mV@:tv<TC@q/˩x\ZG^5i?٤\r`TQT2K\'h\n)kKbN*]Up%\"@sc`l\"*Kp(0Ph\0` `W_ڏae~,Ee 13\' 29.\\ ?^~fK :m@8;aQYZWd>$CVmKX,!6_mV^\r\npj\' ypGyBu#O|Gi>-4Z]<G6$H;F$0*) PJ	$Q-FG3]ʑF̑I,T\0	%\0@81}OKBF^y,q\'b\0X $\nسY~-W\'ãf6dyH E{3<7:ko;ȦbV\0[g\ZIM| Wx\r\nzdz]Vv\"~y7IfwvfbK31$IYaQK>ChV!,SfqN]Bѡ=ey\0`rEu6\r\nvw1{}*OwĿ\rͥQ e8xrHysHR}A=|E>ywC;zO5\0\0|=̖#Y	FB(;&b^&r6IѴ\0 hiMVVVƙ*ؒIfgfff$bI$T\0[?̓kq!00y*y@ռom}\\iz&OXLɦG3%c,l|(ÃSM\0Z毭]Lӻ^^v\"R\\ƀ\r\ns*+6\\k+?IX~O܉_/-0F8\0n>#* rb\r\nH<.2d@4e����!\\l[ؤXQʻϜL訦1,+{ 5\r\nm\nٴug1Hcqw,M1;te\"\'\r\n$\05.SeY!,lDQEHpTp\0X|Gl%Rf*z9PONq5YxmYGHW\r\nR\"U#klv=ĸ2LN8\00\0\r\nRPεՑ','Tests'),('106','mail','mail faculty',1,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0\0\0\0gAMA\0\0|Q\0\0\0 cHRM\0\0\0\0\0\0R\0\0@\0\0}y\0\0\0\0<\0\0s<w\0\0\n9iCCPPhotoshop ICC profile\0\0HǝwTTϽwz0R޻\0{^Ea`(34!ED\"HPĀP$VDT $(1ET,oF֋oZ\0/K<Qt\0`)\0LVF_{ͅ!r_zXp3N Y|\09,8%K.ϊ\Z,f%f(Aˉ9a\r>,٩<9SbL!GĈ\r\n3,F0+7T3\0IlpX\"61\"\0H	_qW,d\r\nėrIKst.ښAdp\0&+g]Rә\0Y2EE44432PuoJEzg\Z\0`̉j-\n-\0b8\0o׿M</AqVV2Og$>]9La.+-%Mȧg3Yះ uAxEK\ni<:ŹPcu*@~ (\n ]o0 ~y*s7g%9%(3H* @\0C`-pn	VH@\nA1	jP \ZA3hA\'8΃K\Zn`Lg`\r\na!2D!H҇ dAP	B	Byf*z:	@]h\r\n~L\r\n	CUp΅\r\np%\0;56<\n?\Z\"\r\nGxG\niE>&2 oQEGlQP\r\nUFFuzQ7QcYG4G۠t]nB/o\'Я1\r\n\rxb\"1I>Lf3bX}\n*QYvGĩp(\r&q\r\nx)&gsF|7:~@&h!$&B%pH$D.q#xx8F|K!\\H$!i .%L\";r3EHK-AFCbH$^RSIrdd	3Rx)-))z\ZR#RsiSiT#Wd2Z2n2l2d)EBaQ6S\Z))T\r\nUEMSPgeedɆfȞ!4--VJ;N[i	g%K-sɵݖ{\'OwO%)P_RRۥEK/+))U<د8䡔TtAiF쨜\\|FyZbU)W9.Kw+YUEUOUjꂚZZZCu:C=^\\G}VCEO#OE&^WOs^K[+\\kV֔vv\Z[]n>z^^u}XRO\0m`m3h01$:f\Zь|:kG23hbabhrT4ߴw3=3Y-s.q_vǂbgբ⃥%߲rJ*֪jAe0JOY6rvvtXLǎl&I\']$NϝM.6.\\ι\"En2nnn[g=,<zD{xRby5{z[y!T<v~~\\[w?\r\nXc &0 &IiP^P_0%8&HҐ:О0ɰpu\"\"]Qبn+.^*{Օ\nSVaƜEǆ}g60jfY.glGv9{c)LŗO%%NNtHHp/<%J	OiKťƦyiiiklY37e@2TTPGE8iY&+,Dt6/?G/g{d{kQkYk{T6卭sZWZg\r=6Dؔ|W7w(l,ⱥP_8vk66۫,b]-6)(~_*7|cԲtNN]I喍QN//*\'fϕeu{	{{G+}+4vVN]\\VXv~{~uJuupܩhj89yIcXc߷o>\Z=t٪E2}4\\j5loǄǞ~q=\'\'Z^utv&vvEv\r>mяN9-{\r\nLOgsΝK?7s>xOL\r\nn\\x\r\n}N}g/]>uɫ,u[dS@u]7ot.<30tKn]p;;SwSyo  EV<R|m\\ ??\ZK/\'\nTLL6OMvtӉgf\n~s6bvŧK^ʿ<j٫GS_/s-m߻w\r\nY+?~O\0\0\0	pHYs\0\0\0\0+\0\0\r\nIDATx^\r\nPTZ@(\ZE%$\'Dcd&Ԧi1ֱyvʹ$N&3tƉӴ:FfL&i6 K,첏.wa]ww~Gcc!i0oZYo;s#\ZU;FѡLcCi8\Z?,g%(|weL\0\Zд\ZI@he¿\0:md<<{X \0o\ZhGg-E10\"\r˂jm6ӈHZ RېQDϾLL<$H9\r@\ZV#?Z)m\0w}]38?}Jꃸ\r\n|	1-!66A6x8Qi1LV6 Zv]w[Dmj2Y)N2pc0ӂI)Ln4=}[N2,|AJ	\r\n:XyVnHdx\rb0m^OC\'\0\r\nGYx\0)`f`=xN8Fiya:[^\0\r\n08833Ӗ5S]r>m,li~l#\r\nLge*\Z\r\nd2T燄PvV1BQw?LS89bfo2sƝIOOFYC_,\r\nOco믾A- 	#HDԕ%+ϝcƐАF(bā^LgNl J\0q];_!ivOfc+**:v0	e\n3=-H-*FEINvC\r0[)&.(ݶoFYNݷ3>#;ܨ\ZU׍#\"\"(!!AזD8 H\'\0ݶm\n]Xe<|N?@/QG>vUTZZS_:/͜q\'Adt$4ӌ4wʹnw}	x\ZΗBCUy@7X\0{r`ss\Zqh4mn|F-rftfuta\'rW<\n\"UUUҥ`P5\"8SaA[t}zn~m?@/_a\0bBʟ)NȾ_<<ԐVeC9+oHS>\nWVVRvn.*U)\r\n1\'Tϝ>MIII*z?.aj<t>P,*[rUmy	AGgG/,\\H\rf/\r\nn+ݻѣ\r>S\\XXӴS5|\nXu[H[V=z	 rI1K<w{R|D-^L_w=\')))~o[6uAv\r%|:vI\"]MD@סk^rT7*\'bc\r\n%f|2c\r\n5܎-Z~U|\"v*:KС\'Pưa+s~\Za \r\nY,[֣\0\'p#`i`^#_+wv\\Ǫ+2I`q؅SWH)zH-6n.x٩bnZr].H0avq9>tK=o+qmkS )gA\0\r\n0߱	f`}$3u>-%IW6ҬՇ?n=`&R\nNld<Ef8X=FyѴhZOrTףvTQD\rc\r\nU[z*j~ؾc}釧z}ULuMaVTZ2#\'b\ZF\r|PA{`:h}rE\'?A7J\0@4[j?eb hïƶ=e.O*[\\/$D_굾JD\0\r\nz4,	؀(֍{>>XA/\nڵx1;R7>rG7vo	(S(k5ʟ^ݘTq\"@IH{fYM3޳5d\"ʓ=1[*Ao&)<\\0zN:_T	%\n0@~Y6O_[<̺rx9CioZKkL/&v籮k\\!Isw{܀. LyQOJN&5~~Q]LL\Zcӣo |\r\nսMqu迧okT]<CF&f\ZBbm*8l=RI<4*̎\0;cx%\"e2Հ֞s5]w:uUIBy_hTnB4(LZt%Cu8Az5ւ@<SRk[a*>_ReS9[sme @\ryP~o{ r<r`d-s뽞R:\0qgf\n1!MYR9߮oE)9qTeA5\0\Z;cFr:R>1gqì..I\ZA^@q/L{@TH\\~w.:saSRD2ݛ+PQ/D.\'PX\")e,  9;KkzfrHi^/Q%%@}16st85@\0xn\"\r\n\"XW9(O@,~<Q<5md\0#yX*\'CWk\nN*m\0r/qJP&ֆ-9 sS^g\0QSjrVOu[!fsR oJ\"> Q5peX`[<=]-|%HkK&B eAEe\\Vtdj\0z&ǮަGnwjaCx\r\n^(ʁFmA\0\0\0\0IENDB`','Mail'),('107','grades','grades',1,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0\0\0\0sRGB\0\0\0\0gAMA\0\0\r\na\0\0\0	pHYs\0\0\0\0+\0\0\0tEXtSoftware\0Adobe ImageReadyqe<\0\0IDATx^\\ \Zv9g@x D`Jl09g˲̱DH2`A,;۽}55ӳjfzzsݞzqYVx<R]]-)\rK_|!\'NL	F\0kjjR222Mdff_%ǏK.D^|Ťw݈$+dee)\0IM媫Raǎ;\0\Z)phPS*Hz!% #}ɓ\'\'mF\n$E\"\'|AddgE\r\nn-vڴoK[Dm䨋ek9k,@vCЬ}sJŒ%Rao:Xգ44Hڜq40@jkJo!{NU^^.-0ӦMw`\"e~\\\r\n\r\ne4aW_\'4T&	${wq FL\0n*dcrEӧO)Ѓgl)%_~)|PQ \0Z㏗#FHnoV1ΝRj~SՇ LW\\\\,oA\0)4%jӌ 6R  >v7!tyrK gJD\n}xV]}=Rr27sTn\n1i$@M2O>DY\Z\r謳\r\nn^*1LZ\0IV %,\0Ӌ.+x7k^ZrzzFS!;vw}\0\r\n@\\TSLQ1bº17U+)kw*.\\(D0AvJ&Z\Z<La~(\0-A	\ng1IP_{hdb믗2Pz<y\0\"-\"bXȱ!C *W;ѣ mg\0\'sA}p< 0;_yC!ٷng{\'+`Pmvmm6\Z-9d \0<*s7mړZՇY^vo`c-Z$!|pϬY؁5{P)6Prd\']\n)`ȿ]t x@֯_\nD\0:FV=oȒ/Vq9H7\0@!\r\nbr,χ{^-s0T>hr:@xvAf4k\Ze-d%YQJ/ Q&`p` 5i[n{Ԛ,2*o@`Y>P^W6o͙LJ|VNr@edw)\0w5YK!R^<;\Z!p\0EA>׬g4jNS1XZZ\0e)\0\r\nzu3@6,^i~2deI\0n:HAG&؞V^uReÉpb# Z:8%oZ\0 k\r+}{e~g>D>Iۗ-j >tbx/Spa$hU$\0:\\!P^LPA/e\nM,lPL,G8M+h\\vNìRzN:IvAQ\0|cɥ<\0%\r}Yw&5x?n(JȾz]rJ=OA&sW\0:}\rEꢼaJfųgLx4k#	\"c˨XPfN-dS%X\r\nA6x5	CӔ7ammܼYn	H#XlB6 DwLiM\r\n\r\nv_5da\0v3%o8 ER-{5EMs\r\0̂M6h\0$\r\np\\DDYܰ:&bZ	 ߩP]7\r\n%Tu\Z@Ek\rAȯjR+.%\r\n\nh7%԰C-]>L;80(?/A8Y5%%J½pzSI`SF(FTAhQT\0*\\\0ছiA\n]*$>4x2a\0YH\no\r\ny2J-R\r\n` #4uCa:n6Uc16PP>\\ RWwH YP\ZYbm\Z,x@xqP3]uP4B#PxnJC\r&uC>Z:n,!4ȖBc\Z2	GJ\r\n<,Z	j	;ˊJJ90at֭	R˷C%hf.E8EHΩd8 *p@+J pL%:O<]_RJ9!;p#ȐYtRdE٘	\"0oe\"n\r\niALMK.Pf:rC\rC΄L<seB1/UύȈn<\n$#|E￯-X\'A`m!hjN;iS% */Jh MYʾuq\r\n\r\n`K.\\増_?~[vC3|\r\nh3P&G2L]\\cx>\r\nz6w~IZ[\n;k\0$ he\r\n땭Y#!7@ȸ_.\0ܷ)Ϣx	ɿjN?F,q\r\ns	UdXS%,0NDb~Q= eS8\n\ZX~R9\r\nkudt2\rR`S\'DPUVJ&{PZ[Ƙ\"E:v/7[et<p^ %D{A8WH:o!G`/Y\n@-L#=U)KD}Is帎p40eh̦Bh\0l.X~#	{rbἼ\rVJK12h	rH6Z\Z*\r\n_pMhZ\nxojtkLx1E| kR0nf-=!Cq5r+d	2ؐijCT	#?!ҽa>*t\r\nVۑ5Qp\r\nd#06rn,C$c@%R\r\nUV`D?]#9J.@_t\0㎽/\\zJj\\Vy\Z)p+(I	 )yζ	Jk婈p뭲Oe\'\\sFp2mwST\0nܸ1{LHG!c\"\0o\nN\r\n8RZ;!\07 ΕR˗i7B94.lDW뮓\0\"A\r\n}=~3a\0f)\n|C\0D/\r\nB46zC\n{ʔ#6Lc]\r\nF0ځZųT. vډe\"\0W\0 bP^:a#zI:z\rP~2z\r\n֣TXwV4&LpiL\"&&71Y	tݠ1YXS\'2ҦFtP)(fYP#?_ZcT턲4@!\Z3eg Ҧbq:|aA<h1#2\"_{(ڝr6T_sR\r;~و2*Z[QI1cd\r\nSSN_dC;cԫ+yԮj((sRH\"@w\ZV קh@#\r\n;	e6m\'\"s%R\'|ҵkU`a,V\0\\D-F^g<+mX2Sr\'gfD\"wQ=[\"/F5Ӭ_$$;#˱#$m6#a!6\0n0OS8t\0\\l )Hl%0)tܮ0a=L	 ;O$#ԔH{V\"q#p8ryJBJĭ8s3c5vCߋ}d~ot? 5|Ҿ\r\rۑTOA$:a稧@Nn.eA iI٘/I|!8lɀgR\nۃhzmc)}OocTzP1e:gi¸M@h .6;3Fo M/ׅ:(n]L=gOcȤg&u{ȑ*U=||Us7\ZPSy\ZF:.۸$\r\nale\n\r\n(dy{\"Mw<nd-\n W|,ΤG0Qp,\03\0,dV!s\0#K*thDF^<e;V~	nf\\&KY\rz~i_}UV`ќ{E6\r\n8\na\0gz0V`\"RT|2o6!E\r\no0vȷ?4)o`|\0A\Z	8#@PXUVcYi@	1c\r\nqI\"},lШDԑP.~5\0,o7xklC㴡R9tMx \riz!pNVj\ZOT 9ځ[+[Z_ڬ\'7|h,j;Nu}%ߵ{E\ZhՇrAӍ>T;3\r>Pn]Q0)L57yT\r>I/[R]Ԭg΍@N&Z+V\ZD+:\rz\n\r\n\r\nՔg=.	\rL,O \0)\'\rV-ˣDO`s= jj\0jcG-鰔n{NgB*7}n`tvL-YYX|_\"RI\0\0\0\0IENDB`','Grades'),('108','attendance','attendance as student',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0��6�\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\0H\0\0\0H\0F�k>\0\0\0	vpAg\0\0�\0\0�\0�@@�\0\0�\0IDATx��w�%�Y��}O�\r�\'ǝ��ٜ�UX����,!�V0`�\0#��`����6A��6X�D2BB$��wWa�ywr義�����T�u�{fz�wg�ϝ���T�u�s�7QUjԨQ�F�3����Q�F�\ZOM�R�F�\Z5�\n5�ԨQ�F��BM 5jԨQ�PH�\Z5j�8+�R�F�\Z5�\n5�ԨQ�F��BM 5jԨQ�PH�\Z5j�8+�R�F�\Z5�\n5�ԨQ�F��BM 5jԨQ�PH�\Z5j�8+�R�F�\Z5�\n5�ԨQ�F�����\'P�F���{_��jD_hcD?,:F�oD���AD1P�,�g4�{v��߫���QH�M����wh�����M���]�����?�m��X��\Z�[i����&���7Bh*���c0<t�E \0�Tv�R�`���/��a�ᖯ��TF��F#��C\'�/��8t:�Y1*�=T���ύHj\\��	�Ʀ�j�q�:2F/K{zUT�ND%����5݇f��m@���H6K߻��9\0�Sa�&��X�+\r\n�:&�(�ڂ�0���:�e�����?į>Z8\\��!�L?����n`�\r\nh\Z#�Nm4=���(\r��}��o�Y��G���o�O�\r\n�g�h����	5��X\'j���(Ϩ����#�ܲ���F�.�U$�.����\"���>^�r�W�p\r0e\r\nm���6|�|�\r\n�E�+�oaz�n��\Z��\'�>�,���}I5�}��쩗.��k��~p��VPQT��\n&RLl��y��<�!�S\ZF�=\r=�ى�=\n����N?�!�����\Z5F�&�\Z�\n�U*(���P��\r\n��d�ڧ��r@Ч/��Wl1ϙ�����t��7m��H]����vdO��Ƞ:���aĿ詮X�NC�\Z�s|�A�#q��Ƅ�_��X\"�U�H�b��|���\r��F��VD�C\rO_��ByXd���DRcj���8�C�Nc�ȷ-�K�;�A�U�AdZ4�l�{t>TSsW�iK���xVg��\nVW������]h��@��L�䗙�HT$�.�^C�Hǈ0�	_��\ZOtQ����!�w�r� ��`��Q��@jl*�Y��ڲ�	��<\r\n�\0�M�<�QE:n3u\n\'1y�$�����3\r�3%q�l@ k�S\"+��:\'W\Z��� -� 1�dˤ�U!�6�w�p��1�O(��(o����^�\n5���Th��O��3$��2#�b�?[�k������wV��%]�S#�c\r-�;\'5xF�V��Xh�؏�\"��&��̴��,`�vrיۇI�i��F����]�h���uM$5�	��&#3a\r��ҡ=@��� ���ʫ�Ch�>o�/n[t��WT:��+��C�T6�H������b�s��IBDb2є��\"��}B0���$�_i&&��\r\nf�:5|�a��C+\'�lZ�RFM 56�3a�%����\r��~$�`�<\'qt�r��-8�S3���+%�� �[N��\"��<��t�k(���jS���7��3��D�S���iK�ϙ���O�P5?���վџ�Oh��\n�FM 56eV�����j����z/0ߢ�,;ϫ�y%$��|2��!��RI��8��m6��nB+�u<�V�J�m����4|���t-� ~B�兤��*�\n���\r\r\na4�+I|-F�]1�F�Z���� ��W�F�}��7������	�Ʀ¦��qVt2L�1�2ݎ��\r���B��;��Ʌe����r�\'DR��LayRt\r\nU���Y�䜓����:\r\n\rG��Vh7,-_i7,m�EJ��\"#��3@d����9/n�	�7,c\r� 4�\r\n� 2�IY�$\n(\n���\rO����_\0���P�̓�ֶ�\Z��o��I�{A����re�e��[\"�V��\\϶�vTm�۞��Rj�����@\nL��E)�v%,�\r\n�:>Fc����Ը!��J�[�kK���_�[� �̟�,\r\nBa%0�3���j��Պ��<K��x3��?�{:��g�ƅGM 56_���ѝsE�?޴�}��QU)��w���H*��ʶT�Sz<�	���������g��Y+�:�`-�\\i�	$��s�ɝ�\"\r\n�)���ח��t�+��\"�y��MOi�����==���S�\r\n��@jl*^{�䪝>d��Xþc����pa�q*���9TIJ6g��n����7�üd�*(����x�ڕ��Zy%=�B/t�$9�������g�/�������f?S5.��@jl*,�d���$�ʖ7}��n�6�I�b����������nx��]�mb�Ru��kH���\"Zx/i�m�\\�Hm�HT\\>H|�Qrn6V+�rE��e�]�=Y���(c\ref,df,��iz�(�+\r\n�3}�V^�����~�K��]cS�t�����@���}[w`^�F���Beםt�+�X�<\'�n���D��׮in� r���]wf�|��ۧ���h1bJr�L\\�]Ѹ���\r\nʔ���y�B�WZ~H	���s��9J��b\rcM��MO?��f?W5.\r\njRcSaWQ�0�ҟ��,��B~{]�\"Ym���V4���˓뢤6JjĒ|������Y��9E�XMd��GN�Ċ#�.R�eY;�^��[��ŰZ�<�nGl�oF�Ih��G?��� �o�sU� ����T���S�@>:j�X����֊9G�H�ȶ��Ny?ɹ(|�����h��ߣ�?��q�/�H�(�\r�Ѕ\r\n�\'0َ>���?�{:���W��ڄUcS���Gwb:�5�b�����:�\\6M��+Rm�JR�p��Q�.I[�8vj�ZF{b�ꅆ^hR���<�k���b���nY���<��]����\\;��<�?��{���,c���Ah-���\r+��}��|�8��H�M���1���Nj�����]�}��LF���0]ʣ��H���0F����q������AĖ�ɉt�����g��Xn\r\n%��B>�6Y������B�H��)��\r\n�e���:?��z�O����f?c5�j������L�?���,t�\\�y �;�iV1�d��)��M�*�1�Ԓ�	ȍ��3i�֯$Q���2�{��Gܙ��p��1�J��\'\r\n�@�WZ���,M/�w�\\�N�$ב�̍d�\"��˙���#�\r\n�Z�E����ѯ���k���Y��@jl*��9�iGvx�`[g`�?��o�W�͏���j����4�x�p�x&K�#�Q&Ȗ������j��ϭ�������|���ӭ�ؐ�rd8޴̌EL�\"Z~����9foK��OB�����;H�Ų����(0#:t.\"܇3e��GO;����y�} 56��c:�} �P~w���i�i��_�W�-�L,M�Ջjy�gl<?-�������4�\"}o2\'7��V$V�%L�f��9J~��;��&�e��G��}�|c\re�d�d+rE�m˅\ZSu�\r\nN4O��}��L��\nR,�X\r\n�w���)�����د�\r\nx\0��/^d�	�ƦBox��_>��,�REǅ	�$�=� �5,�\r�g\\\'Z!��8TU�0\\�&bZՏ\"q�-J�\0!\"�m����eZ��ēs���x:I�4�c≰s2`�� ��@�(A$�c�7���e� %)�)���\r\n��!�9����@.:�RcS�L��َ�/{�ɖ���%�b�ԏ�n���Vw�����F\ZJ��;O{�DU\'�OfCL�\'&A��?���\'��:���\\63`�x�&#})E���!DR���mJ&����:`9lU�\Z�-䡪q�PH�M�����]�{?����ͫ����	t	9�3ړ�����]l�wX�$U˨�_�m���0�~�\nj�:[\r��m��Q�6��I2��#�� ��D\0�kIAQ��,�ݔ}C��\Z��\r\n�@ո��	�Ʀ��kOt�۳+�X�$�tR�G�^��\'igZ(!��S�I)7�5 I�dv�*�*O�z����2ٲ,�<T]���&[Qa�u�NhE��P#I�1C�H�DS�oa\'����g��/�sU�¡&�\Z��o�k���O�xW�b_���D\"��s���OG�%G{����4Z���;;���LzqG|�����3S�`�J��s\'�3u��͂I�3D̟����&�\Z����g/��D��H�����0���Vq��f;*��� �L]�J�@B�+��}����eɶ�}ãs-ھ������5�W1�?g�hQ�R>H���������x��&�\Z?���k~���x5��]�z�$u�Sv�\'t�_����ݕ�B������߾H,�\n�ľ����Ca���<(*��[QI$1)�+��n]�Ѿ�Dę��#4F9׋�����R�I��@jl̴��o�<�}�Aua��2vT�H��٨��Y^`G{��|�K#n^�^h����e�tPIE��:���&���K���Iۨ;�䖖�������D�U���>B5�\r\n�	��f D��hZo���-��}� ��B����X@�g�����w�g�h?_� x1�u�8�N x^ֳk.!���T\"�\r�q��B>�9֓�%$�Ww�dx�=]5.j��X�������[L�\"V����^�ݼ�����;�4b+	����m|f���\r\nȵ-�X�&�d����af,bz,g�\"��Hv�DRV#6nkdm\"\0��qX[\"���e��sWr�2Qw���W�\0��Y��@jl\"U��p�ީv�R�c�d�������\\�cy`� �(G&��h_+�cT�����,�n�Z�>��0YH�V\'���+�\'�2F���8r��tvġ�����d2�*�_�HTeX�� ���AM 5.8T	#�E`O�̈+����D���jGt�ŞG	�@�� �� 6�ў�Q��_ۄ�#���,YV� nJر���UVT�OB~9�Vz6��J\\��+�(r�gmܥ��K�� 4�V\"�D����B�|�I�Y��������{�zB���5\'��J�J�?�B��~BU�8,���@�jQ�U���M�ZW;�*��WR4N�y>����6�>�`U���U��;^����f�s���VD�S:�T�uZA�d	�uS��9�cRQ���G{R\Z�؉���m�*���6a%�g���1��N�¤�y�1�ǎx�dᶪ0���(�\\B�|�sə�<S$lg�����CE3E�ڜ֚@.Jl:���c�8$����#����Q=(\"���sR�nи\n��~�Q�fxs��*~H56VDV��3���kX�:>�GjNizmB/p{�Sƛ6U!IgZC�E#I��N����2�^h\n�xR�\\Kb>b+s��N��r̬�h �����6��¤Q^<��G����O}?2��Y�RH��U��4��B|>&�xբi�p����/9���q��IC &.��\'�\nB�)���WԵ�S�_��V�����$S|�ѥ�1�mi��4\n&ٶ��ʲ�5�o���W5�1���E���)F4�u�7=��\r\nyU\\ǚ̾���5�f�c5��:d�(��ٮ����\n��3��<�V���!X\r\n���`u��ݐehG�ء\Z�M�d��g�2���w:\r\n`|M�F��\'�ҜS��*X�yC�m�2gV[�\\�6��G����>�H!�Ɍ�#��U��Ԫq��IA )y���D O ���-���\n�i�X�D\r\n`Uc��i�H$�L�^��Kl�(���SO�u�D�#�F��&���t��{��oy\nX�����U���g��O��L.����\nY�4<�o uPǝ�UR�X;�#\r\nadmܙ��IB^�q3����q.�Cq���L��.�\"�Aef�4�,����z���Y��Q|�\r\ny-��tW��\n���(�xn����fDU�Y	/Bl:�����d�\"ҁ������U��ȳޕ�F\r\n��B�������*�W���;Vf�r�,ڿ$�\"�*�\\��7����	�p��jσ�/x�4(\r7=E�1� ���R\r\n��5qg�T����b���`�a�Ol�Q�~|�b�\Z++���@s�R�ű�q]N��� 8\r\n;�Se�\'�d��,�MA)$�+�|1�+Hͅ����bH����H2���o?�+??�m�� �N d��b�A`^D~F�\r\n�z��\r\nɀK3 h6���yW>��)o�����;��3Q�f�J�x�2c�cT��\ZkC醖����r �ȝ��MOQ_���118���<Yġ���DbrQ��%R� ��lG~ԝ=�y ���H��+�9GrNY��y����v�c�)E\")e�K�>/G;��VN��r.6>CBt��\r\nv�t�{V�#�����q�a�	$6a}�����9�D�u���~.p PH�uf��s\Z����m^��?�=��,���ǌ�p�H3Vm�:k��=�7�m����Jb�0�wb�o-SH��k���\rL܁���Du���?�\'�)�\\G �}\r\nj�GB#�d��gV���z��M�1�I�R�H��\r\n�\"��:o�)����D��u��{μ�:�j�A�:{�nG{IŁ\r\n�1i\'~������:\\�b����.\"���<���D^ �7q��?��@&�4HI�*`���ģ�׋3��u�҉��CTޥ����r�Fތ5�\r\nyųٷ�)U�:�Xψ)w��z��t~���o�,�B����He�}\']���j8\"\ZD�LW�~ʝ��p��\'�|5�{$B+�y�ZF��Zˊ&�*��IB\'0~�3�\r\n��<4&ü�H���B�K�33&D�D˰,�q`�	DD^\n�Qr��y&�7��s\n%XE�RD�\r<a�f��I\'��Թ7����+�2ʌ�Y�4�}��҈��*2���ć�8`%�h2Tt���p���H�A+�8�iM��d�����A$x\"iĞ�u��T�:�̄&8�Zk,�:w�x�ѼZG��*,�3p��ɽQ�OTC����j|������$�PT\'E��� �h�@.Bl��޷�+��rV�n�m��E�9�<��DCi��%p0uЗ �s�NF�wH��$i�ٵ��ɱ�s�q���w� �.d6�)Xu�0�I�����8A0]�*�7\"<��SW��\"	ō��\"�L.�f�!�?ê���$�d}�86����z�켓ec\r�t;��4�6��\\{[�L���y/�{D�����\'�i)�*�O�1Ü�\'RG��#w���0�(�gb�j�E�MU \"r��<cD�ոZI����m2�y�\r\n��F���n�dY��lz\r\n�ZT���_Z+\ZK�$F��\Z�К��ltWb��)E\"�|�@j�*��Ǜ�b��#����F�9U�h��o��$j&[Wh[�J�#��|O�Ҏ��x.�>�OY[����MBw%Qk�a���<�A�A��B��x%�Z43��M����O���f��\ZU���`\r\n���\"!M�\Z1�\0��u[7\r\n��v�q{\'-�i��V��\"�����[��Y>i�2$��rH\Z�5:��߆e����b_H��HLHe�H���<�Foj�� ����I�| �N2�x�u�F���e��%�Uv�C�F����b�K�SY���^��om�7U�&���ș�R�M3�uՂ���ň�%�+o�rR��n`\Z���M)+\\c%w�{Dd+p�&����b{�M*:%*K�h,�J|�i�nr�\\Ho�s�Uy|`M�7v,�WB2/d@��	6=��[��^�{d���GF9�Y:�!RI��3br�O��\r\nw�&~�����eY�YN�z�����x>��ԺVx����a\\��Ֆ�V!�A6�;޳�j�Bh5.OV�¦��~� �%\"���62��e��(�d��q���N+��X�Zq��kEeFE��f�4뗒3=�~jl\r\n#NrH��\'�Ҵ�^W��b�$c\rW�*�|^HI���Ws�\'�X�:G�f��U��\\�>\r\n�f��M���?!�����xL���$��ŞG���0:$7��V�{��/#Z��/��Z�d��v�U�om�Ix1b�D�y;� ��\Z/�7��+^��i��r�(����	Ftr�6�\r\nae>�����8w,���D�>h�C*��L�{�.V,?;~����[M�31���#��C���_8�Jg@�D\n#��\na�Y�j�=�jqi��5�@|�QɈ����+D�6aU�K�/$��I�є|s�?pNv���7G���P!�V %6τ%rK�>r�q!�I�6���Ԥf�P��#��\"ߵ��21({���]�n��H�|Ho�B6q�Ǘ��W%sd$fa\rVE�HZ�P�!D63�dQL<����!�XC�1���d��b=�b6����:����8�u��I>qe�1�+�M>��/$)�b��$��Lɢ�RsY\"hJ��Ͷҫ-\'6�@���?�UD�d?���t��J���C��MI�X��<=F��K��������q��I�}�B6�d�WS��8ү]i~�*ຈ�Aŕ��M�ɗ�#��fX�$d1�P:)\Z�\\�d��7R΅H�!JhMuG�#�T���Y	���c��^�2 5���QD���jY��ɐ��/�0��PQUN\r\nZW��Y\n�\"W���껙\n�	2%�wdW��q�CG+���@U�n�L�Uȅ�U�ZBO�OG���:�����U1<��\'�5=W�*�˶��4b��G���dH���{�2�H��F��\r\n�f\r\n��UҤ\Z<�&\r�Ai:��vH~��{�5�P)�M�O�~X����4�f���՞XU\r\n���_��j�!6�@D�\0�LM��@�\r\n�F��W%%�ۉOL ����Ētw�#	�uI���ԙ�3g��K�U� &��DV�Sw�$��h����t_��ࢺ\ZV�Ʌ�`���Z�PT�v��X-��s�;�3��pdW��wϵ��)EBU�K����,�<�S��c�\"�U*%�9_V	1ϙ�tĵ��5���������;��ƈ\\-Ɯx����ȇF�\r\n/��:����x�(S�c��{ؖ�;)�1��������\r\n͝�p��$\"��&�s�\nA�C��<�Tҡ�j�%}���\n&vC��\"\Z��աŤ���F�E�\r��QHqd�(�R&7w�4\Z+g�J�~S���$�P+t/�\0���(��r�!Y�����=�Ŀ������Uꛐbr�i��f�+\r�e~��\Z� \\�D~����~���P������\"W��Wy�U����H��\n�IS\\%ߊS��dI�wxI;�,�2��Il\r\nO~i���r�H��ZN&�1����Km$�:��:\n�@�&~j{6}V|/�r�J�$�l�*ˢ�eP�+}bȕ��R^�v�R,/�*�%M��n>x�������Gr�����J�D��$�O���e��+��>e���t�7�9�q~�a�?��E��8:�j������筡�.Rꚪ�7�)\r\n<�\r\n>��m��x���@P���I�i��<O)Y$\r\n�ġ�	���QP��<�tV�\ZK��q*�K2�y�\\D�հο�.�Vm��\\��bm�\"	��5}��4�R}�|ݨl�I��j^���%t�CR��9O�	��H2ΓXJ\Z�����\"ܪ�`�s�V@k�q1cC��gD�Z���Q������[�--+��c:*\"i�x�D*\n�d��}7oOr�O� )1��*$9���ƙ!�HZ���I�(%���.��:�Q䒘 [�Ҍ\'�2F���S���u�	��۩��l:�G��8�\n\"��U������+۞BF\r\n��H�W�*˶+����jJ*�H�Q�~�v�ـ\"m�3V��a�| [���\r\n�N����Jm�!��l��C�l��,�SO���-o%�(���J+{��!��\ZXҝd� 5�l��S��OI�/�5����kEU�;/��}O�y�kP-�-T��W�\rcQu��,��j6D�f�9j~\0���ʂ�ye�f��]�������OJ�����gT\"�X�����.���|�8�\"�����U/��_��F��\\3��ʞx�����>�Bi�Wy3�p���q���i*Q!&ݶ�j�ڄ�QH�k��Z��?o�*)�Q&����uN� r/�5ֈ2�c�F�E���Qܴ�Ftx�7�i��ֵT-��V�DKi����o���H��2�1��MX�r�*��Hu����E\"��f?c5�6J�\0�ZR�T�N�\\��)ɛ�c��,\"A�ad�l.�WDzZQ�3^W��>�4((��~b�G\Z�_�g-A6\n��>1��\0Ն�;Ȣ��6���Z�@�AsB���=��פ��L�,�=z��7�ɲʍ�1Ir](ֆD6p�!Ų��N<��*֓JBp�$��WFH壳�0�j�wf\'���s��k�&�(B���A���2� ����t =��>�(��;\r\n�.7#�B�*����P�I��]�Z���|�8�a�|�m��	<\r\n�S����#r���6�0~��|%���>i`O�����X�K\Z\n��d�����ƹ�X��S�2��w\"�I%\r5����#z��Dk���f�go��n�ix\rG ����cLN}f\nSQ�p�UK�]��C��B���|w�^��T�k�$R��䜓:Tv��}���޲�k�]á� �=/V\Z� M\Z�ǒeN	(���:�\\<���\'Opzy��$�7�G�KE\n�iO���ٷ��g����+����8�(2.B#�>�F�|\n �,���������c��U�p�Bb�ę�9@��%��I���q ���TH�sGBЊ>`U�� I�\\jÏ��:�Z�=���;3ޚ��h��`����ʤQ4c�g��\ZO}^�<��~�e��̩���}���9j\r\n��3�p��b�\n��-�y�7��^|��L�r;q~��ҳ���3�%椉����q�HC�O��� x��	za�ٷ�:]K+U �Y�H�y(\rO��޷��������4��w�y��@�\r\n��\n�EdG6cC�,�`J��������3ʌ�F������9e2߽�U�F\"�l\0T�^���������l�Uf�\"���7�����ށS$	�Da��c⿉����ܞ�e������lZ�&�[ط}?7���~�/�_|�Kt ��)8�r��畇�\'��˯�}��/�~��II��e�\'.�t�SI$��6�1��퓻x���<z_>�(�ȅ$s�6����DRv�5��n��U��b�����9������+�Q�:�y�#�^��@��7���`����\"\"K܉�),W�w�b&���\n�q��w�|,+��Y%��qKF���\Z-��9���1E�@*TGIy��IN��{�W\"i ^^�\Z���in;�,��=���b���u��䣧vL�p��+���������tY�N�L��GRU��?� 4~n3\r\n�/\rn>t\r\nW���?�i°��\';��\"3�U+�4*+��f������\Z�E C���癿�O?0v��Jg��ֱ��I��\n�\"��\nA���涁��5���Z�\n)up5�\r��PP����9�ĝ����+nc�5���*�RfX�\r\n+���\n�(OE�?5>ͫn5���_s|�V�+�<�S��v�u�p�&�c�=~F�Pu�>\'E3U�H\"��+��{�e�����n��l�l��}O<��I�uBtq��\'SM�[��{6���q~�aB�s�~\0��!�\r\n��H�	(��$2���>��¬���,�=P��֡Bʕzk�;���1#b��)D]Ž��#�dh��s%33k�G�\n1gB%�E����6/{�K��O�5Gg��Z7���+��YW���X\Z\r\n�n[���;�����D?�I�_V#&�晉iT�;�����;�З?G?�K���E»���0�� ����~�j�_lp-�J� ����W�ҿ�� Ƥ8�mq��<\r\n���T�>-ݞ���I��� ���Lt��\'�jl\r\n⨞�3���dy\r\n���,�a����{�I���%�+[6L*I;c�:I�(F*�W�Qz��_��7��bז]��9ҟs�^t��L�O�,����H>B,w,��Oίx�^G��wmb�u���m��:���r;�F�{H����\"�j�Vp�\Z16J��H��1��_q���U��\r\n���,�njϰ)Kr�MG[�̸En�W��F 1y�n����\r\"�̯O��ԇ\Z<��\rig9�ߑ�[Mu�}e�1Ju�͉�${�az|���>��\'��iG��Vs�?ѹ��tϚFrť�+*R\'�d�x�t?��/�&Q#.�Ù���6^�sj+�>r��{��g��Ԉ���+�����\Z56*� #V7Edk�~�:w���(�_=����+�ʑ��|H�*đ/d?��C�s�sC��wNM=�������Vsf\Z�ձ�������*�(�F��⺔4V!�<i��q�>u�������w�����/\r\nPr�+/�\rn�۔�$�h�L�*�	�LΤ�)��}�O>�e�z��)�D�SvN�l�r�<>15�$�(V��\n\\�,�׹�#�Uȕ*�$�g͛�܂��W�Ǖ��;���6am(\n�3�m��7-�WT��ݽ�+-_�r�a��w�0y�\"y�MVC�&S6��^Uf��TS����L_���>��+[or�jӖ��v�WɤU6�y�p롫i�%Ob��F�3pdG��SF�Z�6�٪q��Q&�e������|#RU���z��}��F�\r\n̈\r\n6)��m�_\'�Ve(EeQe��T�$�kl\r\n�;9�h?��ʹ�Q��B��) fvrŮ˘�b�5^M�\0!�&���$C����畆F+�����`T�,�,�&�g�8�xi^]�I�y>\r\n� �d�\'�\r\n˵�sx��y�|���p솧̌El��;φi�\ro�V �\06�@T�!#MX�����:d�W�F�8�yɾT6_��IU�Kn���=# A��*_���_������b�l�m���� $��	\Z�?+\"��z�@�i	Baf|�\\͖�¨�LȣZ5� ���jq��2�n9\"ɇ�+��ES�W�1�\"��I��7R6i�F\"�f�[�đ�W�?ã�O��:�u<��i�d=��\Z�5�\\�(��s|��p%k$�?��1����l\r�r�^: �Z�ݥ�\"YPt\\�H�<���é�(�H�\rC���7�i��a0#8��o�=[v`�$y\'�ZQHC��²����|����4 ��:V�۝)�Pq\"��2�J\")��ǃ-[�đG���˵[���g\r\n[�ǹ���� ����g�Qq:\n\0\r��,�<�6�@Y݄�ą�U�?�ddg��y-D�K���jUl24\"yZ5��R�_6c%���>_|1;��C~�a�N�sE��	���0 �In}��ٿu �c�N�\r\n��\n�r���C1�0��J���lq�+�|�Xm[�Q�k��X ��i�Ӽ��w�\"�$�Τ�}�l��8=�S��AMⴈ�>�K\0E \r\n�����傴�W�~ĞoM�9i���s\\a#4\nk�\Z�$_��:&�gc]�b\\շZ�]F�����������J���G��S\n�����4�F���*����cXuH\Z,Q�:O���@8j�j�R]\ZD+���K����=	yZ.��r�Tu�H\"9Fќ�J�7<���;9��&{�0lE�L�vc�(P�%��\"�y�5��������8��x��4Z�F{lF��x>�b�6�cm��Z�}hVsa���K�������b����A�Z��\\�<!������\'�1��qjݺȣJ�$�r>*TG\Z�\r\ngD��Q�\"��m�a�ȤL$�\n@�j$~�+Ol4�\r\n�D�v��M�A���(�����>,R��.lTo��MX{�ۜ�6!��4[x�1��X�k�o���x�&��c����1�x�^���\Z�k��5�m����F\r\n���4���܅+&���y����p#荿�o���c��I�\0��e#��|��Z�M��D�b�G�06k�N�T�Ӱ�+��$��s�[х�W.���ʵ)����\r\n�_M���ɲ��@3t�����[�^��&o��	\Z~븈,n��U��c�H�Ή=\n[ҟCb_6	40~���o�1~�)�4lb�Q�ǆ�\n93W�\\<�KKkc��(�(B���xDf]vl$.�6�c��\\�f��\rpU������7��w��������.�;¿���\"�\Z�e�� ��Z��g̉d\\.(����-%��Iu��pgZ�w�|#TG��(Ek\r\n/+�[��\0��� ���|�:ժd(�#�FʎrP�1ί�JL甈�K�ND4�5�\n��q\'�۬�,����~�;5<�F�[@?-\"��?��Gɝ��66H�h����\0�]��ģ��`<�}�FөG\r\n�Q(a�K�[!�u�}l`�0&�����\0�BTc����I�1��r���).�m��3��\0��MջS����;?�M/�@��E�w��w�HD~J�׉����ݿm��Qd�)�!�BB�T\n)�PE呹)%fS���Pt�f�Ʌ��EvP���W�aD�)��\\`x�UI�i�;9L���\"�Hё.�{�JQ�D��3�e?����P�S�F�7�M\"��\"�\\D~0�����3ߵF$f��6ʄe��*歈ٚ��ҿ�`���\r�0 ��{��#�~\r\n��`#�P�p@4��{�נ�\'t��6��*ϭ�zcr���L���c����?�\r�:�_�Ł���w�_��;���pu���\r��O;�g�@ү�*\r\n�`�|dr�3ŝ�ɛ��1$�rJfF�Ru$ē��(t�e�S�(IA�8w#�06G\r\nZ��A��$��c\")�G�$��%���d��T\'V&D��\'�Ù���&_I���D{�/���x�{���&.n\nLx���0��}��|׈`�\ZO5l�	+��8\r\n$?���ߚ��$~��X���7A��.��F��q>��XM\r�ZT�� ����.B˽�Bь��鿔T۞�\r�1�ܐd�j�`�C�7o�7�@?��ȷ�ȭ�u\"r�5{�/~��� \n[I\nNg�͍��N�F�^�)��3��:��=�:U\Z�gđL��[�?w�**>P���>����.\r�H}x�đ�\Zێ�lz�l�NňqϾ�@]A�j��y�mj\nˎ�LX��W�l4���MV�4�&���V�~ke�ٸ��y߁�}�1&���A������8wl�XUVB���U`�Rm\"�#5p�s5r�lƸC�.y%s��B�Y\r��)���*��\r\n��\0#�x���	�-�z�z-�&�&���/�\"��=#_���։�g7<?\r\n\"W^M�N�����3�C�i��ȋ\n�F��~\n䑘�r�#���]r6��UC2�OQl[\\V�|)-ע�MK�$D�6Nޓ,�K�9C��$BL\"���D�,�$6����zD\r\n�������Hl��NDd���^-F&��[#�i��;�	��F�2�DXV�D�Q�O���͌+;ǋ?�|ƈ��=|���,V�P�*���g�5`_�L\r\n��J�VmRcM4}�V90j}��h�\ZMV���_�w	���{11�\\g��u�#�2�@f�Ѣ�\"!��o�,2\")*	�p�uy����A5���!��K�$�#;�L���\Z�H%U�k��IfPw$��7v���M��t��\"!���N哝�\"L���7�hz���~�\"L6<s5.\nlX�HP�88�T����$Ά�Ț<�%�`��T�C��-�����IB�+g���P^�7W���4���(5ք�\\�3�U��7k4���^� \nh5��>�$�r��\r\n�%���|��ȃy�س<���$o�{��,A� �hE��4��S QbvKs1�e�碵�kK~D�oI%�\r\nI�J�\r\"��x�L�,�~h�̬,��[�5�ix�#�Z�/\"�m�#Uc����\n�9A��%�yb\\2��(����yC@	��W��둸R�jɏGT��Lqd^C-�3 ��g6�~^��\rl���y��-�q{+q$V�(�\r��Ѵ$������L�<2��;�+�yE�q��Oo�6�e�\'��|��\\�s�Q�2ʤ������԰U��s�����-I���(�@&�3�~���MU�t��v�P�\' 6$\n�5?�[IVX��Յӌ0+��\r\n?�x����R&{�g�)zYB�U��<4��\0��F��K\0���o6�nY!�\"�(H�Dbj)��r�j�82߇)�G)����z��(��\nŎ�P9����\r\n�Ϳ/\'>����rz=y%��ZCm@\nzj�5M�4�a���fQ�\ZOl��@B(*�dl����Tu>�:�!gy�r�gTm��\r\n@��Jmdj����\0��������`f<��&����W�&d!��܍�`r�$u�3�<���MVT�?����CK5ޒk�K��r���|3�h!���V �ѐ� QH��I`�5��ix�\Z���4����F偠J�rǐwj3b\\6��/4ё��t�r��E�bV�b�6���2��j&3RsU�F2�՟+<�Q��\"�Z՛�w%hr���� � GF*	�x޷�}�1y\r\n�y�U��G�V!�QJ�剤w3��r	\nd\rQLX(4m|�K��\ZX�����yĆ����)�Ё�`���F��QX��RqT��K�o�a8���W9�Uf���7��w�V��F�c�\n�#13>I�o��~�LHQy\r\n�~�:B��c=�Q �MP�PIZ�$�lq��5d�*�\\3,��4�R�k����FXԕz/l �hO5ـU;�U����X�R?F�(����v�g��6T�͔�#O��T��~��lܽ���pz��\'�hy�­_�wɫ��\ZJ� %�����r�G�c--���y�Q>��s�:��o��ɮ)g�[E���N�����vc�vk\r\n]��\0��E�\r#�W���\Z�*����W%g]�D6d�ʑJn��3O�n�v��6!\r\nԩ�|�Iֹ������nԽ�p?k�B[~��V���7yvy�$Z\n��G>�7������*L=�u���}�JX7�@%�@f��\"�����UH��hy����z@�[�H��&,pE\r\n�R\"�9�{;BɓHY}�2_��t���~�{v��/3b(�:�G�y�8�����������h��4���./Ǝ�\\�Аk�0��2�W3]Uu|Or�y^��7U�V���Q*�\r\n��w���\Z����N����SL � 2D\Z1F�Җ��!�J�Q��R	-���#���	#�bʵ�r*�O��/���y�~.V >\r\n�ɳ\n��]�H���\r\n��,���VD^�� ��Q�ܨ��J#�o��R!�W!���*_��D��O��5�LQ���{� 6����l(��VF5��̔~���ھ���C\n�Q��ӏ��	��~����*o,�G�t������\n������r.b,\0��Ec�Į�BGgU9�0��./G^� ��t�>~Sm�z�����\\C\r\n�2�U�B��F\r\n�A�Uh5ڹ:ek��8X��\0�@���kEI��Tm���*�J���8�=� ?����;���.(��9���(��������Ό�괧;&��ByO,��r*��P��>%�wȣ1>����h����8�P&�\nP���UH�?b�A0(�����-pN�ָ��>�n�O���Z����m���\\�ܾWw��+� 1� nW�-��Gٙ���c����~=5�p�ёh�\r��O���ω��!�,�#�@��H�Wk�|)�h%S0�T��H�+�l�IuDV��]��A���\Z~��;�8��\r\n��Dm�J�ϫ:�Gl\\�]���3��y�9�w\"��\r\n3�V��`M���\n��o���\0��j\r���lu���R��r����<�f�X5yp!bho����4��2�m7�`\Z_�y��_������\'�� t0ƣ�[�� <vno�M��H҅�Byg��������T���IrS����\r\nbԅ��(�t��8X�%�>>�����:�=^������Y�������^�ϱ�ӣ�W%V�~=�W���L��4b<�V��]�߹�i��\nU��k]���#�iތemD/�~D#�F\r\na])_\'�����h\r]rK	e�R�Z�����ﻴ^[e�<��c|�|@q���S���xϙ�*���\nOP�\\q?k��ؽe��<Q���9`��*�`�zkL}x>���-�`�F6p���3;i�O��AV������tQ��2cY�D֦����׬��R��^����]�U��\r\n6��\"(�����IP�D%Eܴ4*RH�Q�\r\n�%ە��lWTn��6n����ꦻ��2��ֽԂ�LYy����L}|��哩qFX�����T�M��ĳ\npzi��1�g�ZM}�7���0~hO��*�9/f�ዓa��[��T p�fI�A���\\���X���k`]d�hV���Ľ\\�RG�VT쳜a.\"���@\Z-��^{����N}D�X��N�!�Q�q�#T�)��96h�֠�h�3� w�gW�X�� �ýרL���ߔ�(\Z��s��Y�G�\r\n�/�7 f螔���_�7�xH���7�K���5��T�ƚ���͆�U�C�f9_��7M��>����5Z4�cx�1�F\r\n�$�+���|Ϫ�#�5|������\Z�\0a�gp��d��ta���2��K��#� ����\rElMߓ�t`#4��~�g��{R�Zcش�\r\nz�e8\'�x4�u2�*i55։����\n$A��|�g��;���D:�}� ����}L��i��m�F�E]Ū#\r\n#l��G�����\ZR\r\n\n��V����QTQD�61Yx��(dn�� V�?`M�ǅ�f��02���N�\'��s�U������uE�^g��z�uqa���;<E��ɲ��1T�0)d��H>��䌷y����5{�@�F�9̍\r\n׍���p���ёW�y�\r�����8 �YG(����>\0�����R\Zk�?��t�H *կ��/�7��T�[�d�&h����.��E���PjBU�Bͨ\nbH��?�H)LN��\\d��a|G�o�1hd�0�G$6r$����{~���\r�\np�Z���c�s�fU8�0G/HJjd���MT$�Yv�6��qL*\Z��h=ɕ\".�7G���?���p��F���?�	�Px�r���\"O\"C$C�ȷO�#6]�bP�Ǡ�\r\\�s�\'�x�;���Q}`���f{Oq����YGe��V��Vq\Z���Ř@�;��\\d&ג�(�&�����&�J���IV��J����1��y��\Z�@�� 3V!$$`+�EU�G�dT�,��A<�.��T-6\r\n��������#_q����U�u������.|	��>�6�͢�������z�:L\Z�:K%&�~۽A� ���qM�5���w�x�a��jX.}N�(`h�Uv�E]��r	�b��><GV��a�O4��Q��1D�+�*����J����cC� ���H4}�S�C˗�O��s�Y�n�m�yB��+�����1�)��\r\n|��7����u�a��[~���4�(�)8��*�Z	��^U]�9�JA/V`��0�]�A�0\r\n!��*I����J��1��5R}�\nd#��ѵ\Z�v�c%2���».�\ZI�e�B����6{2μ��S�;kO<�oݻ��<�\Zu�j<5�����J�\0�*�\\9��U\Z�W)4����qq�6z�k��H���戣H&deLTՠV�?�g�w�#�U�!vLMs�u��-��������ͷ�CV������qB�8��|`�maDa�����������\0�(�љ��LB	r*�d���)���q��$ĥ�0 �	�=� ��AZ��V���u��\n�_M}�$�a���	n��r^t�3�ĵ�^l��56��$���\\+ڌ\Z=��0��g���B��R܇�g�g�.�����c?���Zw�{�����bd̓ �{��u�e��6:�Amٙ^�BR2`�$�\"�!��1qg�A��`���>a0�Ʀ���*!\r\n\nđ\\����Du�V��\\����~�ռ��e��\r\n��]����a{�]�pY�pU�v��(_ԭ|\r\nȈ%N�J�K��8y�����l̊*�U�����l�x�U����U��(������gsb��?���w�Ii��\nYMi�Q�$�.K96��À(d�a���2U٘L2RR����] �،�g�Yl���k�䛞{O��j�@���Q�V�_m�_V\"Z���~��C��k��T���z�<1H��uı�D���}�ёB���v�M���LȺ���=�$Q㩋�V \'�@�:�v�|5�F���Uԅ�\Zb�m]�G�\\IdAm�1�QW�>х8��������d�~V1c	Z�Gg&&��k�����\r\nל��s�t�R\r\n���H�㋃�D�g�Z�������c�*�Xt�l�n:x}lеLX��z�[�qQbC	�[���HU���O(�<F�9�Q���.�%*;�ld��*)�bmF6O>9R˛��w�@��?��cC��O\0ocD����h���DYG��>ˣ�©2}����#���3`&�o���HD��m��g�y�*�o��B[�^T�o�-�w���</�Ś��o��ը�S?)��w�.�G�y�QU�(R��א�D\\E��|#��I���jtҠ#�Ĝ�轨��J\r\n�\\�\Z��>;je>#:E�Sܳ #�W�(��r�\\ա�;�����)�r�\'��錙��h�\\V3����(P�>�-_[�>�n����t�zG�H �S\\z��;���(����d4N���T<�\"n���㨫��ᾪDj�(ª�$���(}F�)�������U��߾�u���T�/R5�I���$��W3)%�\ZU����U���&���BlfS[ty$��7aS~�*�Qu��W)����딵�N�Ǳ��E�Yqև�?���76\\�|�[~?B����(ߡ۪e%��]奱_#-���#��!g�*�P!S\"��/|���ѻG��V|�j�\Zݧ�GEA%��\"�*�j�j���C<��(S�n��|t\"��S\\KeT�����ZQfB68*��:n�,V���7����{�c�MX���S�(tҹ��(Y�NU�M\\�$\nCW��F�t�k^�m�����-n�^U�eȪ�/(��$��y�C���F�A\"�H�R�Ֆ�6B//+�S��\nf$W)A\r\n��q4��xy\\M��_�2a���ծk����ժ{w&��E|\n�Kj\\�8/�mo���?\n��q0�:�\"7����VQH�aH��bۨ�tU:��\n?�ݿ��H�����H�+����,����C�����1�:ڕ�����#^\\jG5�ؤ�N���I����w��F�cղ21T����\\���B�)\ZG�rכ��5.z������f�\"V!��}.[|��J��#6[�Q�ͣ�(\n�y�m.y��t�s���w�����\nZ���3�I����_W�P�U\0�H/?��[v���\\���qD<�@���^=��MA��^ױ��5�BU0A�_\"��ܗ�v~�~�w��S�@^��~����H;�\n�v��/(k�_��\\�b�G�)���i���r�����\n��|��Gj*�����\\�D	�0�|U�U����{Z���*f077��6JUH�yE�Cem�{�gB6�uZV�k2�ͼ�R�qכߺjY�\Z�����(+�CW��BnG9��@1*mo�\r\n�(�D���BR3V�t{�)\r~��FO*Q����G���#�\'�\'S��F���7*�d&E-�ֹшZ��oÃ\"׸x�xxy.1���(���~�����j\\\"8�O�~�=���[�nD�GE\\�I��!F0����%���s)V�x$�9qs�4t���*Q��:�$}�ݿ�@�}C���QV56w����V\r����H���_?631�.�qX�t�Fq��jP�~���&8s��r=lN*%cxq�\"^��]�$Y��|\0�Bس���~�ئ�m\\J8�\"�t �o�\Z�7\njD�H�3���8\"��C��8�)ĕnWG0\"�D����*�|�㈰��[�����r���8*�f����ǎ�~ڕ��F� ��{! b�[c�V[Z�͝o2<r� ETP�x�6Ѡ�\r�#��Ƀ[��Z��Vu����\ZOF�w�|�#���Оwz\"���EdO��f�\0�=�9D�!6�i#���\ZA���T�w�t�������cU�&\'���xrAU�Td5M�P���U�j��zA�\01��o���©��cE���,n�����\rI�>��@nݬ�K�_�8o>������������\r\nA1\"aH?�\rB�0`��� �D�_�\Z��A�>\r\n�(嵄j��(��U��{���3M-(�����;γ?��N+����7��Z�9�\'�Jek�D\\���5[q�G���(����n�����1=�)����s�׸�qA�v�V>�sf���UI)v�G��Hj��r&U	}W-�=Ch,�����J�۲�<�*�o�/�x�ݿ:�d�I�����c��BhU&�\r\nݣ�R�\\Ӗ�5Z��Q8�\Z�ѳ�Y+I�s�w�(Z�������s��-�V��aS��|H�����K��=��O���(랓\ZA&����S�ũKL<�<|c�3^#��(��:��x\"jU����k�1\r\n�*�U�>�d��VC+5����05T9���Ք%��x�]uT_^�Y�HG\"~��<ș\"-T�Y\n��\r\nA�\n�ǅP \n`�}��Z��\0�,\\�|�S�`?]&�E/V/�I�״�ׄ\\���/w��4��=�\Zy����kuI�\r�zXUL.2HF �\r\'�,!PmDAg��\r\nIRM��\Z1>�^�+TW5��k��UZ�t�;K�a�(�K�L ��|�j������}��\nƪ33�j������W���;י���Eq\n��`ҟ�&}<��E}������Ӌ��������v\r\nh\0�!`\r\n�\'�\'����=?t��S�+��\Z�_c�a���0-kc\\<_�?\'��3 ��2m�1.���q�D`ųg7�T1e��\ZZ�@�6e%�#�%�܌����-S�	�ǅR V�Q#t=�	AM�kD0&q�%3}fɄ�:�%�Ŀx�E��$��b9xc�3nU�~�?u�^�o� �	l ���N���+�6��#���A����OM��\Z�h�Q+�Vg�\r\nr�dv�� ��;(4�ҹm���oAAI6O���W%\r\n�yiy�N]|�s_����䰱��4\\(Q1rʈ�=_&�;�M�L7��*D�uS~DIJ�8MBZN(ٵ(V%5U��}\Z���ߞ��N���\'`.����~�\r\n{�еG�#֬��0�i��Ǔb}3���aڅ91�,��LU���㐙�Ęsv��#\r\n׻QqU��Ts���x��	�3�z�i��V<#�3�T+$��јU%2��ܺ0�X�\Z7:��)I�\0��9��o\r\n�\'�����������9rh/{v�0596t�� �>z+���M���+���S�\r\n\r\n@?��ynS�8ũ�:���q��0���l�9ҝ٤t�|�Q�%���DBM 5.P/�F�_�}�Tq0IVn\\�Ĩ3Gp�V�I��ڜ����G�iT�g��}�̬�_�\r͝\0AH�pzn� �A�\"��\'��X��\"Щ�\"j��t���#����ZEM�/ӡP����s�G�%}&K>��Uv�>ͱ9K7|�Ri���疑��ա��$�\Z�@0\"\"I�I�&��������0r��lZ�b���5Q&��+�GN���,�ހ�  ��$Ty��^w9\'g�ݵ�.��M�����p�8g�*�X����9��9ǋ;9��}�8r�����%r�GWߏ\'��P$���Jl�Z��\"���;�����a�ې�xJ����\r\n�U?%(>��<�HZ�=��U;���sRSU���=6ǉ��,S��G�H��Ǔ͆��v�>��\0xj� \'�sS9H�dzl�-��9߁���CŶTM&>��W�SQ#\r+Ye_:��0*~yZ\r\n;��V��\"���ld��`�s\n�s@j\\8��j\r\n�C˟��jI2�IGwFL�M�����0RY}��<D�~���f�I��f�Z���̝�*F,��H�X\\]5�K���3j����:���^�Dm\r\n���G�὚��z_&�4�>]�����s�N�GQl��d�hPl�@�@j�?���S��zt;�Z�<�kn�sd�vu��u�U|�3_.���W�}�&�%Y�$O�E�Y�2�Ӫ�RT	nQ^�H2�\'+	WV-�Sj��D\r\nZ^^�r�@ֱ�?ð���kIT-+�kq�~E���a���nhB�N�5�Ը@\n$��5���_�\"l���q��bH��#`���5�GN�`���,Mm��W��1�� l7K���eЭJlrq%���z���\ZJbhY~���e�SնU�E0#LmC�F)���/c�//)dU��3_E6!��Օ�.b����xJ�Hd��N�9���us�}�A�����9 �cܫb�l����q�e����\r\n�+�%���I��3S����q#���i�q��րUATQ5���� ��N#	\"�B�ˆG�}0Zu��_��v�	��}�v�Lf���K�_	y�,��.ȼg�:��ƹ�s?rp�\r�\r��l�/#��1�?\0�Q�W��U[۱/\"\r���s~�z^�m���\'�$)8��a �x1)y\0\\�g;s\r\n��Ysœ/��ߴAfR���I�7$�d�ʽ\'�d�ؐ�\'gy�GUNJr���Du$冬�ՈS�D>�\Zk>q���q���;�8z;�J���� �d��X��9��m[h��N����,��,�Hevoy�{���u��`�έl�\Z�G�W�1|��Q6Vy\0aYՎ��x`�%��Ӂ\\E���+���R���~*ڬf*�2O�f�Z�s��g�*�8	�uc��].�%;K�����o�eLj��	KoBy�e��y�U �l��M�� `na�/>�8���Yɂ\rK�/9K3Vy�Df�!�Ѝ\r\n}k脆��zx&#�F���+���s����pqQ�Y<fMO<�r���Tb������5�X0��V��0\r\nw�U���ZF,_��>j�����g�Miy��bS�U�8��e��{���2��F\r΅@T� =���������2O�e���1P����Ǣ���Gik�vE*, �0V�M�V�E�BB+\r\n�!RI�\'�l�.ۻ�� ���9f�����#j<��m�������}�<GUѸ�J.k�$�o��G5��l=����K0�r�|l��0�ϟ�d�gs�$J\r\n#�7|r5��8\'����];Y�S��y��9�L�wla�έl��bl�EF�-,�ر��.,����ٞWى�žj�����FUݙ�H� ���\r\nL^W\\���OJ\r\n��>���d��|�VI���|�������f_R�\' Κ@Ĉ��p�9��f_��y����Y\\����\'�_Za��c�CeL* �د|i��kE�{��\Z�� T�{E��$y\r\nq],�;B/-\n�yu	7���]�Xbn:�t}L*�l��l�u�x��\\�4drjn���c�<54q����g�Z��(�˓:�����(\"�,AlB��̜�>�(�}~�y�����������ߩ��X�)� c�%<uτI&�Ҭ&�\\��R�B�-\"�$��7��wꋟ��s����Y���D���\'������;�\Z�\Z���� �FU}yR�)��e#<W3-.�� \\����>6�O%��fJ#�%����^�����~��$S�ƹ(d]��<�Q��<�����guI@�F��Ɵ{�����jUnO�$���f,�Db�<Cu!E~� ?Um���MY�4k#zA�g?� ��$��]Ը�q.�s0_Ę<�]<u��Y�?�#�|~����V��\Z%��������<c�Ԭ�#.	e�N]2j^9ӕ��HY:�m��.��߽�y ���7��\\ʳ��u\\n�s�\r\n琉.m����6b��\ZO.|�/�^ǈ�W��(�$�\"g~1Kŝ#�S�RE������f�WQ��br���_ě�y�\r7��%�zTW��q��	D`����$����w?(\"oW�6W0JH�:I*̖q��I.�#u��%��83)\r���*�-;���3 ��o��_��؀2H5��8��@d��@j�돝��:1���-��amGΙn	c����/\r�6]mR�Jk��^�L�^���[�����:��p��[o��߾������Z�����,��\Z� �2���쓿@h��..^j\'���: �������N�^�#�DQ�QEy�43e]�������HLWq� d9�*����mW��\r�<�\'T����r��׿��|�׽	�\r\n1��?���Y<5�#΅@&.氕�{�&����az/����f��O��	/�唘��̔�[�t\r\nW�W��|*�X�Y�y�WZ˖= ���w!\"LLMˡ��mveE�t�w��?�^���Ñ�檐\Z��s�4�vۧ*��06y�)�y��Ϻ�9G�x�m{�^w��Ϥ5r�\"���lZ�-��)k�BRRU7]m���R\\]���$ ��ՌMoK��_w}��ʊ���\'�|���3�����������R$��5�jri�\\�x�\\d>���<sl�=��yox����4ѻ�Y{����Ƙ��=�\"��m�Ai�nT-V�8;]-�\njA�E����E�\n��I!E�JC��7���+	Ðv�M��cz��h�^��8��0�	�_��/z�ܯ��=�\":��$��E4���_\n8�~uhm�\Z6�@�xɷ<�J�׶N�?�ٍS�-;�<��pG?�1V�{.�������ep,�X��x�ʼ��̕z�\'fY�E�Ub��u�����n}a��Z�[�2���\'�>x�k��D����_���6��?�˿鶶mC�%XZ�I����\\|I��}��f�֓\Z�q�^y�⥯~�_��=1���w��㮱�r�����N��\r\n��@��+�z�CZ��6q��QYU\n�bա�,2-���%J$�ʖ���۝x��I��F�Y�Ƕn#� ��c �7n�ָ�=���m��w�������ϴ�n����G�\r\n�sQ ��s�b�O6������?��������\\��oܸ5`l~���I��Zx�М��;;K��z~�Ŗk��=N��|g�\n#|c0&�X(��֤�Uy��ۭZ��2�u �n1c3;�mbu��x^\Z�6���1s�5�}�\r\n<c�6Y96{��w���	��~�}���e�߿��[;�����q.智c�A�@p^^���w������\rě�u獻\Z�g�\r\n�\\�e����l�0�};�c��(\"\nC�F���k�����3��p<iRV�$J;Ћ8\"+G��<���/g�S\Z�q.��L�:P��f*�o��Da�K���̑#4E�s����z���G����Gí���{����|�W��~���\Z���@\nt�]�y���������x�c�\r\n��|c�s�LL��\'#��� \r\n�l�7��n�C{�v�N���!ReE�����y��.{�]���pe;�N��^�<��4*�B��\n���|;ۯ�	I_���F���<zQD�P�Ǐ\rl9r���q��i^2�%�)s�{��с7><��_}�����C��QXα\Z�Ņ���L���F�\'���ۮ���ǃ��8� ���g|c�rW�[���}�-˰gr\r\n_���m)yXk�(b��F�EZŝ���|�]<���G�[�q���uq�χ\'�u��al~J�*l��fv\\����$!�������ݜ�!���8�خ]L<�>��h����g�O~AVd��J���ǣ�����O��L3����~�;G56�@\Z\\�f�C���]���}������_{��?���л�\Z�o2�	`b�ų�;��iC�G�^����a\r\nc۷���ݮ����Z��n�yƘtD��ȍ\\�̯�o�SsV�.f3�Mʺ$Qh�e���b��d���M��y����DD��p�s�pe���gj�~�\rn�O��O��;n��ϼ�&������������_=z��u����D§>�E�\\t!��t������^{�׿��юghc�H<O�U���Ӱ}��D+G�Y�wr�)��[y��`�PQUu��B���3�u�3��~惄�s�GV�E�\\<$ ����q2eh-�A�?��5����5�$�D������eal�n&v�B�������Ѻ�Y��y�2\"��c���w�?n�}�Xp�U�v���7�_������������\\$�쓿@�	d�\r����o����4 nTߩ�$��ka����@�?���$;�989E#!�  \\^v�۞��ͪbb�QV!\0{o}Q���#�\"<�`դY��X��QDE�S6��[��ZW�$�:�(�SEJ�,.0�kc�>�O��y�\n�����k9�w /z�-\r\n�ؽ�=���[�{<<��_;y��[���0���f߯\Zg�s!����;�J[g����\r\n�^1���iܤ��Q2˵W�g|����ei�.�XbOw�+��hCkf&��0LM�(Y�F�B�&\0����_��{�}�iic\r\n*�(\r�d�a	◵�^�G�i-��$�gL\\�=���@���S\"{��z�U���\n�z�\r\n|f�\0;f���q\r\n���}�\r\n��}[��>�;���o0� 3��\'�u|��;w5ևZ����s��ŋ�(��-;�t���S��Vۘ0����C�w�}��+<��1��>F#&�p$8�5�Ny���\0,-a�`��mm6B�ePWu�^�žg|Ao�������P��x\r\n8�y��C�Z�:5\"\"�+�8F!Y��x��\\-m��9\0&\"��>.�%��?������ev�la��m������|�_����[�wve�[~�?�֩V�s���Vɓu)����6`��Q�;�G=�گ���o>��o)Ǿ��ػsK+|�8K�Q�LR��xZp���L�М�@|�`q���<�2��1�T)pbkj��~	�~�/�~µ�����ڪ:Gd�*�@��+�\"�F������LX��$$=YKovD���Zf?�y�L��h�w�<t+��)f��>3Ł��y�7����O���o�CA�&Vf��o�~g�\r\n��Ʒ>����F5j�L�sB��me������S��lc�S�Ɋ����e{w�����ѓ�/v�0KV��<�Ӷ����nc�M\r\n\r\nD��*$��X���8�)�*���}�\r\ny�}L�����x��!�͔GYZ��@�\0��l��$��}^b��\r\n/�$�S�\0�z������qr���q�4��$+��^���2;�M��v�z��,/w��g�D��o�CA� �������o6���}����;�5��	�ƹ!G o�-�9�~�����\"hL�w�ph�N:�?v����APH&�l�����c�I�\Z��?>�G��jئ��\0l�떍P ��y�2�}�Gne�3���2��n>u���*�AH?	#K�\r\nJD� ��369��y�v���$&�|�VQ�G��ID�m�]��=��1z\r\n��wr9�F�(�X���� ��_f��4�wo�Ͻ�ť���,��w,����N�o�,�J�v�;&v6��p8�T�ԉ��@���+�g ͷӽ/��I�EE��j��)�\\��N��Ï�daye�8\0����{��O7h�Q��e\r\n��El����>�Ĳ��Q���ar�a����1Ӱ�a�\r��7O�B�A��!� -���SV����mU%�t\\��Db�B \0Q�K��	akL\"Ϟj3X|��~˩�0by��J�ϩ�yvl�����y�sofvn�O��\0�~{��`�g�u��N����1�[�}�k���pix��C���~�+���~�_�v�4��G���������#�-� x�aLh����Vk� �\"�ر+qF����I���\Z�6as���,c����g�6��+�<�\"�:=z��FLb\r\n\Z�\n�QМ���Ԗ4�ٌ ����z��<\0;�~/����=v��={���j�;&|�����������p>,a�ӧ�;���Evn�q��y�p��<���#�h\'�/���˃����	��;�2΅@.�b��I���^7ul���}+3o4���0h<9Ӿ][�l�N:�>�;���\n��`պw�/?�]cm��P\"�u�hl�B��T�JI�CU�����}�8��c��\r�(���\n�1L�?uhY旻,w��}��œe���衵���Öm;�</5c���cY��++�c�����#�/�絕��W���UΗ��8��r�N�$\'�ؽm\r\n��l�Eϻ��=����Չ�� K�W~�g���y���{7��_��MX�B�&����{]�x�OO��7=)M�U�ɾ][Y��y��,,���n��Upe��j���x��ΝKK�i�4�Z�ף������ȶ\0���u�\Zl��c�|�~1�l�� �[$��-�c�\'���� dn��b�O�ah��g@����W�Z��e�>Z�v!�w5��]Z\"ZZBr�6�&�x��0�oS `y�;�ݥ �����7U�a��RD�����{vl�ྜྷ>��{��O7��p��s���z�+_�w�^� ��\'q�f��5��R@m��������Ù���h ��ȡ��ܶ���.<r����AG������x����F��#��\n�\r\nX��e�}��9x�G�x����v��)��\r\nm�D���J����t�[��i7\ZO��0�����/wY�kzL4y��D\ZđY��i��=P0_�R �����VV���\" d=�M��>�?��w�G��\"]!Xz���/�R�W�0�XX��I�d+�_u��<�G>{?KK~�p�E���ݫ��][�������#���\\\n8�TF��>����^���q*��ůD�;<���G������$\r\nK+���Q������`O�_�;b�ߵ���q掳�\nU��偨��N�\\��w�<q��9x9;_��/~�0�L�[���evi�^05�f�ݤ�hl�\"	��No�ro�J�O2��j|#.*\r�q���@��e��C��wpM��߫�ӧi4����3���u���0�oa�˶ӧ�+��/W�����!YNB$17���J�����ݵ�g�|%a������h���z�/��W��-��w��7���}Sp.p��ZR�R��;��?�{]��\r\n�}{�����o��rZ�s\r\n�|��\'XZ�,�3�g;�\'yIt�=�&>0�c a��`y���q&�Q�fH�T��ѫ��4�͔h��9��/|�A�漘\Zoc���W�\rBW<�ZM�[M�M���pFy#gZs+�YK�t��A�&\r\n�5}f&\Z4��\n��q�!�0�,� \"2>;]I{|�HP9�on��S�\'A\n��{6*1\Z\r\n���0q�eKK챖�����qz|Ov�������U\r\nYX�p��< �l�Eϻ�N�χ>��u��J0�C�:����~�;^���~۟��R��\\P�\r\n�t6��/.r�λ�N��7lm{?�d��i4||��[����}��rjn���K,wz�q�ә`K��\r\n粄<���Ғ�ou��0D|�}\Z�ҏ�%�HQՂ��u7��?C���\r\n\"K�����x��R� t��#;=\Z���=Z\r�F���;�oL���jZ�+��Q#xq ����q?����д�� ���(������[>[�y��4.�\n����7�,�0br�e��Z7���$�D�呿o��y��Ÿ��s��)\Z\r\n�>�f����9�l�սG���ޞ��r\'�}���z!\'�,.w�>3��=�y��n���%>}߃�`��.���V���ox������ɟ���\Z����J�G&���E?���;���͓M�iLOS�+�e��-tz{�$��+����c;Sl�����C\\�n�\0�۷c���z�#�\rl⍍����|<�]ˌ���Z.abj�=G�灓��BG\r\n�az���y�.v��g�\\\"֢���\\GkRŃ#�zp����H�Ɣ�K�%�B0i��>4ّ�2=�`���S2@PQ�����CW���̶u9ϓ�c���cǘr\r\n��5Cx�Bdm�h���[9��Oreӧ��\0��c�=���ΐ�ɹ�\"��Zz�Y�Vعm�S$Ͻ�G�8ŗxBNۉ+��w����ȶ�����;���g}�5\n8 �>�O�A���>����;�h@�����ɭ���D��f����k1����cqi�~\\O�l1՟箕 ������#q������I�\Z���qV��i�ٳ�	+Q!ID֑����/�Cw��fD�3�o��l�l��.���(�*�d?��&v��#Zc_�=oG�g�2�`��c����S=��G 6��t !S{/�������y^z|Y��%<q���:\r\n �($3\Zb\r\n;o����$74=��/�r-��Ժ�cU�HYZ�����[bώ-س���v��/>±�w\\���/���_��?����{�;�=�!r	�D��;W��x�T�=|�� �[����3�j6h5\\s�~���JZN�/���\'X^��������2w.�k��3[m�\n�v}�3@2�Q�H��}�1��ٓ�e�h�ZXk����=�Ͻ�O�\rBZ��g��X�g�����\r\n+=�A�H\\�|����ZUp��V�j1\"L�L���|��0��n�T\r\nBZ�ADwb����,��n+��l�Q�`��Q\Z�N\Z���U�C�N =z %���B��>0s������j�І,�.����{v�p�� �ᚃ��G�/~��h�\'�S/��׼����O���\r��K�@���\0��Ӟ�������W��RDh6|���\rW��<�:<��	�W�� �D�{;��/rcS�֖-`\r\n���\r#�6\r\nSGz�Z�fg״ի*Q�h4R��eW������C��l4�b<c����	&ƚ,.�Y�\r�ǾA64:���+�\'�X�g���n�T�HJ��֕.D�^\\�dύ���57���y޺��\'�`<\r\n�F#��{.3Q����y�UD�q�͜���ų�����n$��vC�&QeXf�C�V���]d߮���Y׳���O|�eo��N���/}�7��m�������\r��K��YVW�€c�S\0���Z�\r�W�����j��q�ul������ĉYN�/��8�q.f�2��\nw��[\Z��К��k4�\r\ny�s�z�6��\n�(��dӱ�aƲ��h4Ð��8���U|��Q:�e\Z^\r\nc,^C@\r�@�٠9�35h��\rX��,q2���(I#ه�\r\nm�g���{dđ��b ��Ԉe)�A�Jo����K\"F\0\0�\0IDAT���/��j���Q���=iu�����W�z#	D�`y���gb�~��x#�>��e�ӟ��o �۔Ⲇ��+��� \'O/������ �n��ϻ�ǎ�r�W�Y;ud>��?�~�7|p�������/>�av	�\\LX�@�\0x�}g��w�}%�o����K�?�+ٷ{����2����,-;��F�F�f��s_�6/���f���nӛ�]����B�\0�j!��V����tR\'�Z�yccct:v8��O._��_�� �4�<A�`���x�X�I��35�� t�!� r����������1����=\Z���\r�!V6q�W��YUBU��\r\n\":���\Z�}Ɲlݱ+%��t�������W���$��<(�Idq�k���2��p�>�9n�G��|v��X�m����*�^�c\'��;���fF<��f>�Ň9~R��:y��`�����W������#�ù��zY��Ń�N&yV5Y�d�9|��W��d\n`��$��p�V��Jo���ga�K��#�z^:q\0?���{��\r\n�1����)zssD���w>	4\r\n�\r\n��T	O�b��i�c��j�kmj�\Z���qó����	�~����Am|�\'��`�g�ɶ0���M������8�7JaD�>|Oh��o$��\")U�w�ˈ�C\\�`�0�ހ�~����˯�9�y�H�P��QU�����>\n�G��E�Ѱ���>�(��]���W�w������\r\n;nL3듣W��k�}N� �ea�K�����\n{w�p�5�����x�?~�~k��������S/��׾�M�����_��5������ݧ\0FΡ�i8|��;��~d;8���X���Kn΅�+�}�O޳!7���3�K�Jk�6GgP�l���4\'����Ǐ��ȑ��zH��}�M�}�_Coq��G��:s�T�51�8���#+�t榖o���ZФ�S҉g���`\r\n)q$盚��MV�*�(� �����\r\n�w�3����l�\n���Æ���h�!�yi��F9�+�m-�����2�>�}�������~�0��VeF�.���Ss�س��<�VN�-��{`N\\�П��׼���ɴ,}������킟�8�rFa���rb��w��j�M8 \"³o�\Zk-GO�����0�0);�F\\{�>n���y���Gn���=�����8��cA����\r\n��~��Tc�P7��l6��21��[�z��?d���w�M���;�Q����Q���[<� ��f�w�sɓI�9I|\'E�&V@�3[�E�a�\rB:������|\rc�)y$׸�{a�����?���\r�T�Z��,� 2�o��c<�{��l�G�]��]k��I�*� ����+=vm��};y��n�S�>ȩ��=��x>����_������Ͻ�]g��p.�DOM���e���2�����w�~�&�	���9D��s���nϕ|Hʛ�a錳ŕ�_��,y�\'\\Y� �n��f��2a-�0RE��MB\"ccc�*;��i/z��?dy�t��q|�ϸN]U0��M�d��Q����BUW{z��8$S\Z��qذ�����t��z!{q�]/cj��B�y+���U����{�1�%�S!��{\r\n��́1L^v��2�fgy��#����zyv�m�*�O��F���\rx����]����-��7����e��3�@8��;9�����W~���]8��¹�s�(��K0<������_na��i���r���\\���љ���o�ۡ�/sG�Ӟ������\r\n��/y\0�� 6�Q���i���_��P��;\r\nC\Z����t:�>��_�\n>��?a���J�x+��J�a9%\"\Z��-X,* ֥�9.�!Zڱ��wjy�\\EU#u��A�J�Rg���<�ůbۮ=�H���U\0G�����QȹV\r\n8D�>�xn�-G�0XX`���>��緙��SIe��ZO_RU`~q�^����2 ���%Ͻ�G���\r\n_yT���\r\r\n���|�^����^��8�R&g_�詀���r&�U���wO��+�7��n��  =1� !��Q�v/<�s�e�G��1X\\d��t^��UPUl� Qş���~�]���m�3/�H�����nB>��w��<���h7|�.T*�_x(c2���EM��CTQ�9;1�\'�u�O���8����2�\"�����3��\nn{�kٹ�@%y��ړ�_�� ��3�G]��3���8�Î�=����Dy�{x�i�2���Ғ�8�_���� \r\nfX��صc\r\n�����=�x�G�\';ZF��t�ξ���~��z�������7�I�s-�~q�� �S1�	\r\nr�λ�@��W�K����Vz�t�qQ��q��X|��}��<��={VV��V��h0��e\r\n��,aȱ{��~�לQ�M�9D�}?U\"���	�o��w�1������h\\��A��+�.I�A�b��]�*�� �Dr��̒��TGb�R\\5��� ��<��΀�CWsۋ_Î=�\n�J�(Zw�nU%\r\nN~�s�H�?b�q!�d��ZV�c���gr�#�J�t�����dv�־�5�9�R�G��������]�����\n���,����`��}�k�iJ�_��w��R��T��| �ƤR�M�T�����7� �ྜྷLN�qz~��`�\n��,��Bb��Q��\r\n���0�ga��`a�շ�$D�>��8�J[�S_�2ݕ\Z�ƪ	������D&&&�v���z��6�zϻ��AWfĂ���\r\n�Wڍ}!�IKE�H,AQI\r\n.������>���p\"\r\nA�ADg��z�^�~�K�پ3u�K|��*����/~�����|%���*x �v�=���Dn���?·<��o1l�\"w��C+ں�U�����[f��cv!6k=�>���9=��#������������ѷ��~{Sn�&�\\MX��K\\\0�Q�>hj@?�zGg��Ͽ���2p�������/a\\�us��+�x��{8��GҲ���<61��v0pu��%|�QN<� S��\n��w�8�%����w�͗}�z�q����I�ZD�톇�','ViewIndividualAttendance'),('2','Assign Student','assign student',1,NULL,'AssignStudent'),('3','Assign Lecturer','Assign Lecturer',1,NULL,'AssignLecturer'),('4','View Test','View Test',1,NULL,'ViewTest'),('5','Approve Test','Approve Test',1,NULL,'ApproveTest'),('6','tests','View Test',1,NULL,'StudentTests'),('7','assignments','assignments',1,NULL,'StudentAssignment'),('8','dashboard','dashboard',1,NULL,'Dashboard'),('9','view assignments','view assignment',1,NULL,'ViewAssignment');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaldetails`
--

DROP TABLE IF EXISTS `personaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaldetails` (
  `userid` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `image` blob,
  PRIMARY KEY (`userid`),
  CONSTRAINT `fk17` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaldetails`
--

LOCK TABLES `personaldetails` WRITE;
/*!40000 ALTER TABLE `personaldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaldetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialpermissions`
--

DROP TABLE IF EXISTS `specialpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialpermissions` (
  `userid` varchar(45) NOT NULL,
  `permissionid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`userid`,`permissionid`),
  KEY `fk6_idx` (`permissionid`),
  CONSTRAINT `fk5` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialpermissions`
--

LOCK TABLES `specialpermissions` WRITE;
/*!40000 ALTER TABLE `specialpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentattendance`
--

DROP TABLE IF EXISTS `studentattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentattendance` (
  `userid` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `attendance` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentattendance`
--

LOCK TABLES `studentattendance` WRITE;
/*!40000 ALTER TABLE `studentattendance` DISABLE KEYS */;
INSERT INTO `studentattendance` VALUES ('ashu','cs-101',2),('ashu','cs-102',5);
/*!40000 ALTER TABLE `studentattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentclasses`
--

DROP TABLE IF EXISTS `studentclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentclasses` (
  `userid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`) USING BTREE,
  KEY `fk32` (`classid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentclasses`
--

LOCK TABLES `studentclasses` WRITE;
/*!40000 ALTER TABLE `studentclasses` DISABLE KEYS */;
INSERT INTO `studentclasses` VALUES ('aman','class1',1),('ashu','class1',1),('manik','class1',1),('ram','class1',1),('sham','class1',1),('stu1','class3',1),('stu2','class2',1),('virdi','class1',1);
/*!40000 ALTER TABLE `studentclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectclasses`
--

DROP TABLE IF EXISTS `subjectclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectclasses` (
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subjectid`,`classid`) USING BTREE,
  KEY `fk9_idx` (`classid`),
  CONSTRAINT `fk8` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk9` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectclasses`
--

LOCK TABLES `subjectclasses` WRITE;
/*!40000 ALTER TABLE `subjectclasses` DISABLE KEYS */;
INSERT INTO `subjectclasses` VALUES ('cs-101','class1',1),('cs-102','class1',1),('cs-103','class1',1),('cs-104','class1',1),('cs-105','class2',1),('cs-106','class2',1),('cs-107','class2',1),('cs-108','class2',1),('cs-109','class3',1),('cs-110','class3',1),('cs-111','class3',1),('cs-112','class3',1),('cs-113','class4',1),('cs-114','class4',1),('cs-115','class4',1),('cs-116','class4',1),('me-101','class5',1),('me-102','class5',1),('me-103','class5',1),('me-104','class5',1);
/*!40000 ALTER TABLE `subjectclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subjectid` varchar(45) NOT NULL,
  `subjectname` varchar(120) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  PRIMARY KEY (`subjectid`),
  KEY `fk12_idx` (`branchid`),
  CONSTRAINT `fk12` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('cs-101','Computer Architecture','cse-1'),('cs-102','Object Oriented Programming using C++','cse-1'),('cs-103','Digital Circuits & Logic Design','cse-1'),('cs-104','Mathematics-III','cse-1'),('cs-105','Computer Networks-II','cse-1'),('cs-106','Relational Database Management System-II','cse-1'),('cs-107','Design & Analysis of Algorithms','cse-1'),('cs-108','Computer Graphics','cse-1'),('cs-109','Formal Language & Automata Theory','cse-1'),('cs-110','System Simulation and Modelling','cse-1'),('cs-111','Environmental Sciences','cse-1'),('cs-112','Expert System','cse-1'),('cs-113','Formal Language & Automata Theory','cse-1'),('cs-114','System Simulation and Modelling','cse-1'),('cs-115','Environmental Sciences','cse-1'),('cs-116','Expert System','cse-1'),('me-101','Theory of Machines-I','mech-1'),('me-102','Strength of Materials- I','mech-1'),('me-103','Machine Drawing','mech-1'),('me-104','Applied Thermodynamics -I','mech-1');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `quesno` int(10) unsigned NOT NULL,
  `branchid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `question` varchar(45) NOT NULL,
  `opt1` varchar(45) NOT NULL,
  `opt2` varchar(45) NOT NULL,
  `opt3` varchar(45) NOT NULL,
  `opt4` varchar(45) NOT NULL,
  `ans` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `testid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`quesno`) USING BTREE,
  KEY `FK_testdata_1` (`branchid`),
  KEY `FK_testdata_2` (`classid`),
  KEY `FK_testdata_3` (`subjectid`),
  KEY `FK_testdata_4` (`testid`),
  CONSTRAINT `FK_testdata_1` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`),
  CONSTRAINT `FK_testdata_2` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`),
  CONSTRAINT `FK_testdata_3` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`),
  CONSTRAINT `FK_testdata_4` FOREIGN KEY (`testid`) REFERENCES `testnotice` (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
INSERT INTO `testdata` VALUES (1,'cse-1','class1','jj','ans1','ans2','ans3','ans4','ans1','cs-101',1,NULL),(2,'cse-1','class1','Hello','ans1','ans2','ans3','ans4','ans1','cs-101',1,NULL);
/*!40000 ALTER TABLE `testdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testfolder`
--

DROP TABLE IF EXISTS `testfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testfolder` (
  `userid` varchar(45) NOT NULL,
  `testid` varchar(45) NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userid`,`testid`) USING BTREE,
  CONSTRAINT `fk23` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testfolder`
--

LOCK TABLES `testfolder` WRITE;
/*!40000 ALTER TABLE `testfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `testfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testnotice`
--

DROP TABLE IF EXISTS `testnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testnotice` (
  `testid` varchar(45) NOT NULL,
  `testname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `maximarks` varchar(45) NOT NULL,
  `dateoftest` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `maxitime` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  PRIMARY KEY (`testid`),
  KEY `FK_testnotice_1` (`branchid`),
  CONSTRAINT `FK_testnotice_1` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testnotice`
--

LOCK TABLES `testnotice` WRITE;
/*!40000 ALTER TABLE `testnotice` DISABLE KEYS */;
INSERT INTO `testnotice` VALUES ('1','java','cs-101','class1','24','2013-11-05',0,'00:30','cse-1'),('3','java','cs-105','class2','24','2013-11-05',1,'22:01','cse-1');
/*!40000 ALTER TABLE `testnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbranch`
--

DROP TABLE IF EXISTS `userbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbranch` (
  `userid` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `fk34` (`branchid`),
  CONSTRAINT `fk33` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk34` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbranch`
--

LOCK TABLES `userbranch` WRITE;
/*!40000 ALTER TABLE `userbranch` DISABLE KEYS */;
INSERT INTO `userbranch` VALUES ('aman','cse-1',1),('ashu','cse-1',1),('lect1','cse-1',1),('manik','cse-1',1),('ram','cse-1',1),('sham','cse-1',1),('stu1','cse-1',1),('stu2','cse-1',1),('virdi','mech-1',1);
/*!40000 ALTER TABLE `userbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userclasses`
--

DROP TABLE IF EXISTS `userclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userclasses` (
  `userid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `subjectid` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`classid`,`subjectid`,`branchid`) USING BTREE,
  KEY `fk11_idx` (`classid`),
  CONSTRAINT `fk10` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk11` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userclasses`
--

LOCK TABLES `userclasses` WRITE;
/*!40000 ALTER TABLE `userclasses` DISABLE KEYS */;
INSERT INTO `userclasses` VALUES ('aman','class1',1,'cs-101','cse-1'),('aman','class2',1,'cs-105','cse-1');
/*!40000 ALTER TABLE `userclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergrades`
--

DROP TABLE IF EXISTS `usergrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergrades` (
  `userid` varchar(45) NOT NULL,
  `domainid` varchar(45) NOT NULL,
  `gradeobtained` int(11) DEFAULT '0',
  `subjectid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`subjectid`,`domainid`),
  KEY `fk30_idx` (`domainid`),
  CONSTRAINT `fk29` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk30` FOREIGN KEY (`domainid`) REFERENCES `gradedomains` (`domainid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergrades`
--

LOCK TABLES `usergrades` WRITE;
/*!40000 ALTER TABLE `usergrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `userid` varchar(45) NOT NULL,
  `groupid` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`,`groupid`),
  KEY `fk2_idx` (`groupid`),
  CONSTRAINT `fk1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES ('aman','1002','1'),('aman','1003','1'),('aman','2001','1'),('amar','1004','1'),('amrinder','1004','1'),('amritpal','1003','1'),('amritpal','2001','1'),('ashu','1004','1'),('lect1','1003','1'),('manik','1004','1'),('root','1001','1'),('stu1','1004','1'),('stu2','1004','1');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aman','aman',1),('amar','amar',1),('amrinder','amrinder',1),('amritpal','amritpal',1),('ashu','ashu',1),('lect1','lect1',1),('manik','manik',1),('ram','ram',1),('root','redhat',1),('sham','sham',1),('stu1','stu1',1),('stu2','stu2',1),('virdi','virdi',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;