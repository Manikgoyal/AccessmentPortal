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
  `file` longblob NOT NULL,
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
  `file` longblob NOT NULL,
  `maximarks` int(11) NOT NULL,
  `dateofallotment` date NOT NULL,
  `dateofsubmission` date NOT NULL,
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
INSERT INTO `grouppermissions` VALUES ('1001','1',1),('1001','2',1),('1001','3',1),('1002','101',1),('1002','102',1),('1002','103',1),('1002','104',1),('1002','105',1),('1002','106',1),('1002','12',1),('1002','13',1),('1002','16',1),('1002','21',1),('1002','23',1),('1002','24',1),('1002','28',1),('1002','4',1),('1002','5',1),('1002','7',1),('1002','8',1),('1003','10',1),('1003','101',1),('1003','102',1),('1003','106',1),('1003','11',1),('1003','12',1),('1003','13',1),('1003','15',1),('1003','16',1),('1003','18',1),('1003','19',1),('1003','20',1),('1003','21',1),('1003','24',1),('1003','25',1),('1003','26',1),('1003','31',1),('1003','6',1),('1003','7',1),('1003','8',1),('1003','9',1),('1004','12',1),('1004','14',1),('1004','17',1),('1004','22',1),('1004','27',1),('1004','29',1),('1004','30',1),('1004','7',1);
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
  `date` date NOT NULL,
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
INSERT INTO `permissions` VALUES ('1','add user','create new user',1,'','AddUser'),('101','course content','course content',1,'ÿØÿà\0JFIF\0\0`\0`\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0\0P\0P\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıü¢Š(\0 œPN>•Éülø×áŸÙçáv·ãOëz†<;nnµÛ†;aNB€Yäv*‰\Z‚ò;ª(,ÀÊMF*íŠRI6İ’0?kÚÏÁ¿±‡ÁëßxŞòk}2	£´µµ¶A-î­w!\"+Kh‰dÏ†8$*¢<É\Z;¯˜şË¿ğVßƒ?µv±‘¤kşñ\rÄ‚84¯Û­”÷,z¤Vx$cÏÈ’—àü¸æ¿?lïÛ#Äÿ\0ğP_x¯W†ïHğşš$·ğ¾+ƒıƒfØÌ²…%MìûU¥e\'`Û³*n¬ÿ\0bØïşæ‚šö·hSÄú„Ec·‘A:L\rÖ<v™Çß=T|ƒ>ïÔWáğÙj©˜MªÒÙ&¬»&­¯÷Õ¶]ÏÆ³oªÃ1ö9|#:QÑ·{»Mmå½÷?[–mà\0§½<Œ×È^ø•â¢Ge©\\%ºÿ\0Ë	›Ğ+dÃëı«â˜,:Å€‡Y­I#şøc‘ø1úWÂb²jÔâÔ—–ÿ\0q÷Ùgá1PN¢po¾ßz=–ŠÂğ×ÄÅ¤-£m,§şY1Ù/ıòØ5·ïqé^Tá(»IYŸIN¬&¹ î¼‡QE5ÉVdƒÅI¡GÄş\'ÓüáíCUÕµ+KÒíe¼¼½½™`¶³‚5/$²ÈÄ*FŠ31\0\0I8¯À¿ø)—ü¦ûş\nAñŠŞÛÃïygğ‡Â×\'†ì¥F…õû…µîcl,-âp·°Y$)Uÿ\0¹ÿ\0‚´ÇûdøÚûàïÃ]Oí?	|9yåkú­»~ïÆº„NÙâa÷´è_¥Ä©òæ(Õåæ¿à›?±pøÉ®Gâ¿Z†ğ®Ÿ/îáu?ñ9Oú ;À…FóÑˆòÆy·õ¾áúX\Z?ÛYŠÕ+Á?ÏÕôí¹ù/ñlLÿ\0±²×y?¯Å|º÷Û¹ì?ğMÿ\0Ø¤ÇgañÄ¶{‹m¸Ğ­&A“İo\\Î/ÂQÿ\0,Ú¾â´ğâÛÆ	POÒ­èv+Jv¨t\0ZmHûkÌÍóªØÚî¤».Ë±òÙgB›WÕ£ëNƒ…\0æ±u6ìH%•ojwÁé\\Ö½ªEmk4÷Amon,³M\"Ç(£,ìÍ€ª\0$’@\0x®<<\'usì*`cJ–†7‰>$Z|?Ğnu]ZY•™O’(Ì³Ï#¸(aŒs$ÒHÉh¼»º(äŠú—ö@³ñZ|‚ÿ\0Æw26¹¬ÜËzÖjÏ‰!#³IG2ìDä$†•å+¶2ˆ¿5~Í?¦øÍâ{?‰:åµÌ>\ZÓK?ƒôÙ‘¢’BèPê²£r³M2ÂŒ7Co#±Û$ï\Z}{ğóÄöw–­¦¥Ì?oµùä·)	ùHİÁ#Šğó¬ljËØÒWQİÿ\0]¦á¬®Xh{zîÎ[/-öî÷ô:‡b£8\'é_ŸğpOü@Û]ë³‡Â=jDÔ\r¯Ä?XËƒ¦ÆÃ\ZÚ@ãæE?¿qş¦3å‚ewò~”ÿ\0‚Øÿ\0ÁFügû5x/şgÁ-#S×ş6øÃI:‚Ïk\n<~ÒYŞ©7˜Ê’\\<‰$vÑs¹ã‘Èa—\'à¿ìßû7ëş,·„à†şÃT±gºÖµ •otØ÷ƒ-ÍÌRí”ÈÌİÙ‡Ì,=~Èib±\n¶)®Uª‹zËÎİ¿]ÅyÍ\\&Æ‚|Ïí%¤~}ÿ\0áÏZı„ÿ\0ei~:øº–7Óü-£”[ù¡p |¶Ğöóu=Nã’Q[öá.“cá­\nËOÓí`±°±…`¶·…vÇ(ÀU€üry¯›şx\'KøQáK\rGƒìÚ}‚mPH/+gæ’F\0n‘K6`\0\0ôu\Z -“ï_£q$§(¨­–Èü¿%©N\rÊ_İÁav#p@â¡Ôup€€Tâ°-ü@L\0î³µ={pbWÀá°NSÔúú8˜G[—õ=h3°Årÿ\0şIûYøşk	”·Ã_^˜µiq”ñ&¡€Ö\0ÿ\0­¼Š|şÒÌ‚vEq˜ÒYë?ş!/€ü5ys§¹.<G­[6Ù4\'ÎÈân××\0ÅyÎfúëÂ:†~ü/†ÖÚ;xOÂö\Z¢…ŠŞÊŞ$ÀQªŒr{VŞ9P_UÃüo{tôóğO Ë0‹şÓ_HG¾Îß¢üô2ş/üDÓ¾\nø\rõkè®.™d×NÓ­SÌºÔî¤`ÛÄŸÇ$’2¨ärÀdVÏì»ğ6ÿ\0Àz—Š<[,ÿ\0|\\\"—Vš)–útI¸Á§[î`Şùl6G’L(e9ÙÛÁ·ß|wkñsÄö’ÚéğÆéàm\Zå\n¾k\"mJd?vêæ6!\rñ[ÈAØÓË}\0ª 5òø†¨Aáá«ÿ\0ÛW’ëİù%o\rbj,]M\"¾ëöŸ›[v^mŸ~ĞÚm§ÃÏø+¼Z¯ok$_¾ÛC¡=Â‚gºÒïnÍäQpÉ\rı¬˜ÆO˜Ägi|tı‰ş~Ö¶Ïâ_ÀÚ½/§j¶²5–§¦¿÷­îá+,g=ÑÁ=3_@şÙÿ\0±¿‡ÿ\0lÿ\0†Ú.««ø{\\Ğï£Õü7â=\"A¥áÍB0Á.`b9Vtto•ÑØ2ü¯x‡ö‚ıŒCŠŞOŠ¶È>6ø}dÍq\Zq%æ“Ÿ23¸˜ƒC\Z‚^|õÚ’uÔ%FV©k7kÛgé¥·ë©u$¨¹*±nwºW·t×n·ó<ÓÆß±GÆ¯ÙÚW¹ğÍı¯ÆÏÃó}‡T’=3Åê:î‘|‹¿P³ÆØ®zâ·Â/ÚÃŞ0ñ8ğé—Qğï‹Ğn\rx‚ĞéÚ¸©&%n~İåı¡_U|ı¯üñÿ\0Ã)àé&·h¼×·@g‰:Ñœ 9`Ìdƒµšµ>4üøoûQxM´oø[IÖm¤mèobVx¤$le]{7½°y¯j‡ãpíPÆÅ»wø¿àŸ9Œá,-:ø&¢ßmŸù9oâ61€Ì@ô¬_ø·U¹Õt¿xnÚßPñw‰$x´»i· Tç^\\mÃh¡|](”‡•MgøÛö6ø‘ğqqğãÅŸğŸøuX0ğÇŒîKøÓ<Gkª\0Ó·…[qĞ\0W»şÌ?\0&øM¤Şø‡ÄmmyãŸ\"6§<D´¦ãŸlH\räB¹ d’iHS&Ñèbxƒ;©†ÖoK5·›]—âxÙwc^-SÅi­ÓßÉ>ç_ğàö›ğÀpèö3Ü_]Ï#^êz¥Ù_µj×’s5ÌÅ@˜€‘¢¢\"ª\"¨§¡hûg|E’ÎXüÏ„Ş¿d½Èıß‹5H[Øÿ\0~ÖİÁó‡G•D$—1œÏ^êÿ\0>\"\'Ã?	Şİió<Kuâmf×´b»Q¹êbJrI$`ËG\'Óşğ6“ğËÁzg‡´4½G·K[;XAÙj0Iõ$’NI$’käİIP^Úo÷³ÕwIı¯WÓ²×±öŠÅIP‚ıÌ4}¤×Ùÿ\0zôoNæ¾\\ÑEåÈR:îR2Fih œi¿ø%çÂÚg_“ÄsiñÙ—íø¯ÂÓ\r3UpÒSÃÀi‘ÙGİ+Ö¼;^øaûE~ÈIı«kÇ¿ÁÀÔô˜ZÛÄv±ŒdÍkó´Øéº#s,­’D+Óïúlˆh# \Zô(æu¡eRÓ‡itô{¯“·tyÕòÊS—´¦Ü\'Ş=}WÂşjı™ùÿ\0ğÓö¦ğÆd×ärk­6ñrÃ.~h¤…|È§rs»½/âoÅmFÇBğç‡¼1ko«xãÅ±%®•d²‰[gÏq+”‚0®ÎÜíTbÉåÄş«ûGşÂ¿\r¿j)–ûÄ[Ã•oâ.f°Ö-”•~Ñ‘ƒƒäÌ$ˆ7#tªÿ\0²—ìkgû5\\j:î¿¨øÓÄwª,âÖ5+xa¸¶°M»-•b1’¡¤uU2²Ç©1ÇªxûèŞëì5tßøº¥Õ5w·šæ©Æ¸¬÷šviu÷]ıç²i´·égÖ~Î?lg¯‡‹¤Au&©©ŞÌoõVXÄsj÷®ªv\\«µQ<‘QÇ8A]õWV¬êMÔ¨îŞ­­\Z0¥Nš²Z$QEfjÿÙ','CourseContent'),('102','lectures','lectures',1,'ÿØÿà\0JFIF\0\0d\0d\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0\0P\0P\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıû–U†6weD@Y˜œ\0s\\4ßµÃ;yZ9>\"x9á•µë@Tû2¾lÿ\0‚®üF¿ƒûÂâi£ğù²—UÕ-ãn5­ˆ‘‡•<¹c¬Í`Ô×äóşÜ7•Ì–Ú/… …ÎäI#º‘Ğ€¸Cıà«¸+Ã©ÇVÄÔÃeôTı¹›•µ’ºKåıw×‹ÊòÚ«æµÜ=¯7*Qnê6Nÿ\0zûımûåÿ\0\rOğÇşŠ7€øÿ\0¨ı§ÿ\0£ş\ZŸá‡ıû˜-?øå~Û—Çàäi¾ş¸^òM8~İ?GM?ÂÃşØŞòU_\'Ğ4ğ3Êÿ\0[¸Sş‚¥ÿ\0€?ò?o?h_Ú·Á6ÿ\0	µĞ>\"xMõC=¢F,uÛfŸc]D²mÚù»/’9\'#®Cögı«<;ÿ\0	¯ˆ>\"h+hm¢h´uøŠù›Ü†I3œc Jürÿ\0†ëø…ÿ\0>ÿ\0¿7Ÿü•Kÿ\0\r×ñõ°ğ¿ıù½ÿ\0äªóªåÜE<d1^É%n^}ú¿¿ğGe>8á8áåCë\rİŞüëo//Äıïÿ\0†§øaÿ\0EÀyÿ\0°ı§ÿ\0£ş\ZŸá€ëñÀcşæOş9_çöéø‚zéş?öÆóÿ\0’©íÍñ\0õÓ|(í…çÿ\0%W£ÉÄô\rüãÿ\0[xSş‚¥ÿ\0€?ò?|—ö¤ødÌ|Eğ!,p\0×í2ò%vºn¥m¬iğ]ÙÜAukr‚Xf…Ä‘Ê„d2°à‚9Wó¬?n;\rÚ_„ÈÏüûİ“ÿ\0¥5úSÿ\0‡øÃ©k.²²„Ëm xÃÃçZ“NiL‰iyû—Şœ’²J®ÀøŒŸº\0Íc³=zt³\n**£²jWÖ×Õ¦_Ê3:ue•×s•4›N-hôĞèÿ\0àªöŞŒ 8û“ÿ\0B¸¯Ç¨t=° Ú\0¯Ù_ø)å°¸ñi\'ø|6ÿ\0úÍ~D‹Pz«f¾—h*™¦cëGÿ\0I‘øgÒ;0“8;]b?HÂşÄÿ\0`Qı‰şÀ­ß²¯÷Z§Óô959JÂ„…ûÌN×éO	®ÏåÊyö&rQƒm³›şÄÿ\0`Qı‰şÀ®î/E\ZîšYû¸P?<Ò¿íå\\Ã,£Î~˜¬}#ÓXŒÆ×ü.®pØŸì\n?±?ØÒê:š\\Á%B3Ê°$«U²îµm$Zº<Ê™ö\"q›i£hƒ#äú…ÿ\0‚³û/‹<	€p<$Wÿ\0!A_›BÕr>S_§_ğIûAˆüã>#ßıTUùÏPP¯ÿ\0¯ò?¥>9”ñUs57{Rş”Ï_ı¿gêEãÉğÏ”9¼Î3Ò¿\Z’ç\n0 ­~¾ÿ\0ÁIõeâ‹…O·óºÿ\0\ZükMS|hC€èà:Êcúsÿ\0¤ÈÛé+„lMÊ¶úÇçDÚVETnr|İÍtw·ÑøsKDaò¨\'ïäÿ\0ŸJã´H\rj×s‚€uïÛõ­oj\n·v%Èî;¹àò¹ı+ôZØˆÊq‹ØşlË²Ê´pÕ+A{Ú$û^ßçøí´‰5U²¸2# zóÀ§E‰¬gq\"ôËÛ\"²¼u«<mnİpÿ\0õ‡ó¨‘¥ğÖ¯h¢u™.˜)€Ü€F2}x5u{üºSÊ£\n›¤ß-¯+»İìÍø/—ÄVÛN‚;ˆºöÁéŸÏƒõ®í„©L89nkB{¡oãr„qoààğ…®ê*5› ®\0şõ¥LS²Ùêræ™MiAJjò‹q¿uºeß´–ÀÚÚ¯Õø&%ÒO¥ü/UHÃ/†$(İ³/Ê¿$RÃ‚\\=ëõSş	A©ı²O‡	vøT7ş@ükóÿ\0+)ÖÀÛùßäAı\Z°S£[4r[Ò‡ş”Î«ş\nš“Çã*%B§VĞ\'‚Ù˜…Y]ÃÓ<YÏMâ¿^×VÓØÁs¥jv·|’Å5££ÆÃ‚¬È ú×ô›ñÏà‡h_\rÄ0NVó­n­¤\\ÙK‚<ÈØ‚3‚AV¬8*E|û\'üªÚ)˜[|@Õã€K` ·uR}Âì+äiTÌ²ìe|Fš©\Z¼·N\\­8¦¿Ÿ¿qe\\C†ÃRÌ*:r¡Ïk+¦¦âß§ÂÅß‚¿\nüEñ¯âZlôÛám-÷ÚuD¸ŠÖâÚ7;E®w‰2ó Ïê9ı’>\"Ç§2Â7&°£’èWj¬[¸Xbc>?Şr¯÷¯í…û:]şÃtÏi¾3¸Õu9u%Ñàµ¹·’çY£y]NÉHlpûX>PïŠä¿eO|Hı·-5İBÁ¼¦Ûx~x`7‘ÜşşWVrŠc9!9í*×Îcø»‹ã›F–\Z.GîIÉÊú¶Ô£¦İİİeşğ’Ë¤ëN¥ïñ«Y­,œ\Zèú©~GæâŞx“J‰måÒ\'½?¸M»>=:sùŒÕ2ÏV¼ÔF£©ZÜB°\rÉˆü¸ïì_Zı0ı ¿cşË¿µÜŞøKQÓ´in¶Vwz˜•–[ˆ­)y1…óç²×û\"ü2ñ¯í«x†ÓM]B“ÃÛM!¾¾ÔÈ¸´ÀmÙ/ğù\'9şğ÷¯¢«Æ™„+G\rõuí$®•úkòèÏ&ƒ¹<©ûw‰n}´¾Ÿ7º??Gˆ.MÕŞªÖW…\"fµŒÀÛœõ\'§¿C\\Ô—\Z„Ò3µã;’Äı¹\'¿Jımøİû|Iø\'ğ›_ñtú‡…5[oÚ5õÅ½µö¬²4)ƒ#‚ÒàMÎsÙ\ryïìVºí‡ño^ë~´±Ó¦Ö`k8¤k¹RHb*Í#‚ØY˜üÌH©|k™Ó­=L:S–Ë›Ë¯ù\n~\rdµi:ËÜc{û¿ğ}>Gæ¢6 dPº}û± [g,O \0rkõ—ş	g}aã?é—–ÓÛŞé&î	ÜªZ£+ÌER:ƒŸC^Íÿ\0­F_ˆ:›¡ûÀiÊ	œÊ‘¯pı?eï~ÍZ=Ô\Z½¼¿Ô6ı·R¾‘dº»ŠJª¢¢îl**Œ’H,I5ˆ«™æXŠ3ÅÓTãM¹i.fİ­m[‡x_(áèW–¤ªJ¬Tu*I;ßúÿ\0†ôj+&ÿ\0ÄÒÙgn—¨Ì÷súÖ¡ñbêÄ¾×%Ç¤`Wºvÿ\0Ád¼~šïÄxQ\nI…§É©Î¼2™®Ë@}>¸ŸĞŠúş	ğÀ|6ı|?q$^]çŠä—_œ’,Ä}mc·üsô\'~Ô_³_ÅO|Q¯	jV–:Õÿ\0•ÃOn|‹T	Rló7İF®WÉ<dâ¾ÚÑ~5¿…4[=3Oğ^¯ma§@–ÖÑ E(TQÇ@ Â¾O)ÂÖ©™â1µ â¶ÓW[]_É/¼úÆ½(`há©I>®Îö{ÙüßàaÁL£3~Å^-AÕ®4¿ı9ÚW„ÁmM¯ş\"I-c¦Ÿü‰w^ÁûKx“Pı¡~ë]UÑÛS’ÖAvÖ¦àEäİE>\n™İåmûÃ³Î0xOØÿ\0áş¥û+k^\"½’ßS×ÿ\0· ·„\"iiäyM+d“#îÏ™íŒwÏ\Zc2üLóº8¨Ç÷q›ºÑûı/~«eÔŒ>2„rº¸yKßrºV{{½mn©õç‰ü9gã\rj:F¡¸°Õm¤³¹ˆğ$ŠE(ëø©\"¿%¿eëùÿ\0fßÚïBmLÄ·×¤Ğõ9°v{+‡$uEÒß\"‘3úJŸ´]ûcş)cşù?á_~Ôÿ\0²÷Œ~)ü×üIáÏj’é^#X®eÌ†şPŠUİNX§˜HÌ§œäâŒ%iÆ–\'\r)Ó–É]÷éæ—ŞVCˆ¥T¡^IFk«²íù?Àı%¢¼¿á¯Æ/Màm5ï	ë‰­­„Q*¨ÉöŸ-|Ü$¿v8ÅuÚgßR‘i\Z”oÔª’™ç8çŸZú˜Kš*VµÏQ³hÿÙ','Lectures'),('103','attendance','attendance',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0ò­\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\0bKGD\0\0\0\0\0\0ùC»\0\0\0	vpAg\0\0\0\0\0Ş@@Ó\0\0\0%tEXtcreate-date\02009-09-28T11:27:59-04:00+\\Ûı\0\0\0%tEXtmodify-date\02009-05-29T10:46:34-04:00G<€\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0#`IDATx^Õ|	|]e™÷ÿîknö=MÓ¦ûF¡)‹¬*›(âÈ\"U@‹~ ²ÈÀ(8\"ƒ|*# P¥ß hG¥ÈÚJ)mi¡tO“6Í››»ï™ÿós’{Ó¦¤$Q¿·¿·çæÜsßóÿûìÏóÓ\0ş?oéDV‡÷ïò¦T\0{Ûwcû†ÑÑ¼ş]ˆÚˆö!“N¢|Ò\\•‡ÊIS±ò7£cßA”ÓfÏÀq§^Š–Ş\0oqíßĞ8\0÷~øø×KĞÙÒ	/‰Êng·6v‹0³d\0áií¶w;QZ`F#\r§%‰LŠß\'€9§âæoƒÙêœP ÿ¡\0|üß®Åïõ8Ê+\0‡İ›e\0V3»:<Ó\0»¡ÎØé„Û–…Ç‘…Ã’…]®³\0±”	ÁHÙpÛ£¯¢~öéâ?€O>²Ïşâ!TT:a#X‚a#`6+»¢:êŸ-qÃ7Üvù>§m\0+äõNv;“\Z»;ÿcNwÁ„€È©şıÛ[kÇ£?w‘™¬‰¬J0„¢„P]–S”óÉŒ	ödÚŒÖ~;‚q+Yy\0eŞ4Šœ¦\0œ¡Z”kmVjªÇV4NØCşİ)°§»\rg_‹Ê*¯b?a[aQÖªN…BmvL-‹\\âÃÏ\"å·ÒL:»¥†üÀu?|\rsÏw ÿîøìC_@A¡™rË‚8)+š\"•¥Mƒ”&—s<Æy”kâ”qÒ&•Äù;3RüN(4KÊ0Å01 rSl4PQùÄPáGîé€ÿq_9cÀòB;–ÎÌbAmÅ®4\\d[¡%#‘1!š4#ÌI\\`9VxSde‹bqÉ\0pÓ\nHaw‚Ì1D¡ğŠ*¦LÈ3Œ`¸»]İpËoÃæçQŸw¾öÒ¸O¢vÎR$“ÔºT\0“K’¨/N`^uÇÕE0³<Ù•q4”$PæI£ĞA¡#ŸK”;#\nCº?fÕ(U(”œ\"€qY€©YX|‚Úˆ\0®}ôN´nz© ÙTmï¯Ç;Ï>ÿñ¥Æé?C“ˆª„bäÁı+Q«¢.¡ ‘cÅ¯’Tgâg¡À˜t~\'`u…¬Š•å³t2Pm$iáq‚Ğ™{¸¡£şn˜i­úwmÕf‡İáD7?”V¢c×ûã:›êúÙò“úC;¨ „ƒ	Y×¢‰°mˆ`„y®€¨\0ä9éÂª!›:ŠŒ*”ëÃ¼>Äë¤ğ‰jy\0¦quŸ¾–°;İˆövP\0[Ùmˆù;aµ; àw3{HfÈr\Ze¹íüL@Cq‚À.fœWÀ\\i’\0Œ[ˆiŠE(OÀèà‡ø]˜‹“ Lœ¨–àÿ<p¢^DzÚ`¦êr–(–1ÓÊ¦’°ÒÎHÇÉoãÜJjçSVeI=&‚\",š¦C_4…î0{HFı±4ÕL”ÖÏ‹;ú3dû„ãiø£IR]FQ¡p„}íçç˜ŠÅĞÛ´ÔÖE\0-°âLò(ZÈÊ³…Úè8·êÉóŠ‰ç@\0Énó\'Œ³\\‚«O»_:ı*\\~êU8÷øKñ‰™\'åcŠ`%pÂŒ“pÓy×ã¶®ÁMË®ÄU§^Œ9µ³ĞO …ò„Š#}Æ¼SÆyÆCÃå(”t#ÖG\0ùYºP 0€°¯R¼ùqn\r Ğ‰â¬ygcZu#\n=xœ.Õ=¨-­&`Kpı²PWZ‹ïñ›8uÎŠ.ª¸|6J|E8eæ\'ğµO]®Ä{<IùIŠœ;wÑ8Ïx\0­Tñ`RÑL¤¶t‚OEøÌÂº‘ıSÊ#Nt¼Û”úa_¼h)*Ëxoñ>l°3cc·Š1‚m>;®;÷JNk€J;Ãë¬¼ÎÆó¼–Ÿø[;C8Wü)š=4–\0¢Z99¼>DèZ‰)ou:a÷BÎ9¼…\nD“‰ZÑæœKJW:c\\İÔ¹(ñğA«ê	mBÑüŒÆØåHpìF€´Q¬W¤³’£•Û(«8¡@\rHŠ\Z.t©¯çÎ_@ŸšË´Åcâˆ¿ÏĞîò\"Ò×\r‹Ã›Ë‡8Y9’:2J©²PiÁş^üâÚsğâ+Æ4¹«ŸÆgD‚/®€âb9Š(-«P½Èc%R@Êd]¼(9­¾×Áäõò{\\~g6ÛàôšĞô‡g°ñÉïi#ı8@ehÛ,£¾1™Š‰Æ%£ğ˜Œ†Í¦ÒşüğŒ”\"FÖKkïMX“	jßA2)ğMg€Fù+ÔiæQ‹	hòYı=¢¢J}Œd&NJ¬C´³½{Ç×~59@Ú~R[V¼qİt’*iÂÿ²´¬.2¦ƒ=HñÁç~ŞXğ£‰Q¢Ø±ãÆèñØ)û¬BŒÕ™„â<]™ÉDÄñÕ§¨Îë×¸ÅŠ&cŒV—©g‘yODË×Â\\=™œä™ŒL“úÌÍò<gâomÂ†ßüf*œ4Á^pæcšWåÜã†O¢¶¤íı~E}Â¦R•\0\'ÈåšÁ\\D‹İIsJ›§4õ½¢Pí7¼ÈËX2ŸÓÇ<J\neÓŒi£baFâ•)Ğ8A¡D¼ÿ¶ºÜè=Ğ„h(ˆX8„/ùÊ˜\'UÜ0)X_Z}]íJ)hæ“Fy¹+,s1Q¾U{\ZlŸ·Ò›\\§Åu»•\0†QšA^`ñÔ9cëáÈ7¤¹bYR P›€\'ÊC>§9Ga){’Ô¼éLšæ‚ÇsÉ˜\'euzÔxõ%ØÕŞª€AyŠoóšÈ=†¬D6‹@Ştğğ\\„H<F·P¨5Ã´§kÌsıH\03©†€8Õ	^*-`Q3£¯£éT\Z‘`\0§^±|\\&ä«¡\rHªo(«@KW‡¢#MBõ‡AHÊp¡UjnX3àÖ‹	ı‘0<v¦	H\0%\r³Æe¾ÃÉ[Æ¢ÚRXBÀIOTW1Ğ¾_iÜ$ÿ6ÓœMCu¼Zqã\\Øh&mÙÅüĞPÌ¨É6ÁqK‘Â&(ñ©êÌÃZ;Ÿ¦­¸ a)¦©ÛA»p\"Z€3J,\Z&•¥p–ô,&Fï$Î HóæÓ7İ;®s™yîHÕ~L-¯Êk†ú×o¥i¢lSh°÷ ¶ËZâŠ\\üã§K{Õég_:®óÍ,ß¦S5s!âñ8£\ZõÉDB?£Æ´ÕbaLYôIÔÌ˜?®*¬Ÿò™Ç1Ÿ!ÊK€ÓÀ3Ì§A*ÓÅBZ¥Vö¨acåR©¡XD†“u}uSQ{üã:ß”/æs)ºº»%¢\'„?F8P¥æ=÷†Û&d2‹¯»>)F|.QéQ¬?EuİD¹,şºv^ãh\rpİr ,·RnŸ|ó¿MÈ|AQe“f-@w_\0m=´öôa_Gö´v¡¹­ÎŠzlØİƒŸ>õôöÍ9ÜS™ì.%\rê®ƒ-”½‚—¡{)qI3ÁŞtÖÎRóš&Hó‘åË¢-xÖœxğ¹éĞ“[Ü+š:‚øüMâ?Yß®Y?î+ku{O\Zlœ§A”+™¦i\"2P€ÌR¼hÍ¸nèú3U&ÛÄ˜.#FñÔª5p[¸zºUæ3ş&”º­(á1ÉIu÷öSJ4düÃäV‡›\0&tOÈ`d¹OVéŒRç §¤Œ}Î3×VÔñ*GãŒ(¹Ç}‘‡8ÈÂülfêkxjåjlË6bc¤\n›\"•x\'T…uÁ*¬	Ôa·efÕW0PÉ*(U0¾­jÆ<„Ãa¥¸6Í¡²QtÏNU=ßÎÑäa‚Ê/N¯\Zgew¸§0Ì¹“6SOÔ„W{ËñfO	Ş`«»ëz|XßåÆ{-atvûiÎĞS™\0\0+\ZfÀ[^ƒP4šë¥i\Z\"Mu­1x^ã7ÿh,ÁE@ãâOï\nf´A\0EöDbqôC÷¦·!Çˆî÷&Eó‰E¨G>Ä7ˆvò5+Ğ×çg†M£Â¡–ÚğóC\'i«†9gïôÅØû×ñ—Ó#²p<Tà¹CºŸ)ˆ›•–¨qnÿóúÛØòãÇ`vW¡/Ğ¯…Õ¢	5C!¸kñ‰«¿†­<Œw_ó(F8úK)PüÑ<÷h¤±¤²_%&7Ní¿nÂ§ÿù~ş#F‚¨ÏÁ[‚8³„ÃÈğˆwL1(°à¸Ïß¤LK„^ım¼¶îİqšmş0ƒ\0æi³#ÜJ‹½Ñ¡¸yË6œÿåïâ+şç%[1£¸Á@€1A3ù6¦0ÉÆ£¤B™¿?Bª¨6&•$ÌŸ¢²s3èğuO·ıäE|é›bËÖÇÈA\05³dô,3ØÚÚŠKo¸×İı$ZÂ&,MîÇ‡^ªĞLÔ¢’$ª\\z%:»ºU”ùHM¨Š 4#Ğb\nY”ÇbÃ\0Ù9B§ÀC7ôfËlhéÇ­½€åßym™<‡683IàŒ?FD>†‰‘%o¹û§¸àÆ¡ÍÏJÖ³ÌìoÆ5Eiº~¤èƒg%\ZÔß¯³–fÍ¾®>´v÷©ğ”M%ò»€×IÊ†úÉiÔÌ^¨\nÑ…úúúèö%ĞÇE˜Ê\n®kšĞÔÇÖ&?®¾íÿâ®ÁûŒ­P`@‡¬Ø(VÄ”ê\ZmÛøÁ|ûObÉçnÇÛÛö«˜co\"©Én|Ã@]Æ4ÁK`‰IÆPäq9PÂ™dã6í9€Í{[ñAs;¶r[ƒ:6µaÃ®$hóy]˜0{ñÉÊ¸î\'•Û	bRÆ$ˆ­mXâ\ZÀç’{ĞÍê‡Ş@ommÅÙWÜIÛ÷ã—í\rèædGµçFÂêd÷Ì(´ğs¿{§^v®½ı?ğòÚ-*p*Ú>kµ£(À·2Íèìég\"?ÆU](&øÁdE‡zøS.ı\nzcÌ½L­FE¡[eã$bc¢ló:L˜^U€Šbtö`ñå7ÂBåf£òèÛ²MÒÇ[›Zp!Kä–w!A?¹??”À/¿Ÿ»ş^ìÚ½w´41xİ €N\')ğ(v’‘é‘šxg|á|ï\'+è*…#J[U09o¢/{[h,LD$e\Zê­ófFÁµ²;Yö4ÊËÚQVâCCe!&—{P]Dİç‚“¥Ú;1ié1}î\ZøiUĞıÖ[ŒD§óÆN“\"[vïÃ5\0&ö#e±«DT/£NÍİ\\{×¸ï¡\'\nÄ!\0é…Œ?eYˆµ¸¶·¥ÓÏ¼¡°0+˜—êHj’BÆ™Ó1Üºwµ€xˆÁ[–ÛEš;:Ğ±cKìœ*uZ=©gŞô\0¶·ö¨\n|S”N·‹Õ6ìnmGÃg®Å‰KÏCœ!|)«û/aĞŠeØøbgs+néZ_¤‡Ï,@i	v ?†?mØ‡ó®¾{÷îƒ\0z9¡ÑP aîˆ×2¼ínaÅı¿Ÿ×=˜Ó0Ò¢jl’aÒdÅƒ¾YØØ„ÉúFW´Ü.Ztïo”{œ±ÈŠªj\\ö/ÿ‰.{:¨„ıšÃÀÒcÑ©g2İQ×Ú].ì~ıuØ¨ˆ$ø‘;n–÷²3âŞ\ZâS\rŒÖPéKËt)£Nbˆwö\'qÍw~†Ÿıò…qÀÂ÷¨\0”…š\"Œvä¶;}3f}çÅ£1ëÆ¶46¢S”]fö¤¯\ZÖ.ÁC®:tóÁå¡²1#ŠD´0e×gQÃ«Â\"#”8À`ëEËïÀÌ+nGfá¸âÎGIY™2¸å\n@öÍ<¢\nCE1É˜2¶•‹ñ¤­ßŸt\nzÊ¦ÁJêÓÒ¸Có”LŒ$ÎüŒL=½z3®]ñƒ#‚8`I1Ë:”72ràÒŒÉÉ1FßÙhËoı1Ş\\¾œ{=<èé ½ƒf‡ª¦’@T~ÁfwxPá+E{Õ,Ü?ù<ï,cõWf‰õ@1AÈCXûê«pP™0†k)÷¼ÿ\'ÏâŞÇ^T·Wé\'<¡Ø]¢ów¿Sf–Œe\"x¦p?ÖX¼¸‡÷Ú^{*Y­àfrJ)ˆrdWaÄ~¹äÚç]õAĞçq©ª§clª\nAU\'èÿôÊ)ûPƒsÂ]ÔÒúú]8õGßÄ-…ıxÚÿT›¢ü.¤G–µ}nW9gÇ33éí£\"(ÇÆI‹p÷ÔObÅ+ó.Y1¤éMlâ	4µµ©r5¡D1®ùù3øÃÚØß›Â\rßº_—.×tööbícÁ#àQ¦ÙèÎ}\0îŸrşÜx2ŠŠkPÀŠ3eg†Ï$]ê-Tñ€öIı/L-¤$i\"*:ƒ)œsÅ·â€Š……”9—A€ÀTPyÎ¨\0ûÃQÜşÀSXñŸ/ã§u\'qšÜj`và»ÁMDØ?CşZZ2‡?r> Zxm¡«^º`/Î8?¼²ª°qtõjˆªÚ¾}»¢Â×ßz·üË(ôzX½eÁ«ŞÀ“¿Z¥¾kniAc‰¡_ÿšiX;l¬³y¼fó)˜KPâ.\"[ÓT#µÉj¥!R@`tí¹¥çå(Fy„\n¯+˜Å7î|øó\0R6@ÊõsÆ¯Å¼cøÛhèƒµöz<ço8%Be¦~©±Õ=ÃîCk…B²ŞV›Å   œÑğ´b}3ıâĞÚµÜvdÃşæ&œqñ¬Vu\"Ì²»p_\'\nhz}™Aˆ}M{ha#µÆvï¦©¤•„d½eLK”Qh‘é1§du6=$ ;ÌwB0	Šƒ•/¿‡6\Zè¹mH‰x„‡\nv”|É	aåıˆ†H-µíå%<çš®¨0F“à´d;’qMŒ¾‹‘cBÅˆXV‰À½sß}˜=m\Z*+«p×ŠF y\"ıìğs7ÁW—_ºº:,œ?¯~ë[ª®PmNä³ˆ¼fæNUœ©r£låó2®É™ûP}	«şøÖát8´’ÚÑ6£BTÔËÄ¶xÍQ£Vş˜w÷Év+n]P‚úğ\\|ÈyJFø¢EAÒ3ì‘­[ñá»ï\"Kãÿ³åU>Ä:[ëÚ×ŒGt\'Ò¼WÓ=è%µH™¯’ÈØXP}\'ºñãv©…H1—´k7}Ğtx\0å¬Óaµ)“7\n‰ÅÁÄÓëöjR¡°qPhˆ7jÒ«½ô|m®]8ü3£ğp\'\"’BÒürè ]÷æí·+¹$›îÛ¶–ÊÀŸÏƒ;×#Äè³™šúå›of2L\nÎµß\n:RR,5Âı*´áßçœ—–ÊUŞ\"ş\0åıûGĞ¥üáÑÒàĞu\"˜]6l¦eá\0YjÑ$“;Z¤cd˜ÿl\n,Œ‡HyC&8õ®YƒæmÛT±“ÛiÅùW­À_ºb»Jÿ@SÚ¨p²a6É|Åˆ\0´°9çÅ]5r?—§ê@gŸhÈÍ´UĞ×Yq´M\0’#™ ‹¦ˆĞ@M6Ê}ÚŞÓ#Q]Şw\\g’	%Cù5±;İn¼y×]°ò%\nb¼²v3Ö½û!S qØ}>¼òoÀ+Ô§ËNE”evnÎI+Í*\Zvt]æ#\nRÀSsSiSmB†\"açİ:YÛ+WRDcúã â6®w@ï´ÒÎâß“Òaî_Ó&Ï\0ŠNjG†ü9µï¦Ò)0Kş×ø	\'âßtízÛÛ°}Ï~*°¸ÊO7ìB÷ÁV´ÒpĞÃqˆfµ^¼\r?j\ra,€¥HÑi;ÄDÍ–TjšBjÛ&†Ğâ\nà<\nl¨­C¨Sg]s‡™>5o[›e5—xš´î…õŒ²aõ€‡Å‘“!µì-k$³JUòš6–î¢œ[ÿƒïãí­0ei\"e’xo_\'ŞúÎwà1dŸ.ÿdœ†Ìö•6Â&6ßH7PtÊT‹8\n’sV¡ç¸[Ê¶ïmVùk:ÀIÕ¥c\0øQHL²=ğÑ1lIO› ˜|šÁ¥|Îé|p\'íÁ7+fÀJ9jP¡°PaçÊ•øïÕ¯RIE«^Xö•Ï+s\'WÎÚxïWªçÂÃÚ-@¢wÃ¸Kæ\"‹+rN•Ë?cc¢du½>YıúÈ™æ½Tıd€Së«4lŒMn—BoI(Ò×ê–C˜:\"n³œ¨„”´N,xÜV5aL•RĞ©P¢4É—~,gåb%^xJmÅ5Ìõêş®—¶ßÎÊ9\\Úõ×(S†ÿIp†æ÷jó’uÌ“Ç\n?]ó$Iµ¯+Œ{QÊBû^æÏ%Ú“àô)5c¢À´hcj_Q\"M¯{¨Xr}8Ú„uöV¬¤=±ÙîÅ;Åõ _i¼Ÿ‹\0RdaK*ŒO2%³Ã—<ÚH¹o–Oç.v±(tãY<\\ı^šŒ×¨^d›vÔqäMö×˜	^sW¾X?nˆîÀ«¶J¤İó&À9“TaåÇÓ#âß\r`r&¬äÎVo5¼6mu‡·\\wQ>+¯®# ÛP=ŸÔ\"¯!\Z’…B0.~?=tû÷“•5¯Ã°ı„ú\"ì[+ç‚±æCµ¿bHÍ*qMºÍ\'¿ÓN	ĞŠM~’È’k›Ú™ägÈì¿ıÆ‹‘-ô2˜8Tz‘ñ8G™†ŠÒ\\Tı\'‡ö3<5™²rÍüETÏ¢s¿ R2lñV2f\'¾²®Äù@áxÇ&8&Ô…˜È®ê³Òu[W2…!}Ÿ&øirÍø\'l)+öÔå›vN»Ví‚RñÌÖIF°¿-ŒÚx\0/ùÿ„7è(l,œ†r)KÔÅÒ!	×YÓjZ\n\0½ÜW¿¨{şß— üÖkpùÂntùx6¥Ğœ‹®áÚšù4i´¸£¡‘¥îïÄ)u¨ñ‘\n„rtÍ+€¥Hùk¸ÁP\\AE™Z} ıM?‰]¡$ßI¨EÙwúµ¼&ÌÚÈ®ûÛX#‰ayä=üÊÿ\nÚÌ|Ïw\"\n\n¬(`ĞÁí¿F;À“ÍVFäÑ4Ñdá –^q*êÎ8ÚHÓj}j«şhÒ¹÷Ò,.Í@\rÖa/©I2m¥ÉF›¶M›éõ‚\'ßYÔØP4	Ygñ Ù¡î-”\"ìÈ’àŞı[Q~}ş^ÆHt#êÑî¦î\0z˜«¤?~ûSÏj|6Ú„?¸&ãº¢3à-°ÃgOá¸yp±Tâ“‡\0xæ’cøşÊQ4™_’¶¤ï¾æxêÊ)\\¥@R[äR/]«ÑqñĞİ”leB·M¨°b6,òJ6£	ÅĞîÓSí¬Ü×¬§ÜtÉ÷J†‰GM»M¶fĞ°èì8ˆ¯_z\"Î¾æi\\±Äƒ›VanA£ß’šĞ–\'f²áúèV¬ô¯Á…ñ}Xã¬Ãe¥KñCÏ\"xÜ–ÿYqÎqU|QP1ŠŠŠT÷\0?}ú\"Ä(g>Šräû÷ç×›qó…Ó`iİ÷•gàŠ½òC#)³…¿—­İûéMt³2ß$\ZUÆU¬¨EkŒ¿ENnöU!á)W¤)IYPí˜ëİ‡sfD±Ûôüú÷ÅNËe¸åş?ãüóÏGÆ^¬)¡bşÿÍ‹_xçà¬²ÂG·É‰²b+@•\'3Nš‡’Òr J5Ğ–22\npRKØË´å—–ÍÃÎlD”±?±­r›ˆh	åoY\')„&(ÉjkË¬¥‚8lã|,”“ëªH}Ãªöe Şp~õ¿P{ò½XõÒ»˜?­Õ\\ô×ŞşÏ¯ú-Ün¯O\Zß¸‚V/~é£Èç6£¾¶NY’‘~|å‚cQX\\ÚÚZxøJ‚á{ùçwÿ7¯D}Í\\*”ÏÂÚí¬U™3mŞé\\ºl	s·ê\Z\'åË¼£/3dx\Z[‰±ƒl,;—•¹1Èp\Zã	õíp#ä«UİÜÔ¥hznYƒŸ¿°	«~rV?úYÜqı)8kvï5Ói ÿJ˜¢Øg%p¥(b%„¡IÁæçÏBUÍ$44LA3\"ÿ¤–EH.¿röÓY—íİş~–`ôaÖÔZ¼¹ò_ñ—_İ‡ú:¾q­º“\Z9‹FÊõ6dğ£f_eZg|¶rÇå»EÃkmÅ”|\\[9õ2İt1ÆH£lò¬â—®¿ìÌm,Ã-¾Šæ¶¾ñ_(™r\'©Q¶²X…êIÍö¬Ä3%mÁ—V0úÕó¦cúôi˜2…›vH}.Æ(g=âëïZà‡»¨¸ÛâcÈFÉhb÷I yˆ¬\"Ø·oôÅ:—æ²[°jİA´¸SRi£iâbéÉ«!µ«¹r)Ú}7nÿ=2dic/ˆhçNÊÇgç]„Bu+Ø€C£U*¢.îó»ûêEø ıOxöÑ×ğĞ}Ó±âÎ»1iö)L\0T*Xí‚êİõšzİ³æXDıX~Ñ<LcJajã4ub1¶ã*ÌÉvG«\'¡Pò&KWWö0¤¾—¹\\¿ŸõÍÖÁĞÖªumµ*£PÆÇşĞbO†ö	Öé»şˆn;£¬¶s2{÷Ü¤à§ß+¬®¬–Ar\ZZ1æÀ®÷ğåsêqÜ’eøî÷î…gÚ2-ª£a§ydË®_æ«_üXxú¸îücPA¶:µ“\'OFa!_¾¡ïe6F€\Z1ìMã¶—9Ù¦…;XÛ’e8ıçÜËİ—²\rt¨|WUõ•{½fË‰:²ôµàÚ=¯ A*ù`ò©¹¡€M?ëX’„¨0İ®dˆLdY¬¿\r¥µ³I9zœĞĞX<¦²t¾³Ÿ½x.¾`«*)ó\ZPSS£”†hİámÌ\0\Z J,-Äº’öövd\'ƒŸkÖïÀê\ri/ñ*,ÛßòHM6xQ`íJÆÔ\n3”Wmûê¹8â¶½H»¯µf!ìƒÃÿÇUß,nÃ‘“…k!ÊÂ¤ã§zqÑY(×§¨, dûJK¹Ñœ±H¡¼ÃµqĞØ‹\"Ènn nokÅ‹¯mÇº»è:i/È±\"¥,‚ŠËé¶°ò\"A”L„	…Ûqåşõğ“¢§ìóqCõn¤ÁÁgÕ¹sèÙÅïåIÑ®	z\\òZ—c¦xqáisÑØ8EQ]uu5ÊËËÕ‰r<RW\0\rj E6\nİİ]ğ÷0ôŞÙ×ßİ7¶dYFRe\0¥dWâlº;ª”ƒĞ\ZçIhVrÚu[Vb}étìl8ê5@º¦Åö†Q¡~JÎŠ­*!{™[™;‹“æÕàŒf¢–”VÄ—^TTT*ÅÍŒ˜)£)¼w\0sWK(Jä£°vë•û)œûûzqàÀAüukŞß×ƒæNæN({$X*ÌÊ´€zq„NLÃ)•qnL9ğ6šJgğÅ|»\\4°–£ÈR1£d“¸|òı–¨+qb~c9N˜7Ó\Zàå»¶ŠŠKQRR¢„˜\'¹æØIOÿrBÌem1odåLÉå†X¿¦ÕèÃÎ}¬rèBK›ŸÛlÃèê‹òı€Â¼”;²/X\0í\'ósBªñ%o¢›.*u©üg)~bZ€¯P.õ9PSæE]¥ÓëËĞ8¹ÅÊ[àãÒ}ğ°‚‚Em†Œ\rÅMˆÍJå²·°ªP¦\0\Za}`<FÀXæ+›ºã,qK°+ªeém]Æ±„¼CP\"ÌZ]¼åHºhxqò½nÖÖøÜ(¦Ï*À8IMÖA»‹­.ºA1\0­úq@Ë}Ş¿	°²ûôl˜ñ‚±!\\U]Jª•<°¼ve°¾Eå­uÃWßš&¯‡R…˜,[`Ô‹È)1ºQ\Z7Ü†íÂÿM•ÈX\'eØõ¸¹Çá¾öğÔ@î{F*Œ\Zëü†ÿş[ÖÜ¾rÃ@\0\0\0\0IEND®B`‚','Attendance'),('104','assignments','assignments',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0ò­\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0#ÕIDATx^í\\{Œwu>÷}÷î{×v¼öÚqbÇÁNB$N hD\"!ª 	şˆŠ@TU«Ví_Tåª¨ı(UUmZ*´j	@hTò\"!	à<ÈËñkí]{½~¬×û¼¯™¹·ßwÎï73»^ï®MÂ£bV£;{ïÌÜù}ós¾s~gn¦E~»\\2ÙK>ò·*™•Øüµš¶c&‡5ÿ[Ø– pA\0£æA	gÉ–%×ùv¼fUÚíP2á4\03SÄ6IœÁç\0Ü!ì‡ğVÿğšç§ÿo—e$HÑÜK&×+­æi5NK¶´Cr]7§!ğK4@Ø\0KÛMi…ç°I€[x\r)Ø\"9S‹³ÙNüÛm€ p¼—ÍuÙÈpè<æ7`Y\0!˜û–äJ»\r h˜œ’¨q\nƒí1 ËW+&m°1Ñ¼NÀ¯…Úm¼Ÿ!Àdl`×¤Å‡U³ÅâÎó´ÀjÜ‚˜É”ğZ¸|Åÿ1È=ÒVpñ}¼	\0=“wÀëq¿|®/Ï@{ö~\0ø&e‡¸ANaĞs\Z\0A;%,_)íl^\Z­9)rĞø+I¾fÚ9iÍV‹ »z6ÃÇ¿JJum|Ô”Lkû.àßç¯ƒÕø®ÌÖãéëØ®™‹À¹3d·sY‚î™ìİÜO† ç82\Z«s5‚kvğñü‚>0˜ı¶äŠÛ\r@*5)\Z¦Ù:‡ÅZÃ ¸–a‘òv	òeiJ]ª\Zæ›‡,gÁvCÍK9Ó\0`ı	æµt%X<5@Å <•U&‹crY¼gã‹€s>‡}[ó8€$ğ`sÂu€Íd/ÎÅ÷¸ZF\0b¥K0&—q>\\C®â\\-ûğ\Zñè­C¤o‡ÏÂıùÊË\n\0> ¹Âf|¾Ğ¼èW\0ÔëÚ-²¤w¤ôaİ\007L‘ )˜\"9 Âgv²\0«€ï\0 %á\r2K`ÆQ+T`¹˜D¥iúA˜ŸÈbÕÏğA.G“Æxı¥qWuæ>`¶¢iwãÁêhïÍàûèŸ»YjeÅOÚy½‘a£SJı·D½+\"¸€ß—\\~\0b%mb\0ı&¿€ĞéUÕÜD2Ùn°kkÁOuo”°X&¬­Öš–fè´{‹,ÑhFâ€VÀ‚”%D ÊÁM„!%KUT¹¯æëº³u`3¨¬@Óê\r{¼´àf\0\",*Xx7¤\01fgÇåĞ3Ê[ß÷e)öÀ\nWXVu0¥¢)ME#ëÒ•æ‚Ï•	¸–­X·é¿­ö„DSÒê0’?ùšTN–ÁZIÖe†¤ÌÎ«ÁGâümÜzúË\Z}:•“áa9–‰Ö™Ï‘L©­V*¥£X‘b¾@hîd¢gjz”šç% ¨Q“ ¨I£µQ“:_ëMi43²Pç_<÷ˆuV— 6\rßI3^y¹0€FE5\'š_\ZØ¢+ÿÏğ}LsàgE€¸	’ñ\n5éVó€D…cÒZ_‘v·Èü	É¿$§ÈàBF6ä·I?€/ÀÉÃx%Â xÖ<üÙYo/È™`TNGe<8 ã­×d:sRZŒ¶H±œ—J¹\"¥BYòê&pC”±«®n0õï<ğ¤üôÙı¸1àeÂŒÁÚ<ƒÏ¥Ç1£f£Î9Í@FÅôÿS÷!X)¢óëä°¬’ğ œı+Òîc7n„oÆÍ9w\\²c{¥<±_ëÊ].ë´Ê0aúÀ\0ìq¾–ú(èGèÆo^ˆÔ“á	°uLÆÃƒ2¾*S2.3¹“Ò.ağå¶T*•˜­\nì\nº²EßÚ3G³>/›wİ8Ò¿\Z~êÄ–_‰àhÕ¨ãüŠ/ávÌH/µ\\Õt4FÓn°òJ\0z™Šò şÌQ|h½Hß:;öÌ!É{NJÇ.ğÿ›²[å²ÒÕRÉè\r„B¬`\"½\rF`9£{¯õ¨\n° \'š‡åµÚ3òÂÂ#r<Ú\'g2c2“?%¹p›.×·˜™¸åd|b©Äè‹ĞÒ¬J×e·).m·ÿ…`º €\Zş)‚	˜®) c	‚Ø\n°¬Ã£¶KƒÓ¤\\(lÁ+|ÌüSÌ>(aîˆ´7À´¹;œ\\:7*™ñç¤8ú˜©Ëpq§l‚ ïÆ\r hf`@èêu&®ïÏA76éó\0ö|4+\rH­Z8/£Á«òêÑ—$xmi¿‰«û¢Æ¤4çK}f\\z»LJõôƒ’©íÅúŠD‡4Xº\\˜ÔA.ˆPìRgpÁ\0¦â×›5SV¦¶A\\‹ î€!­à„œÌl·²Î?S}YZ} Àz°²£œ Ò)3&^yşRØ÷éŸoÈ–üvÙR¾VJĞ£p2\rie\"©cpSáI©FóêG{òë¤©(³Ê*Q20­ğ\Z›M0º4“YŞ.Ğ¿9,…àa	fî—³Çî“±ıŸ“æ@lÌ^€ˆFYF[g–Yê+\0¨:}l`0aÀñ¾tæÆÆV\0Ni‘!6fé\'K;!•ÖIT;(AãY‰º‘‰ÁO–bÛH!D]™\Z}ZòG’™9Ù\n¿¢üfÙ€ÚädT\r‘–§Ò‹:Ót%n\"Ön…å®=Qœûryé©—åÔÂ=ròÜÍrzj—LLJ£\ZIgG	\0{q=K–d$‚\nÍ´9ºH¬€¸÷yašjñ÷‚ë€U™O#C\0ûxC2\0L4Ca”g®Œ‘;yÓn…ı¯ƒ}\"ÛvH8òöÍĞ<}tãô˜È¡Ç%{øGÒuzLª£,´g•iÙ^0-ˆ‚şÌcóÏäÍ•ÀYz‰Sæ‘†6˜¦Ödã®ß—ÎwHïÖß“ş,][?.ù38CN\Z\0°…tQ\0ú ¢ş,fâ’¨ì}$Ş¼U`ûà`ƒÓÀjìC	¬@æÒ½A0WàÈŠ›¥ZÍÈéñÃ\0ş1OsNYî¤\n`%­NÊÔôY«ÿZ€ëa§$ŠâW\'‘T3\Zp4åB¡ kĞl€¹-™™‘‘ƒ¯Êñ±CrêÄQ9{zŸ[\r´Y;cjníd²Í b~Œe~‘Yï¦­OŒAsï+¸, ÿ¤ìCvC±\Z³è¤¦nx­-ÌHm~Ió4çF4ÂPÏ|8èÒŠ	ğ«”=4×Èû`5aË»éëfgg¼bÑò\\n7`†ÙòşéÙ96>.ûöï—‘‘ƒ\0º”ÉAP‡åœŸ¯(c Ú™£æ$Û6pÀ\Z©]0Iï¢¦ˆ´\rß×fj¨u°”kˆÙë]L­>)‡¼ _üúwdïs/L\0éYë}²‚i\Z€) ?¦Ô1öÁïù•¦Ñ_G ºï_ï“¯}ík\0g$(ÍÎè>´iX®¾z§ìØ±C¶oß.ƒ}&ÙÈÜ°W{~frA\0³9V\'|´MI@‰è´mş.Ø±S¿’¢Õ<‘AkåPl€™yözÇ~Ö™<YÑX8!¹crìÄiùîÃOÈ‘QcaìJ¼ŞdÕyJXôzêùxCÕÿ¹Uo,ür˜•™™“¹¹¹ØÃàP6\rË¶Ë‡¼«vB>mZ¯¥€ôQ-ƒ˜¬Ù„ÅL‚Ğ¬R¦ª>Î\r$½­LM¯¦êÛd^8í²“ızËQÍæÜİê¶	`0w\\\Z³Çàä™1t¦ÌÖßX¬0YÔºš!ê‰,€im˜£g!ı ™Èï\n\0S4®&¨áƒ†ĞÕMMÏÉ4\"|„óU º*,…á\ZxÂ \n\\€jïÔb¬j½ÃÔLí¢–º€á3Çt¾M°¥|¬ŒÔ´lîÁŸßß:íI	ªZÌÍÕï¥W\\‚ÉØèIùÖWö²LMSğ‘é½”	ñ=Íf fË•@Z…Ò¯¶ ÅBVFÇÆåÉ\',=ö˜üğáÉ«¯üïçô<,³góTke Œ8 ÖıR,I¹ì¶«¾)¢pfqÿæYWc¢ï¥“=MPÍGUö ÛˆXâ×ò¾ƒÇê*Wõ-È†Œì?*<ğ#¹ÿß¾+}ë9rğ¨²[åŒ’ -Mìç§Á	 Y5!£p¿S‹¸|¯}kÕ9_-€q¶,¥ÔZ4ü4ü˜#[ükÌT–ƒ™b*&š8“Gá¬™GšÉ.ƒYäLc¼Rõ\ZL„[öC&x—’\0¨æ›g¹¾-ósó²ïù}òò³ûö™ô~‘¦É%Í@Ş–¹ˆg%?ƒè\\ViC×QÌ0ó øİça§o¬8õÒânPL/•.É b¿§àz³$å ò9S‡Aè¼ô_:x¤]‚ùZ½½+ğlz1«Z‚f—z; –Ö¸êŒ*L´Hyã\"±¦”ğ…µf Ši•1Väí(4¥ÒÙ©•œJ¥KÊyLY¨ãµ-_Ä]@N¤@<Îg5¯5Ÿ|IPVÁ|Û!ï ç\"8sÆìÄŠ	Ğ^K&LNrlÂÃè\'‰Í| M&hâlq~-‹ÔŒ1˜Exx3°&eNÊ„›uÊ˜†ô¿W*E°@æse-ŒPç/«05AT”Û˜SHLØGP“6¦ûƒÔW\\”uè¼1¨Ê0ı<e‚‹‰`l1t#N*@Ô\" ºÒÇé$•ûËä3NPyN¤´Ò¯Ã×a¾ş>éïë—ŞŞ^éÃ+µS>—\0 çgÛœX_ØÙÄDTLÈ¸¨¹X²8m¨–æ…\0@éÂ¢[úÂLÔI—˜½Î50»q\0[…Ûé6Â¢ [¡‚Zò|qV7e3}üN ‚`À÷UL»ò—7aoÆ&dP>3Š(«õÄlbê\0çF0ëè‚üºÀœóÊ&ß¥Œâ6\'%ª¨á…œ»Må¹ªÇRìá¬jpf¾¡ÀÒBØ‹tàQ?ã¤ùâ,˜A„Q‘¹ª‚G}æ6õ^ã¢3ãÌm5a˜hÂ6ÇÙ<ŞT²Ö\n¨¾¾>éîî’>0°¿ÅZÌ*òû£©æp.Ú„uB:.˜’\rDÁ¤„dd“u=Ê—#{`8×öaÌhh:&‰¬lnİ\nqTw5F3a“MF Z&óXƒˆe&chš`<Ùçr^Ê”dÔ„	`Ó®—¡HQƒ¯ó\0ÆUi@$Ğ‡ËøÄIêiÃKF•†¾¥¯|‰2ì\"} 5Ñù»ò”#lTG\rUÚæ”ì’÷6´[›ìã\0Yyñæ«òÃƒ˜Ã~BÊ§Aƒ\0xİÀï¤ãçqœb#„™é@éÿœ¿S¢§,ÄZGeºÑ`ñ”ÕqÓÜ.K0áº¾¶[™Eª711!ûI½Š ˆï0¦\\á’\0¤ğõÙ†™¬V¦P0@µê¬cøŒ“ëÜÇ\0TßÅÉjBáæVZnN#‘0d›EtÏN3o2ÏÉ²“BšïkÎŠ€é\râ+v«!Ñ÷sÆŒÂLßÚd \0\"	Şµ]o•:|g \nTæ‚¡è¿õ¨ˆÂ÷ÑÂ„mìÌ‡sÅîK` [\"TÂ¸ª²š‘÷}&®\\ÕÃZïkGì_á+ëèœ0¿Ke+WÍÍdm\nÀe=®bfì„´g¯$š‰Õ\"sÍYY`Öã¢°\nqvFÀåøn®Ì§Y…ö\"š§&ˆÌNBÜ€R×\0ó%%4ôôôÈ@?ÜWc\\¯«Pê‘Î«.@ø/Ï¤—ÅÏx=hlis\0µ1“=Ú6ÁæŞ\0\\øJÆx0=°i€=™Ë:éê‚UDb!í˜Ø9€×¥–ÍAw’qÊFd%£0®‘³o\ZR\Zï©ØoNÈSO?-?ú´<öøÓòã?‹(Ìt2RÏ°T0õp±>0«‘Ç_?â³èhºÏ¶[,]…(Ñ|Qz×ÖU^øÕÖYå^éB[†Ñ_Ï>0À4]®ØÒr;¢$—&jzsø~2º—òÅçÂÌß§rP\'›è?‘D°šJ¥C6—\r¹ŸHGó©M\0hœ„Q¸RYëüJ¿sU“È‹ˆ‰ôÅœò”#ğ+:\rè\n-m±°Ş“¤œÅmW°pZĞ3V3\rœ³uYˆc‹E`dœ+†),<¸›¨Ó™h(ZÀ\Z2Â:[E¹e!6;g¬l6BYßÉ•‡dgçÉõ}_•›:?)÷„ë;òšœ95qñÌä{\0	ë@_¸H:áÛÆL«v „N¢R$U|ğ~Ğ\0‘€K¶ºô­1p-p¸Õ1’ş³\\Øë@µÔğ¦0û7‹>Fš1A$€i*¿i5`f¡Ü)®“ò¦÷Hvè2Ñ¼^\nÃ÷b²ğvLşß\"Û®ıˆïxçÅÈ>ºdß\r^«(¾y\'1_‹¬&9h¾+5ªÃ\'\"+ÑHš)ºš«¯pÛ«1–¦éª1`B7£‘7%9ÏAš(fÆ5À®(jN×OË@¤[——D?7ÌmFjNäƒãÒÃ„Ò\'ä‰>.ƒ»şJÖ¿ù³²éÆ/ÊàæÛ/”ˆ¬lÂ–ÍóVq 5+ñËÿ¯N¦5&?PÚÒLƒ¦”Î‡­hk«ó*€ì¦ĞÇ-@o\"ŠÆ,ä9\0n@\045¤¯²É#S[Ğv²~\nÈ6ØÍ`=D´ÖßÏk9€fdıÀê]Y+ú@ĞkAçÿbQö}n;fg*Ğ:sÌ‹hqU³\'Wb)“˜oµ].@XÔÌ4>Ö\0¢÷ƒú\n¡¿F¿§E„@lÃŒYd>‹¶\rJ˜´4fVÈïF¦ÍGB„ØopàüÂé²ö»ZÑ\"€ĞŠ¡>Š&%¾jºI=0)[Yô&sZHÂÄTÇiC­1¨NL;Ñ®~Óœ˜ZKXe³\0\"îyD\0q^~ÆN/Î‡Xif•™ö?HRÂÔ™¯uY‘œíÒš ú¥”\\‰·K™•Œf)íæ´)|oÒK¶í<´(N&ÙÑTf^=S†I«OE{FD?ærá4Á(Ê+&@2ˆ¸nï”sÚğÎ™=c0ÏU®,Ÿu,êÊ&¬íœLv“?švÙ€@-ş%BÛêriÀıç–ê‰A`tfàpÂZ³ïÍÚ<ˆâ\0Â¢hõœ¥uÌ$hÂ<\'¯ÂŠh-¦€§3s.\n§…4ÃTı7yìï…ºNcbnd­Ë*i÷Œ†ú-7(5Ó”ÿK	ítšçÅu\Zh}äÁ™sÛšÔ|\' Uß\rZ`0Ífn`¦\"0¤ 2“ÑM¤‹è%U£-ñO¤KYÜ®×æa¾°ø]Ì<r…×‹<-HF¥ràeMU™²T\\û’•é@“8ÎìÙ¹Ï ²£QÔ/®‰™0çC¬ ê*2ÌBjğ‡ˆÎ!¡ğé›Ï…5áŸš/A†©³ìÏã°°tåöLsNØLl€yä¾k]V‰Âó\"îzãAp¦«àº;¸(sq€Ù{çg.|±M&\"•R€Ô„«	ØÊø8vu@TV0yp˜²™Æ³ÇhlA¤µ«{·ôeú5GæBÃ\"Aæ>\ZJŒÀæ&p,AF”#bäæêÍŸAÈ¯–ºòÑU“1–Z¥üÇ/t~ÑKˆÅşÏïÃ÷¹¯Ï`ÌÇiı5E>(c@¥È‚5¨¦r–ô/ZóÀ\r@›\rÑÁ$Ùßmi˜$rÚ°™<Brğ•N˜0«Ñ66?gÓÆTF÷§¶}Î9så6Ûâ<¨|%˜«ÈI!Îw8SuUbë,XÌ.›ñOÀÕ=Ï`Üçzá` ç[ôÑZ•$VQ1è	ı¤ŸL÷	\n¡æWµ”\Zë@Î“ìJğìd _|W¯)\0‹ÉÀ[BXRãw \n¤À\"ıª5D-½Ùº*€Y-É›	ú@’Ë™®–ê=À© ÷[«¸v‘Úâ\'ü!ÊaZˆ¥	;\rè‚gÌ¬¤Ÿ\n$º\r«ô[ªÀ<å;³•H˜úÔnÔÄ„ˆ(ÌJy\r`z+ğÈ\ZZŞ¼ùz¶¥MxÍ\0òiHcwş‹³Œ;¼3?Ã¶(’»(ÛF3»@µúlB0¾qæ#Ó¹0÷A…Ïò}ØæF\0Ø¤ímŒ¾ê8ui%/Dü”f7!Ÿ³À: Zz€ŞlÉ@(õ¢|UfØÓ¢E€¥ÚÏráÄ÷%•ë¤‡Ğù^Ìbÿÿ¢ÀÃH¶°Èà¢™œ÷Í,b ˜\nßÆ‰¢t%ZM€hK‡Î‡œ8²j4—ôk\07 2Fƒı-µcQŸdJû<kFO‚Èš˜-öÅfû»óäŠ™X¬ùh4®Ø•%?&—]ì§öKêgP6Uı˜6a˜—j>xğ†Ò5ĞBï\Z§4ı3\"IgöC5»€ıÕÊÀf~WˆG½è3<×¥~ĞûÂ50šH5 3+½>’zµ÷’€’\n8.‚/ªà(À¾«Õ§ƒtÎe\r³ĞŸ9fØ¯¹ŠÉyÎµ,1a\0XÃ@ÓYˆ2™ˆš°u%ğ^„¥­mú>eŒ‹Â,m1â7¢¢Î•xğ–“3¾Ì·*€®3Oñâ2Vª àMQ_yÁş³dŸ8R+{]yÌ«…V\0WèÂEˆ\rsØ–®\r7¡Š³ SMùÏ\'eä³ïÉÀ¬Î´-’P¼NDUí¤0¦[pìÒ˜„k‹ËYd&Ú:Š0y=¯0ˆŒiÿ·4\n¯İ²\'DqğLY<âÍÇç»I0¦&±°Nl€³ÀÚ(n•jù*é¾M†vÉæİ¿+¶\\.óSS2™‚8c”&éğñ¬pR†şËY{¡#íJ0öqFN»XÎrQØæCx\rĞhmc%†.ƒÅšp3ÄóÂ¬5ºgI–\néôãb«2¿[`¾7qæIqÕƒ™.¨¦\0VÖzß¸xŸØ\rÄƒ‡¨®ä ëS2Ø^½òaùä÷¾!ô\'İ½İ·0ãXHdI5ø0‘ÿõt,Tã:³w§6\0¨µT§9ÖFSèG\ZÀt^“ö¶è¯H8§vÑQ«4éÎ…´Lé<\r(KÀ$[Ò¢šæLÿS‘ç®‘³ç6Èéıß–™ƒÿ!Ûß²Qşğó¿„èûA\0ˆZæ¸±PWG£ÅÔ¸Gš\Z+õØ3\"œâQ˜ş[ƒ(ÕD¡Œ!@iğ|úÆL¦T*é£«20«•	/¢]ğĞ´,r¸ŞL•±Ë€«šÏÀ$«½3öçĞòz÷U²õm*åËÿZš3crÏµ	¤\\˜kNO¬ãVJiºæ£€\0D²\05d9ïŞğ™g!‹>ì\Z‹J%4Òƒõ1CfU8gÀ¶Ó}iéÂmËî…şş~4\"áIÔX]^`#ƒ$xx&%lR 	pìßè—‚›b¯ÛÏ2•$4?ØÂUˆØÿŠ<ùÄOäØñãæ>À ¹³xŠ“Ç¦\0` >±é4)E´–ó)¢á9W<P@Ï³¥r>“}l¤Œ ÜùµöÖ¨ìùºÔÍ›«‘Ç®[·N::’fóÕdgº+e-.¢º»ÊA98væyÀÜØ÷yp‘Ôe×ìŞ-›‡‡å,‚S+šYmfÄ´ ¿Q2¦æøgæ«2&ı˜3´§| Ò*mĞÓÃ<X3ì\"‡`¢ÎÖ¹¼—c\"ó†††´ù2½¬ Ş6îæŠ”!*EÌß%l³Ë©nX13V×AÀ&&N¨™ÜrË-pæ|••Ú¸¹\rÙ½î\n¤>{&€x×•KÏ@“1ˆÔìXEKˆ–¹/\'éñs#\\R4àqÃ¸¡dßÒeU\0Íq°ÇÅi%­xµšé€õàÒDµÀö]\\²ÅU5lªÀ*Ï“g\'åÑG“GyŞÊi|dßÊîNÔStWú¤¦™H¤TÆPH;M)“üøOº+ÒF»½ÁÀ:~^D÷Ç¶g Á#û–[Ö Ÿƒg€v&”ÖsêÿÜû*riŠÉ{qÑÀ3—€+¸½~_Ç6Õ‹î(2‘ì£Ìñ‘×XD;_ˆ¯©²°ªö¡Õ@MãØosÄ6F0|5:–18†S˜‚Š8:áôæñQXJÿ \"MwË–-rå•W.rë‚Ÿ¤>È^ı9yùhNN¢ñ¿Ã¾9û§+ã`²4Cq`zp=+Ğ„½Ş·µP¦_·nPM†}Ê!ü]H©sƒUiÒUÎiĞÄ	¾J¬\ZD¬0 @ĞëÌufy3&fÚ3ñpR‰ß…Qø½<Ünøã•~“kM\0ö¿SnıèÏ¤çÊÙ[äµC§¤ŠN|ÕnìE±\nŒıÅÃŸ$¤‚€ß/xSØ\rJG}å¶!¹üòË5Jò—Ê]0¡ø|¸şASàÈAš0ÿ\\TÖfKÎÜQş`ñQ˜µ&ÛFĞËH—HKa—G†¦¼eËV¹îºëÍŸ\\²	û‡¶î–›ïù’\\ïQ™^ÿ)yq´CN¡k©…¦se¥ú1«ÉÙó\Z^Ÿ%\0/n¬)‘§âø‰“2‚çßj5J°\0voÂù]\Z§R†®Ou2º*é*ĞÊŠÓ.ˆ\0ÍE8p<dc„ ’Ï²äoVÂß‹©ÕBÙºu‹ÜtÓ«‚·f^Š|	Uşİ7ß+ïúƒ\'¥û?‘Ú{åÀ‘i<fe¬ô&7&y Õ¤–€ë#·s	ôyl³U6c–Œ}Ö¥®š\',$°HúÙëÌV¿ÄM’“‘:ƒŞg.”\"şIu+iE2?ÈôÔÖYÜ8´¹íø¹í]·ªF\\Ë²&^éD›¶^#{>ğy¹îÃ¯ÊüĞ§å•ã=2q¿,p¶‹%rŸø(mL=\\e¯•Ö§g«òÓŸî•£Gèt#ßÍwÚŒ™/§L\0Xg.¬^#a ¥v¦•mÔu`dP°^èœÿ°¼÷ã÷KşÆoÊÌÿ\"×}èä?ù’TJk‡eí{®r;Êx¾v×Ë­÷>.½ïzHF\Zw•S²07‰(‡®?•¬±ôqé‚¢4›-YŸU®Ùu…l‚Ë`g©šJó»TR}¡¾)³M>ücS›Zº‚+a&âõ§uì;îO|âúD:5İÛoÙ#·Şq\\sÓå¦wLŞróûğ|ÜZx—ìóº˜şZ|Ï>+×~ä€L_öiøÊn9V¶1q”Ãà,‚û€â‚ÅúÔ^)¬¿Q6”è¹»$:øI$ìL·\"°rN¶t¦\"<‰	¦İŞ{»lë¾RúñëÈšd5Ì­TQS¬kÃ;ºZL}rçwê3p”GÌe¹ş¢ËŠ¿âû‹<}ü8~5èØ÷Ivêê¥»§C2x,Vš7ZzQX¨ã·´º›RËLùmò~]íCOÜo?Â“DÁ½ÿ(ùè¤´ğC-€”CaoÏm{äÔği9Ö>.ß;û}™“yùûŸ‘™írÃ7¼CÒsıÒ\0ôW¾PEaôçß”sû¿,¹²q}tî\0öSvTÍôƒ=sA©(Á lİ…*õŞÇdS/ÿ#bµ@ªı‚üíÓÓ’Ã“Ftúwß}·\\»ûZüÖKCªsU©Ï¡ã§|şèr×ûîÒÇü_ïå—`z\0Çî“ÑçşI²`Ê–u`eWüZAğ_™ÅãüEùêC7ÊŸo=&×ÔÇ”á=bÀ®qşcÿ,óø	é-åäıï¿\\ıõ¯7>«ïW\n`ÌJ°éÀŞGñô+\Z@†6ôÊ‹‡Ñ‘Š¨YÛy¿ìÜ½]æ`¦göÉĞÑG¤kÿC\"{_’Ù?û‚|æ¹9¹çî;å†^ó\\½_…	¯tQ´à±‘WäÈŞ/ÊñC?“w~ğ³²íMïˆá€ãg¦d¦Ú2~”bşä(~kë2¹eÏMkë²Ï¯/edMDæÑÑQ¹jû…ıK9ïÅóàÅôÚÿ\rÑoÔÅş:÷ÿ\0ÀÃKÆøu±\0\0\0\0IEND®B`‚','Assignments'),('105','tests','tests',1,'ÿØÿà\0JFIF\0\0`\0`\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0\0P\0P\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıñÕ54Ó¡@À¼³08×ƒ#z}1’O`\rg]x\'Û$í$ƒªÂ£jûdõ®kÅZ³ß|E¹¶ÜÁ4»(°v™¤Éü¢ñ4û[ òè;ĞÍ¿‰ÒK§o6ı¢`0…c\nrAÆN~½ª­ÏÅM2C¤Ô$¾š6“lpoXTƒ#„<Á Œç\0Ä\"XÓŒ`töª×7\nÜ R@Áè) 5ÛÆPY—ß%ì¥Î@Ä\'\0c€8ÈÏ99>˜PøÛ§\\6¡ie-ì—v6âyO—µ[c,…lISÏİn8Åaë¶ZÔúÅˆ±ºµ¶ÓĞ“t^=ò·¢€x û Œä”×ñ´6ş\Zğ©eH­ 2.åU\n œñşê¦+›YQ£:½‘ÓƒÃºõáE}¦‘æ¿µíãqğG@ŒÛGv÷¥9-ä°¿Xñ^sûÁTohígÇzFº.$¼ğ½Õ´ñK7ZN® ±RX_\'®$•ò·í÷ñFãÄ—H²¨I`ÜuÊÁ¼57‹¼iñ¯ÅÆFp\r!ÕZOŞÍ.~ŠbÇûÍ_¬óS\'\n²²[\\şÇğnS„Ê#Ñ\\îÍ¾»­ÿ\0#õÊ¦ìoĞá–b¬­ÿ\0|€Gç]÷‚¼kmã’!åÍ±’„ô>àóù\Zø¾×âm·„µu²¾º†ÒI,+ìG=”±à7a¼w¯hıŸ<jfñí¥²x’FàôRãªÿ\0:÷rN\"Äıf«Ëš2iz7¢üOÍ³¡O*”UœUıRÜîndTø¹â†XÄÓ­‹Gp¯&\rÏ\'×=³SéUK›¹u6±Õ›ı8ƒ	@Üß|“Wg¾âvçbÁqon~4x‚y ŠYà´°0»(&\"~Ô	±ÁÆG8$w5_Tñ”Rø‚\r>/¯fŸp’kh|È­H‘cùÏA†,yàdî[ô“óãZg{…8]±ûô?ZˆAæ•TÉ\'ñÅdøáü:_ˆfÕY®5;˜ü©\'veR¤F	’£>Rb1“›š‡t}Ä6ZD·%oïØ,H±³ä“´ÉÏP3°a›jÄRe„Ø-Ôäp+Éÿ\0k+ÂB¬y-#18\0Œçğ5ësÜSŒvÍy‡í)àí7â?€.tíBÁïÄÌŠ2ÊÊ»a•ä‚tçé_-Æ˜§†Éqˆï·mÛ¶¶^o¡ô|%Rœ3jª›Š’½ºyëmÊí[à¯Šl/ßé~ac G;C¨x‚ê2ÖğrC$##Ï”z)Ú¿ÄÀü§êÿ\0Ù«àOÃÿ\0ø\'ÏÁßè“Ii©wöûíFòàÉu©]˜Âdã@\n@W¼Mñ>×À­má_\ni?hÔ£\"ÎÚÊÒÜ……‡5FI€WÈføÅñêÙü9xrÃÌx]Õ£h8$0µ¶o»È#|£>‰Ñ«øç#â%Í3ÖÁ.Jqn÷¿\'f¥³“³Û¦+êÿ\0§q8oí)§Š|”ôqœï³ò¿}½K_·¿íÙğûáF‘w‰üCe…­´J×©Î!ObØôßø!gíùãïÚöØğ–‰±O…Z”wÉc6²ö¤ï”ò+Á´°ƒÜ>ìç*WËŸÛ{öJ×~ZOs¨_^kZ†·:¤·72´³]Hî,Í’IÏZûïşağoÆ_¿à£ÿ\0Mò˜4K(u(/,€ûñSà|Å{Wô†Q*ö\rÉJ¤¦•öZ4İ–ºë¥ßİÓà¸§\rZ4ñcB4äû»Ùîÿ\0É¶?|7ªø³âf¿e¦k3è% ÓŞk«u\r6Ğ.°€ª[nì87cØØiK§Ú¹›w—3O(Dy¶®’\n àp\0àÅf]jvš7Å_Üİ¹DÚ\\HB4ŒÎïrª¡TIb\0\0µÈx‡Ãgö«Ñ¬>ÑsãŸèÚ.°gx­æ´K?Z(eòåV4¶R¡UÖ=Êã¯Uı|ş|;\rwTÕµIlÃ±XÍg)àß4ÊĞO	I	Te\r€XEó\0Ä‡!@æD·g¦Ç¢Æì‘Ûı¶ä´¼1˜ÒWË1!I%T»ÈÁrpdbI$“‡´\r\'áÏ…¡Ò´[k}+G°Bn!#—v,ä’I,K1\'’s\\8ø•§üp‹Äš…5©m¯ti\ZÃTg·İãYb‘Qã¨8İó…\\…Ê´{‘È‰_´†™áOŒº€-,u=kÅ:¼-wsœ&TÒ­Dr•šb3³t‘ª(lŸq#å\r¢ŞÕ<G#Nçû>Üb·!å#Äç*{.~µÒxWÀpxRÂæ\'’I.äY&d‰b±¬h‰¤hªª¨\0Ô’q<Y«ß”»´ÑÚÖïQ´•b¸…%G’ÜmVl+2‚á^3µ™pI<…o?—Ò¯QNµÚ[.§vVŒ(Ù7×©gÃşĞ¼òK¥i¶6w\r™®0g˜¥ä?3gÜâ¾dı¦a°±°ÔJbI/%“wQ“#2k×¼\r¥x“Á^x|I­Ë®ßLêáÚGî‘Y7g2\"»—Â.d!#‰Æ¾ûMÙj÷wI\rÕÌ3³:ã/€NHãĞŸÔWÈqGaé¥ŞËkúw?GğÏ¿µ%<M]Z[½ìüû™ÿ\0µÄqxûã´ëÀ’[Iâ9_pH(çóú×êŸìàÍ+Oı¥<=¢‰­ÒåÙÇ&/ôYS\'Ó%±ùû×Å6ß²%½¼×¼Wc<×lš<S³Er²#­È^£h] ¼$n˜¾Áÿ\0‚}üD°½ı¢t­:BRöö*3œI2îOûä–¸¾[)É±ëájÔV2~êß}¼â¼÷	ˆ§Œ£FW”a%¦ÏİÖÏ­®}{6“%÷ÇM5ŞtÈôË8ç°h#xî¤g˜¤ŒÌ\rÍÉÎÕ­ËÙŞp@±0£“íYR“ÿ\0wÄÀcş<ôÿ\0çsYzÏÂÛO|@³×¯.nî¥°Vû%»¬{l‹\'–æ\'UT.$GgGÊ)E5û;góq¤k~$ø…âWK\"ÏOğq¶Š^Ã4:¯ÚÕ„ƒiªîˆ†•–—8Twíô3O£ò ‹qEÉ$’wÄòX’I$’I$œ’j{¹-<=a%íıÅµµ¸ß$³È±Å\nôÉb@†I®CÆ‘ø›ÇOk†5ÈtM8ÜÛ\\lYkÏ´[mV‘@:–tv<²ªŞT¥İC@ñq¢¯ˆ¾/Ë©xâ×Ã\ZG‡õ½^Æô5®¡¬ió?±Ù¤š\rØ`¡™Œ¹TQT2K²\'ÚĞşh¾\n¾úŞÒ)µk­æKùbíN­³*]Up˜Š%Àê\"@s´c`lÓ\"*¤Kpà¦(Šó0P»ßh\0±Ç`Ğ`Wñ_ÆÚ…ôaeö»~¬,EÑe³‰13\'Îï2˜ª9Æˆ.\\ÙÅ?‰^ø~¶¯¯İÅ»“fK û:äÊû˜m@±8Ë;aQYˆZáWöd°Õ>$Câ½VòmKXµ,!û6Ô_´mV^£pÃjí\'ypÅGyğóBÔu#OÖ|G¤Úi>-œ4·Z]<G6ß$H;F$0*) ¹PJ	$Q¹º-FêÛGµ3]Ê‘FÌ‘ïÚI,ìT\0	%˜€\0’@Ô81}øíğ¿OÒôK­BöæŞÎF^yœ,qä…\'¹b\0X$\nóŸØ³àêYşÖ~ñ-¥ÄW¶÷¡\'Ã£fÖâ6ÃdyH E{“éší3¤<7Ö:î—koó šö;È¦‘‡–Şbæ•V\0[g™\Z­ÎIMÕÚ| øW¦xÅzdz]¤Vv¶òÍ\"¢~y7´IÉfwvfbK31$’I®YaïQKĞô>¶ÕCºhİñÉğ¿ÇV¸!,üSf¶qÈN]BÌÑ¡=ey\0õ` rEu6ğvÎw1ê{}*ßÄO‡ºwÄ¿\rÍ¥êQ —•e8x˜rHäysšáôßüHğR}–ŞóAñ=¬|E>£Çy·°wCµÎ;•Üz’O5è©ãÿ\0\0é¿|=ı™«¥Ì–…Œ…#£Y	FB²(;&Œ«¶b•^&ãr6IÑ´ÿ\0hñišM¬VVVÅÊÆ™*¥™Ø’Ifgfff$–bI$“Tšÿ\0â[?°üƒÁÌ“Ôkqñ! ø00ôy²*y@ÎÕ¼om}«\\iz&­¤O®XL†òÉ¦G¹Š3»%c,lŒ|ß(ÃƒÈÅSøMğşÿ\0ÀZ¶×úæ¯­Ş]LÓ»^^Ëv–€±\"šR\\Æ€ìÇs*+6\\³üğÃÄŞºk+ÁŞ‚é¡û?ÚIæ¸X~OÜ‰_/å-0¥ˆF8\0‰n>#*ºƒé¤Ôr–¥bôÑHª<Œ œ.2ÇĞd“î@¯4ÑeñŸŒ¾!\\Í„¾™³ïl¥[Ø¤XQÆÂÊ»ÏœÊLÀØè¨¦1,ºş+ø{ñÆ Ò5›m\nÙ´‰¤uÆşòÍgÇ1Hcq¹w,M“É1Â;£teş\"·\'Ãş$ÿ\0µ5.SeY!,l¡²·‚ŞÚàŠİDQEHÔpTp\0‡½áX|Gl%R®ˆf*z¨9PO¦Nqô5›£Yxşâm²YøGHWàÏRÍ\"U€Ï×#Ø×ká¿¦láæ–îîvß=Ä¸2LØÆN8\00\0àRPÖäÎµÕ‘ÿÙ','Tests'),('106','mail','mail faculty',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0ò­\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0‡\0\0Œ\0\0ıR\0\0@\0\0}y\0\0é‹\0\0<å\0\0Ìs<…w\0\0\n9iCCPPhotoshop ICC profile\0\0HÇ–wTT×‡Ï½wz¡Í0R†Ş»À\0Ò{“^Ea˜`(34±!¢EDš\"HPÄ€ÑP$VD±T°$(1ET,oFÖ‹®¬¼÷òòûã¬oí³÷¹ûì½ÏZ\0’§/——KÊğƒ<œé‘Qtì\0€`€)\0LVFº_°{ÉËÍ…!r_ğzX¼pÓĞ3€NÿŸ¤Yé|è˜\0›³9,ˆ8%K.¶ÏŠ˜\Z—,f%f¾(AË‰9a‘\r>û,²£˜Ù©<¶ˆÅ9§³SÙbîñ¶L!GÄˆ¯ˆ3¹œ,ß±FŠ0•+â7âØT3\0IlpX‰\"61‰ä\"âå\0àH	_qÜW,àdÄ—rIKÏást–.İÔÚšA÷äd¥pÃ\0&+™ÉgÓ]ÒRÓ™¼\0ïüY2âÚÒEE¶4µ¶´4432ıªPÿuóoJÜÛEzø¹g­ÿ‹í¯üÒ\Z\0`Ì‰j³ó‹-®\n€Î-\0ÈİûbÓ8\0€¤¨o×¿ºM</‰Aº±qVV–—Ã2ôıO‡¿¡¯¾g$>îòĞ]9ñLaŠ€.®+-%MÈ§g¤3YºáŸ‡øşuAœxŸÃE„‰¦ŒËKµ›Çæ\n¸i<:—÷ŸšøÃş¤Å¹‰ÒøPcŒ€Ôu*@~í(\n ÑûÅ]ÿ£o¾ø0 ~yá*“‹sÿï7ıgÁ¥â%ƒ›ğ9Î%(„Îò3÷ÄÏ H*Ê@è\0C`¬€-pnÀøƒ	VH©€²@Ø\nA1Ø	ö€jP\ZA3hÇA\'8ÎƒKà\Z¸nƒû`L€g`¼a!2Dä!HÒ‡Ì d¹A¾P	ÅB	ByĞf¨*ƒª¡z¨ú:	‡®@ƒĞ]hš†~‡ŞÁL‚©°¬ÃØ	öCàUp¼Î…àp%Ü\0…;àóğ5ø6<\n?ƒç€\Z¢Š\"ÄñG¢x„¬GŠ\n¤iEº‘>ä&2ŠÌ oQEG¢lQ¨PµµU‚ªFFu zQ7Qc¨YÔG4­ˆÖGÛ ½Ğètº]nB·£/¢o£\'Ğ¯1\r£±Âxb\"1I˜µ˜Ì>Læf3™Ãb±òX}¬ÖËÄ\n°…Ø*ìQìYìvûGÄ©àÌpî¸(—«ÀÁÁ\rá&qx)¼&Şïgãsğ¥øF|7ş:~¿@&hì!„$Â&B%¡•p‘ğ€ğ’H$ª­‰D.q#±’xŒx™8F|K’!é‘\\HÑ$!iééé.é%™LÖ\";’£Èòr3ùùùEÂHÂK‚-±A¢F¢CbHâ¹$^RSÒIrµd®d…ä	Éë’3Rx)-))¦Ôz©\Z©“R#RsÒiSiéTéé#ÒW¤§d°2Z2n2l™™ƒ2dÆ)EâBaQ6S\Z))TU›êEM¢S¿£Pgeed—É†ÉfËÖÈ–¥!4-š-…VJ;N¦½[¢´Äi	gÉö%­K†–ÌË-•s”ãÈÉµÉİ–{\'O—w“O–ß%ß)ÿP¥ §¨¥°_á¢ÂÌRêRÛ¥¬¥EK/½§+ê))®U<¨Ø¯8§¤¬ä¡”®T¥tAiF™¦ì¨œ¤\\®|FyZ…¢b¯ÂU)W9«ò”.Kw¢§Ğ+é½ôYUEUOU¡j½ê€ê‚š¶Z¨Z¾Z›ÚCu‚:C=^½\\½G}VCEÃO#O£Eã&^“¡™¨¹W³Os^K[+\\k«V§Ö”¶œ¶—v®v‹ö²ƒÎ\Z[º]†n²î>İz°…^¢^Şu}XßRŸ«¿OĞ\0m`mÀ3h01$:f\Z¶ÑŒ|ò:kGï2î3şhba’bÒhrßTÆÔÛ4ß´Ûôw3=3–YÙ-s²¹»ùó.óËô—q–í_vÇ‚bág±Õ¢Çâƒ¥•%ß²ÕrÚJÃ*ÖªÖj„Ae0J—­ÑÖÎÖ¬OY¿µ±´Ø·ùÍÖĞ6ÙöˆíÔríåœåËÇíÔì˜võv£ötûXûö£ªL‡‡ÇêlÇ&ÇI\']§$§£NÏMœùÎíÎó.6.ë\\Î¹\"®®E®n2n¡nÕnÜÕÜÜ[Üg=,<ÖzœóD{úxîòñRòby5{Íz[y¯óîõ!ùûTû<öÕóåûvûÁ~Ş~»ı¬Ğ\\Á[Ñéü½üwû?ĞXğc &0 °&ğIiP^P_0%8&øHğëçÒû¡:¡ÂĞ0É°è°æ°ùp×ğ²ğÑãˆu×\"\"¹‘]QØ¨°¨¦¨¹•n+÷¬œˆ¶ˆ.Œ^¥½*{Õ•Õ\n«SVŸ‘ŒaÆœˆEÇ†Ç‰}Ïôg60çâ¼âjãfY.¬½¬glGv9{šcÇ)ãLÆÛÅ—ÅO%Ø%ìN˜NtH¬Hœáºp«¹/’<“ê’æ“ı“%J	OiKÅ¥Æ¦äÉğ’y½iÊiÙiƒéúé…é£klÖìY3Ë÷á7e@«2ºTÑÏT¿PG¸E8–iŸY“ù&+,ëD¶t6/»?G/g{Îd®{î·kQkYk{òTó6å­sZW¿Z·¾gƒú†‚\r=6ŞDØ”¼é§|“ü²üW›Ã7w(l,ßâ±¥¥P¢_8²Õvkİ6Ô6î¶íæÛ«¶,b]-6)®(~_Â*¹úé7•ß|Ú¿c Ô²tÿNÌNŞÎá]»—I—å–ïöÛİQN//*µ\'fÏ•Šeu{	{…{G+}+»ª4ªvV½¯N¬¾]ã\\ÓV«X»½v~{ßĞ~Çı­uJuÅuïpÜ©÷¨ïhĞj¨8ˆ9˜yğIcXcß·Œo››šŠ›>â\Z=t¸·Ùª¹ùˆâ‘Ò¸EØ2}4úèï\\¿ëj5l­o£µÇ„Ç~ûığqŸã=\'\'ZĞü¡¶Ò^ÔuätÌv&vvEv\rô>ÙÓmÛİş£Ñ‡N©ª9-{ºôáLÁ™OgsÏÎK?7s>áüxOLÏınõö\\ô¹xù’û¥}N}g/Û]>uÅæÊÉ«Œ«×,¯uô[ô·ÿdñSû€å@Çu«ë]7¬ot.<3ä0tş¦ëÍK·¼n]»½âöàpèğ‘è‘Ñ;ì;SwSî¾¸—yoáşÆèE¥V<R|Ôğ³îÏm£–£§Ç\\Çú?¾?Î\ZöKÆ/ï\'\nŸTLªL6O™MšvŸ¾ñtåÓ‰géÏf\n•şµö¹Îó~sü­6bvâÿÅ§ßK^Ê¿<ôjÙ«¹€¹G¯S_/Ì½‘sø-ãmß»ğw“Yï±ï+?è~èşèóñÁ§ÔOŸş˜óüºÄèÓ\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0®IDATx^íœPTçÇÏîòZ@‚(\ZE%$Ö\'Dc´£Õd&ÖÔ¦iÒ1Ö±‰­yvªÍ´$NÆ&3ÖtÆ‰Ó´:Fí˜fL&i€¯ú6¾ãƒ ÈK‰,ì²ÿ‡ì.wa—]—åÂ™¹£À½÷»çwÏwÎù¾ï~Gcc!i0´ĞÁoëéÀ¥ZºYo¤;üsÕ#é´\Z¥ÓUó;‹ÕF‰Ñ¡LƒcCiÂğ8\Z?,–¢øg%Ñ(|wçeúêLµ\0\Z¬Ğ´\ZêáI@€he»Â¿Æ«\0:md<½<{X†\0oÔ\ZhÙGgèê-E†10\"\rƒëË‚j±İm6ÓˆäHZ½ ›RãÃÛ´¼Q×DÏ¾ŒLL<$HÛçÁ9\r@\ZÍVÑ#?Zò¥ÄéÅ)m\0ç½w„}]3ÃÓ8Àƒ›ùğ?}Jàêƒ¸Úû|	1-!œ6½”ßğÏìó6ï¿AÑú 6x8¹™­Q¢¥±i1LV6å¾ Zv]õw[èDémj2Y)Œ­Nº2p¹c0Ó‚I)ôÊìLÒÜn4Ù¬=Ê}ÜÂÄ[ıN2˜,”ÇàŞ|êAJŠ	ëÜ:èXy»™Vn¿HÇdxˆ®\r¢Ùb£È0m^šOÚCœª´¦\'í×Ãò\0ï¯G÷Yx Ã°\0)`f`§=x©N8Fi¢ğyaÁ:ú[^¿´\008833°Ó–×5S]rÜÂãáÄĞà>Úm•Œ,Àl¤€Øi~òŞÿlö#ƒÑLóÆ¡—ge*\Zà…èÜùód2™T“êÀç‡„„PvV1BQïw?»LÛ–S8çÇ9bÑü±Øfª¿o2sÆIOOÒáFï¬YC¿_¾œ,O¢cˆoÑë¯¾ÚA½-Ê	#´œ©HDÍÔ•%+€çÏ£‘cÆµ¥…ĞÚF(bÄ^LgN¤ììlˆJ\0q‚]ìµ;_!i¾vıº€§åÔOèfc+**:v0	e€\nı3=-H§-‹*èFœEINvÛC¹\r0‹ìö­[)&.‚‚‚(”»±šèİ¶oÛFYNİ·3šÊ>#ğÓ;Ü¨ººš\ZU×á#\"\"(!!A‘×–ıD8ÛÑõƒH\'\0İ¶m•è\n Û]Xe<|¦N?@/Qöô G>våªUTZZÊS_:/›¬ËÍœš¥qªöæŠŠÒ\'AdÂäÉt°¤$°4÷ñÓŒŸ4‰wÊ¹ˆÂnwá}ûö	x\ZÎ—‚BCUy@7èX¬\0ĞÕ{r`ss³¸‡\Z‡qÔÍh4ºm×n|´°F-†rft›Ífu¬tËa\'³«rW<\n\"UUUôâÒ¥´—»³Á`P5\"8†‡‡SaA­[»–İöt÷­¨ñ¼ş‘È}z«nûÀûÔ~¯¿m?@/_a·\0bBÕÊŸ)¨é€Nİ‚È¾¯¿¦_<ÿ<ÕÖÔVeC9+Œ‹§¿oÜHS¦ø>\nWVVRvn.Õó„*¦öU)1–\'TÏ>MIII*z…?.àaáÓßj< t„®îŠÛ>P¼,*ñ[rñU°»mäyĞ	ºAGgëëìİ˜——G/,\\HøÆ\rë§f/ªé°nĞºº+Üô«İ»éèÑ£„É\r>¤SØ\\XXåççÓ´©S5òÉ| \nXu[¯ƒH·[Vù…êèƒ=ø’úz	ßã ‚¹ÀòòröşI¦1K<wÎáä{R|D-^L¬_ïw=òèà\'·)))~o[6èuAvşÁ†\râë%|è¯£ƒ:½ıvÁóI\"]ÉÓùüM›˜D@·ò×¡½—k^¹r¥TØ7*\'‡¢bcÅÂ¦±ü%f|³Ç2cÆ5©Ü‹-ƒZùé~ÛU|\"v*:KêĞ¡ôé\'ŸPÆ°a­+s~\ZÊa±Y¯,[Ö£\0\'ˆØp£ùÙÚ#¶ü¹¾üĞÜ`´Ğì‡iù“®÷‰`‡Á÷ı^#–_Ïû+âwö†Šv\\¤Çªø+ıÖìğ2ÃIä`qØ…SÓĞùWøH)ôz½H-îç6€‰ın.Ùx–´Ù©‘Ôbnï²ØêZr¡–]­ïÑ.Hƒ˜€0ËavÚq™…Ê9>tK=o¬+Úq©mkS )ãïgAŒ\00±ß±	f`§}$3–·u…Š>-%˜IWİ6Ò¬Õ‡è?§nùû™¦=è`&RÀ\nÌÀNl¸şâd­øø<EÙíÆÉØfá“á8ñ·äX=ÿÎFyÑ´hZšOı×árúòTµØÄ×£ÂvTQßD\r¼cUÇ[€ƒíœz*ş¶j~Í“Ø¾c}é‡§éğ¥zŠà}°öÑULuóMa²Vşìıÿ¹‚TZ2#Ã\'ºbÚ\ZŞF…\r|P¢A{¯Èö`:³hä}Õã†ÇÒÚçr…îE\'®?A§¯7ˆ¨ÒáJ\0µ¬¶‰Ò@ŞÉî4ò[¾j?¿eØb¨¼Ü¢hÃ¯Æ¶=¦Ã¯ûe.ÍÍO*š[\\/á­$D…Ò_¾¸êµ¾›JÊD\0Ôz4­¥,‚	Ø€‘½(ÖÙ{¶š>>XAû/Ö\nŸÔÚµx“1;R˜7İ>rë²GØ7voª	÷(üS‰¸§(k5ÂÊŸù^İ˜‰ÆÑüñÉT˜Óq\"@I¸ºÁH{fYM3™ÖŞ³5dâÒ\"ŞÊ“¦ß=1¼[–¸¹ä†Øıƒ*Aéo§ç&ğËÒõØò)ü<\\ØĞø0z”¡¡·¹’N:_ôú¦³TÌ	%\n0@Ä~Y6ÈO_Ç[ <ó…¨ôÌº£¢ö€Œrx9CêiËoZKŠôñÈk¿öãL‘/ÊÉôæ&vç±®ŸŸ¨¤k\\!I–€õàs”wÊ{Ü€Ÿ.ğ Lyú¨QOJN&„±5~~¢ÊãQËú]¥Áù¥LLœ\ZáêcÓ£ı¤ºošñ š|ê‡ÉıÕ½öáüëM´qÏu·Ÿè¿§o‰®kŸ¶ÀŸşTìí]µº<˜—C£†F‰î&–ôf\ZB×b£m‡*8×l¯=€ÒRI<4*Ìïúò\0;Ãc€xş%§‹\"e2Õ€¢îÖs5]ªwâÚ:uı…ØUIBy¥_ûhTÓåøø„n“Íãá¶ÂöB4(LóÏZt%«ÿı­Cu8¥ôAzš5¶ãÖ‚®îï@<ø³SR©‘kÌØ[a×Û*>_ëR¯³eßS9[ªs®¹ùÉm¹e @ñäº\rÙyü€P‡èÉ~ío“{¹òçrœ<r`d-˜Øsë½ÀR:·Û\0q³gfˆ¢„Ò\n1!ğMYíæò¡ÎRÊ9ß®oªE)9ˆÌûæqTïe×A5¯\0Î\Z;ˆ’¢ÃcFr:ŒR>Ü×1±şgq™Ã¬..ÑñšÂ‚I©Ş\ZA^ï@äq/L{@ÌTH»\\ÙÈÕëÚ~w¡ü.í:sËa²şóçSRD2İ›Å+€Pü±Qƒ„/D.\'¬PX\"Ñ®ˆ)eçñ›¢ş,ß9;ÏñKøŞÒk€˜îzfrŠHiäğÓ^û/ÖQ%¯%@şáÔ}1¿6st¢˜8èíâ5@\0x‚§´°n\"ÕÂ\"X¼ÿåÂ˜WÏ9¢Œ¼¢¼(O@,~<­·³Ïï€Q<•5md‚\0#–y€×X¶*\'½ŸCWÏk\nÑN*mŸ\0„r/qJìP&Ö†-­9 º÷sÔS^Ôg\0QSjrVOuµ[!º²ıâfµsRˆoJÔ\"> ¿ıQ5peXš³`[<=]-ì|ç%‘Hök‹K£&¶BŒ‹‘Ú eAÔEeÌù\\Vtdj”ª\0z´&â®æÇ®Ş¦GnÒwÕja€C¹xÿ^(šÊFmò‰A¥­\0\0\0\0IEND®B`‚','Mail'),('107','grades','grades',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0ò­\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0ÜIDATx^í\\Å\Zş÷v÷9gğ@xÁD¡`¶ÄøJÁl™0”9gË²Ì±°°´DÁHõÊ2`™A”,ƒƒ;ÒÅİÛ½½÷}Í55¬³Ó³·÷ºjêöfzzº¿şsÿİzqYâ¨ê²ÅÔVóx<R]]-¹¹¹)ûÇ\r€ì¯¦ ßï—¥K—Ê_|!\'NL	ˆF\0kjj¤²²R222Äëõª¿M¥dffÊ_ı%ãÇ—K.¹D^|ñÅ¤wİˆ$+dee)\0I…Måª««RaÇåçŸ–»ï¾;é\0\Z)p÷îİâóùhìPS*¯¨¨Hzè!%÷ìÙ#}ûö•É“\'\'mF\n$õE\"\'|Addg‹¯Eñ·n-şví½Ú´oóæ’öKô[D‰määä¨‹”¸eË¹öÚk“ ‘9k,¤@v¦±ÅCĞ¬’}sçJÅ’%R³aƒ·o—:ÈX›Õ£‡44HÚœq†40@êjk¥®ªJ½o!ç°ç{N‡ÕU^^.-0Ó¦M‹·ÉÔw`\"àe ã~\\»e4aéW_è\'ƒ 4ÈTş¯&êÁ	$»{wéqÿıÒ²‹ F‚Á¸L\0·nİ*¯¼òŠdcrÈE©ÉâÓ§O«ÍèÊ)ĞƒÎg¶l)%_~)ë|PQ›ƒ¨Ç\0Z«ã—Ö#FHnïŞâoÛVê1¨àÎR±j•”~ÿ½„÷íS¬óÕ‡÷¢Ìğşı®L¥W\\\\,o¾ùæA\0)4%jÓŒ 6–»R ›ü>v¬ìÿí7!ÖÁìtŞyrÌí·KÜg©JåD\n¤™à}xVŠ]}Ï=R¾r¥’•Á²2ñÍ7ÒáœsTÛn\nÜ1iÒ$ –å¤@M´2‚ ìO>ùDY\Zñ–¤è‡Ø\r·è¬³ÄÍª¨n—^*ƒ1ˆLñZ\0IV¬%Ä,\0Ó‹çàıõ¯¿.+ÁÆÙx7°k—Œ^½Zrzö”zÈFS!€;vìwß}÷\0£@\\T ŸS¦LQ²1bÔÂº17¶Ÿ¯U+)ùúk™wúéâÁàÉ*§.\\(Çş¹D0»AÈ‚êÈv…J&Z™\Z¸<L¨¼ûî“a~(Õ\0ï-Aœ	\ng1õIƒ²P_”{¼hdë«¾Ûbäúë¯—2Pz<Å ©“úy\0\"»-¸è\"ñb½èĞXÈ±Ü!C¤ŠÂ *W¬…;ËòÑ£Å ¬mg\0Øï½\'sA}p¿< Ÿ×àİ0;º_y¥„C!Ù·nìg{¦¾‘Ò½\'+ˆÑ`PmæÜvÛm²mÛ6×\ZÔ-9Údì ¨¢À\0<*‹s7m’¨ˆÚ“ZÕ‡Y^vÁ¥oõ`cŞ×í’êö-Z$!|pÏ¬Y‡Ø5{÷ÊP°)˜¦Î6P´rÕd\'À®]»\n)Œ`“¥£ÔÔÈ¿”]ºt‘x@Ö¯_ï\nD×\0:µFĞV=ş¸’oÈ’Ó/V¿©q9H‚»ù7¤\0„@!¤bùrñ Ó,Ï‡{ş^½„’-Œs0T>hr¶Á: @¨xvAÆf4¼k\Ze-d%Y“àQÖñÿè‹J„ïó/å ½—Å‡©•ˆQ&`pÙ`Ç 5iß[n‘Ø{Ôš,¤2*–o@Œ`×âYÿ§Ÿ–>P^¼W6o”Í™£LJÌ|V§NÒrà@e¾dâİŞwŞ)¹\0w5ŞYóÒKâ»ÿâ!àR^<Ê;\ZÕ!p\0ÿçEªÓA>×¬Îgœ4jèNè‹S1XZZêØ\0µe)\0˜…zuê×3è@óÅÀ6¾ó,½÷^i~ì±2ä…dşe—I›‚¹\0²n:HAÇG&ØìÏÂVú^u•Œ„™±öÜR°åíe¨Ã‰pb# ÆZ¬ïÚıæ½:8ßÈÂÚÀŒ%oÈZ»\0 Ák\r×+«}{e×éú~€²ô™g„>D>şö€IÃßÛ—-“j°”ô‚‚>ñ„t¹øb©„¼£½xö/¿ÈÉS§Êp¸ağ$h·UÁ$‰\0ˆ:\\!P ö^L²PAÛú/e¤¾¬\n‰ˆéÿM,lPÏL,G­‚µÏ8M+h\\vN×õÃ¬ÙöÃRÁzÀÂíN:IvAQ´\0Ğ|ÉcÉ¥ğ<®\0%\r}öYñwë&5x?ìÚnÔ(éJıÌúÑ È¾z°]rÊJ=¤O–A›´³›ç&àôsW\0:}\rEê¢¼µaJÕÀÈfÅ³gËLx4k¨¦öé#Ó	\"‚œõcË¨XPŸfN-dS%X™õ”çêAéÔ6x5°	·C¨Ó”é7a‚¢mŒÓm¬Ü¼YùÑnÀ‰§	H#€ºXlB6¦¬„ÛDwLiMªv_5da\0ÆıvùùÒãÌ3%oÜ8©ERÊ-{í5EM”ÕğsÁ˜’Á¨\r\0ÒßÌ‚MùÛÃ«6h¯\0Ê$p•\\ÃDíÀDù¡­YÜ°³›:&àâbZÙ	ß©P‰ì„]7óÂ%Tu„»ò\Z@E›Á¾ÿÌk\rãùAÈ¯jR+.úºËÔüêæ›% Üª\n€Âh®ƒ7ğÆ%Ô°C-]ƒ>L;î8ò0(‘áÏ?/A„Ù8Y5%%JææÂ½‹¸pïÜÃz¤ÔÎè»SI˜Ùé`SFëİ(FèœTAºú³ÏhQ€¸àT\0ˆ*\\å\0¸à¦›”iA\n]*$àô>4xšš2aÊü\0YH\noÙy2J-R`õ #4ŠuCa¦:n6¨å…Ucò›16PP>\\ RWáwH”åY¡Pé­\Z†Ybm«\Z,xÔÈó¡@xÀ¤·qP3â]¹uP4ı¯¸BÆ#Pğ•üxônJÿøCÚ\r&uèCÌ>Z´­Û:nµ°Ñ,!‹4È–˜³Bc\Z”2	”GJ<,Z	jÛ	¿µ;¢ËŠJ¢JŒä90¦óàat…Ö­³	˜RË·€©C%hˆó•Ôf.ÚÃàÎEà•²8™EH×Î©d8È *p@µ Éıû+Jìª»pæL%—ôÀí:’áO³Ä<]_›RJ9ÁŒ!€³¡‰;Ÿp‚ä#¾ÈY²‹¾tRd ©ƒ”EÙ˜­	\"0·æÛoe\"»nÆiALMK¶.Pfï:ÎrC¸ß–\rCÎÎ„L<æÜseBıÚÌ1õ/UÏÈˆn<…\n$ìü#|âEï¿¯¨±-Xõ¤\'Ÿ”A`mú±!hjN;ÎäŠiS%¦Ì*ÄçÀ/€¥Jh ©MåYÇÊ¾uƒqŸÇ`¿K.\\º´å¢—_–?Ş~[vC‰Ğí3|¸ºáé‹Àh3P&Gò2L]\\ı£ŒcxŸÎ>³°z6áıwã~úIZµ¯ÏäÆ[—\n§;äkÂ\0š¨$Öh§eÁÉë•­Y#!7@ğ¯…İÈ¸_®.\0…Š Ü·¶ıú)ğ”©Ï¢xÁ	ÁÉ¿újíN?»’ÁF,qÆësÜ	ÈU­dµXS%,Ì0ÒNDbŠ~üQÊÿşû€=eSòûïÊ8î\nåĞ\Z‘›ÎXµë~ê©R9©k§u”dt2ª\rR`¬S\'DP±U‹êºVJ&{P²ªZ®§[Æ˜\"¾E­ÌÕ:ÚvöÀãÆ/ê7[­…ëeáÆt<ïpñ‹”^%Dù«{A´8WH:•®oø!G‹`¼/€Y€œÕË\nı¾@-Lû#é=úÚUş)ÃK¢åéD}Iså¸p4°0ehÌ¦Bhú\0lÛ.X~Íÿè#	Â{rbá¼¼¼ÿ\rVJ‰Kª12h	Şr÷åH6¢Z\Z*Ô_‰p‰‘…MÑh½Â•ê¿Z”Øõ‡é\n¬æ­xäáojtk½Lx1E| k±ÆRÅ0nf-=!ËòC¬qšÀ5ºrÌğ´+d	®¡2Øê¼ijCºT´íÄ	#Ö?!Ò½‘Ÿa>*t­…í¨ØVÛ‘Ù5‡Qpd¯ú#º0¬6rÌün,C$¬…cÉ@®±º¯%RUüV¬Â`DÒ?¼]#Ù9¦J.@_‹t‘ï\0ã½/¿\\òŸzJj\\€çVy\Z)p¢+±(IŠŒ¦š	 )yÎ¶“	Jk†õå©ˆáúµ‚àpë­²şÓOe\'‚ºŒ\\sŒFp£2Ğmáw™SíTŒ\0nÜ¸1æû”{L‡HG!û’Šc\"\0o\n®˜N¦…ÁÅùŠ8İRØZ;!\07 ³”ÅÎ•RË—iÚ7BğœÜ9ö…¡4.l­Dô§æW‡Áƒå¸ë®“\0\"A}Åã²=~3a\0İf)¥ƒ\nİ|Cåâ\0D/àÁB46zC\nì{Ê”ˆ›¥»#6µÍL‰càÖ]¹FË¬0ÚZÅ³šßTêÂ.’ üáäìÔÓv¤ìŒÚ‰e\"\0W\0• bP^˜:ëaâ#‡z½ÌÁI:€z\r¶©P•Û~2ßzÖ£«‘øT•ÁXwVë4© À&LpiL®Â\"ı&&71Y	ù‹tí˜İ ‹Û1YXS \'¡Íš2‡ãÒ¦Ft÷©P)(fYŸ«Pğ—#…©ÆíÏ?_Zc‰Tí„²É4É@£!½\Z3egÒ¦bÎq:|a»A<»h1#2\"_{íÇË(ÚrŠÚ6¦ÆÀT_øÆs±æR\r;‘~òÙˆ2*Z[ëÉ„İQI1cìdıSS’Nªëş£_dCæ;cÔ«±Áš+yÔ®j‡((sRHö\"@„w\ZV™›¨×§íÆh¢@#;	e‚6›Îÿm\'¬ØÑæ–\"‘s%Rá²á\'—şú«|‰¹ÒµkU`a,V\0ÉÂõ\\“¶ÙD®-€F^g<–+´múX2ŸSær\'”°g²åfD›ç\"ò¢w¿Q=[‚\"/Fş5ÁÓ¬«_$†$Ã;#€Ë±Ÿ#€É$Ùmå‚ê6#£a!â Ê6\0n0‘ò‘OS’›Ì8tèĞÄ\0\\†lú¦ )“ÉHÍl%§0…„)ÄtóÜ®0ÀaÈ=Lˆ	 ;O$#ÙÔ”H{V§\"¡ïqá#ó›p8ryœJBJÄ­Õ8ëéÁs3c5vCí†ß‹}d¶~ot?âÛ5Íîá|Ò¾\r…Ã\rßÛ‘ T†OA$:¹İaÂç¨§@N·Ön»ë.©åeA«æ iI¥ÔÙ˜/I÷…İ|ä°Ö!‰8l°É€gR\nªÛƒíhôœzÒïmØcç¦ß)¥À}OÌoıcÀ¸ÇT˜áz›Pï1ÿe–:éÌõÂ²giÂ¸ÏM@Áh.ÂŞ6;3FoM‡/¬×…¹‡Ø:(n‡]L×=ğgOÀcÙÈ¤¢g¡&–uñ{ñÈ‘*U®=|â|¬ÒUs7•‰¬\ZÓP‰÷Sª…y\ZF:.Û¸$Ì²èéalÄe\nÈÎ(ğdyğ{®ò\"Mw<nŠdĞÀ-õ¹¡À„•\né¸ì‚ÜW|,Î¤á¹GÅ0QŠp,\03°Š\0Ö,d¶V!s‚\0Ÿ‚#¸K*ğthËD¬F^€<e;V–~Ã	nfÊÔ§ç\\&KY\rz~—ië_}UV`Ñœ{ğèó’E¹6Ü8\na­ı\0Ïgz0ÛV§`\"û†Š‡RÀT”¸|·2¶¨•o½¥6!¶Eo0vÈ·?í4)o`ÛÆ|ƒ\0ÆA\Z	8şü#@Pù½Xç UµVcYÓi÷“@	à˜1c’à‘îÛqI\"}Ö,lĞ¨DÜÌÔ‘PÇ.ò~5\0¦,»oüÀ‘7x¤kàÇïøº›±lÎCã´¡R9¨tµMğx ™©\rizóÉĞÇ!éÑp¦NçVjÓ\ZøÄOT—9Ú[+[Z_šÚ¬\'úğ7·|ÑĞõØh,×÷ÊÕí”jÕàì;ÃàNu}¢%ßµ¶£ë«û{÷îEĞ›ú\ZhÕ‡´rğ¼§AÓğ¾>ƒT;øÑ3¤ëğıÃ\r¢>PŒn§]QÇ0)“ûLòÁÿ5‘ğ7ïëÜíÏóà¬y×T\rŒ>¾I/’[©°R§]§¬Ô¬gÎ@N&ëêïZ©+Vû\ZD+•ê÷ô:î©Öç\rz\në©Õ”g=˜Ë.ìİ	\rL,O û‰\0¨)\'º\r»ûVù-Ë£·²«¦D‚ªO½ô`Îs=éĞ jjÔ\0jö¶cGıÌ-…é°”nËí{NÔÃgšBÜ*7}n`tv…LŸ-¨©“ YYXŸ|ù_\"ãR©½ÌI\0\0\0\0IEND®B`‚','Grades');
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
-- Table structure for table `teachersubject`
--

DROP TABLE IF EXISTS `teachersubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachersubject` (
  `userid` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`,`subjectid`),
  KEY `fk32` (`subjectid`),
  CONSTRAINT `fk31` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk32` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachersubject`
--

LOCK TABLES `teachersubject` WRITE;
/*!40000 ALTER TABLE `teachersubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachersubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `testid` varchar(45) NOT NULL,
  `questiono` int(11) NOT NULL,
  `question` varchar(45) NOT NULL,
  `opt1` varchar(45) NOT NULL,
  `opt2` varchar(45) NOT NULL,
  `opt3` varchar(45) DEFAULT NULL,
  `opt4` varchar(45) DEFAULT NULL,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`testid`),
  CONSTRAINT `fk24` FOREIGN KEY (`testid`) REFERENCES `testnotice` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
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
  KEY `fk22_idx` (`testid`),
  CONSTRAINT `fk22` FOREIGN KEY (`testid`) REFERENCES `testdata` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  `maximarks` int(11) NOT NULL,
  `dateoftest` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `maxitime` time NOT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testnotice`
--

LOCK TABLES `testnotice` WRITE;
/*!40000 ALTER TABLE `testnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `testnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userattendance`
--

DROP TABLE IF EXISTS `userattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userattendance` (
  `lectid` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `lectsattended` int(11) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lectid`,`userid`) USING BTREE,
  KEY `fk25_idx` (`userid`),
  CONSTRAINT `fk25` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk26` FOREIGN KEY (`lectid`) REFERENCES `attendance` (`lectid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userattendance`
--

LOCK TABLES `userattendance` WRITE;
/*!40000 ALTER TABLE `userattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `userattendance` ENABLE KEYS */;
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
INSERT INTO `userbranch` VALUES ('aman','cse-1',1),('manik','cse-1',1),('ram','cse-1',1),('sham','cse-1',1),('virdi','mech-1',1);
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
INSERT INTO `usergroups` VALUES ('aman','1002','1'),('aman','1003','1'),('aman','2001','1'),('amar','1004','1'),('amrinder','1004','1'),('amritpal','1003','1'),('amritpal','2001','1'),('ashu','1004','1'),('avinash','1003','1'),('avinash','2001','1'),('babbar','1004','1'),('bagga','1004','1'),('balkar','1004','1'),('bhaskar','1004','1'),('bhinder','1004','1'),('charna','1004','1'),('davinder','1004','1'),('deep','1004','1'),('gogi','1004','1'),('goldy','1004','1'),('gora','1004','1'),('gurdas','1004','1'),('happy','1004','1'),('harcharan','1004','1'),('harjeet','1003','1'),('harjeet','2001','1'),('harjinder','1004','1'),('harman','1004','1'),('harpreet','1003','1'),('harpreet','2001','1'),('heli','1004','1'),('hodcse','1002','1'),('hodcse','2001','1'),('hodme','1002','1'),('hodme','2002','1'),('ishu','1004','1'),('jagdish','1003','1'),('jagdish','2001','1'),('jaggi','1004','1'),('jaspal','1004','1'),('jassa','1004','1'),('jatinder','1004','1'),('jeevan','1004','1'),('jugal','1004','1'),('kaka','1004','1'),('kala','1004','1'),('kamal','1004','1'),('kevy','1004','1'),('kiran','1003','1'),('kiran','2001','1'),('kulwnat','1004','1'),('lakha','1004','1'),('lakhi','1004','1'),('major','1004','1'),('makhan','1004','1'),('manik','1001','1'),('manjeet','1004','1'),('midha','1004','1'),('mirtunjay','1004','1'),('narinder','1004','1'),('navneet','1003','1'),('navneet','2001','1'),('nikhil','1004','1'),('nikka','1004','1'),('pamma','1004','1'),('partap','1003','1'),('partap','2002','1'),('parteek','1004','1'),('prakhar','1004','1'),('prince','1003','1'),('prince','2001','1'),('rajdavinder','1003','1'),('rajdavinder','2001','1'),('rajesh','1004','1'),('rajiv','1003','1'),('rajiv','2001','1'),('rajnikant','1004','1'),('rajveer','1003','1'),('rajveer','2002','1'),('ram','1001','1'),('ranveer','1004','1'),('roomi','1004','1'),('root','1001','1'),('sam','1004','1'),('sampooran','1004','1'),('satnam','1004','1'),('saudagar','1004','1'),('sewak','1004','1'),('sham','1001','1'),('soma','1004','1'),('sukha','1004','1'),('sukhjot','1004','1'),('taranjeet','1003','1'),('taranjeet','2001','1'),('vinay','1003','1'),('vinay','2001','1'),('virdi','1003','1'),('yadwinder','1003','1'),('yadwinder','2002','1');
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
INSERT INTO `users` VALUES ('aman','aman',1),('amar','amar',1),('amrinder','amrinder',1),('amritpal','amritpal',1),('ashu','ashu',1),('avinash','avinash',1),('babbar','babbar',1),('bagga','bagga',1),('balkar','balkar',1),('bhaskar','bhaskar',1),('bhinder','bhinder',1),('charna','charna',1),('davinder','davinder',1),('deep','deep',1),('gogi','gogi',1),('goldy','goldy',1),('gora','gora',1),('gurdas','gurdas',1),('happy','happy',1),('harcharan','harcharan',1),('harjeet','harjeet',1),('harjinder','harjinder',1),('harman','haman',1),('harpreet','harpreet',1),('heli','heli',1),('hodcse','hodcse',1),('hodme','hodme',1),('ishu','ishu',1),('jagdish','jagdish',1),('jaggi','jaggi',1),('jaspal','jaspal',1),('jassa','jassa',1),('jatinder','jatinder',1),('jeevan','jeevan',1),('jugal','jugal',1),('kaka','kaka',1),('kala','kala',1),('kamal','kamal',1),('kevy','kevy',1),('kiran','kiran',1),('kulwnat','kulwnat',1),('lakha','lakha',1),('lakhi','lakhi',1),('major','major',1),('makhan','makhan',1),('manik','manik',1),('manjeet','manjeet',1),('midha','midha',1),('mirtunjay','mirtunjay',1),('narinder','narinder',1),('navneet','navneet',1),('nikhil','nikhil',1),('nikka','nikka',1),('pamma','pamma',1),('partap','partap',1),('parteek','parteek',1),('prakhar','prakhar',1),('prince','prince',1),('rajdavinder','rajdavinder',1),('rajesh','rajesh',1),('rajiv','rajiv',1),('rajnikant','rajnikant',1),('rajveer','rajveer',1),('ram','ram',1),('ranveer','ranveer',1),('roomi','roomi',1),('root','redhat',1),('sam','sam',1),('sampooran','sampooran',1),('satnam','satnam',1),('saudagar','saudagar',1),('sewak','sewak',1),('sham','sham',1),('soma','soma',1),('sukha','sukha',1),('sukhjot','sukhjot',1),('taranjeet','taranjeet',1),('vinay','vinay',1),('virdi','virdi',1),('yadwinder','yadwinder',1);
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

-- Dump completed on 2013-10-29 14:31:10
