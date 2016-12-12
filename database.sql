/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


USE `heroku_73c85a89435eeea`;

# Dump of table SecurityLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SecurityLog`;

CREATE TABLE `SecurityLog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(200) DEFAULT NULL,
  `ip` varchar(200) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `screenWidth` int(11) DEFAULT NULL,
  `screenHeight` int(11) DEFAULT NULL,
  `allHeaders` longtext,
  `country` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `SecurityLog` WRITE;
/*!40000 ALTER TABLE `SecurityLog` DISABLE KEYS */;

INSERT INTO `SecurityLog` (`id`, `reason`, `ip`, `date`, `token`, `userAgent`, `screenWidth`, `screenHeight`, `allHeaders`, `country`, `region`, `city`)
VALUES
	(1,'Empty token header','::1','2016-11-20T05:53:45.860Z',NULL,'PostmanRuntime/3.0.1',NULL,NULL,'{\"cache-control\":\"no-cache\",\"postman-token\":\"cd51183b-96dd-412f-9457-f33bbe037ff8\",\"content-type\":\"application/json\",\"user-agent\":\"PostmanRuntime/3.0.1\",\"accept\":\"*/*\",\"host\":\"localhost:1337\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\"}',NULL,NULL,NULL),
	(2,'Empty token header','::1','2016-11-20T06:25:20.725Z','','PostmanRuntime/3.0.1',NULL,NULL,'{\"cache-control\":\"no-cache\",\"postman-token\":\"3397b308-3eac-4a3e-a97f-4258be697b1e\",\"content-type\":\"application/json\",\"x-token\":\"\",\"user-agent\":\"PostmanRuntime/3.0.1\",\"accept\":\"*/*\",\"host\":\"localhost:1337\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\"}',NULL,NULL,NULL),
	(3,'Empty token header','::1','2016-11-20T06:25:59.448Z','','PostmanRuntime/3.0.1',NULL,NULL,'{\"cache-control\":\"no-cache\",\"postman-token\":\"ef28d57c-78f1-4fe2-b091-174e8050eada\",\"content-type\":\"application/json\",\"x-token\":\"\",\"user-agent\":\"PostmanRuntime/3.0.1\",\"accept\":\"*/*\",\"host\":\"localhost:1337\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\"}',NULL,NULL,NULL);

/*!40000 ALTER TABLE `SecurityLog` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` varchar (33) NOT NULL,
  `sessionID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`, `sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dump of table Token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Token`;

CREATE TABLE `Token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `dateIssued` varchar(50) NOT NULL DEFAULT '',
  `userId` varchar(33) NOT NULL,
  `revoked` int(11) NOT NULL DEFAULT '0',
  `dateRevoked` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Token` WRITE;
/*!40000 ALTER TABLE `Token` DISABLE KEYS */;

INSERT INTO `Token` (`id`, `token`, `dateIssued`, `userId`, `revoked`, `dateRevoked`)
VALUES
	(6,'792a68e7-2896-4b69-8695-aa48ee866d99-4f9c4911-a532-4c53-9f5f-2c97e850b308-d3ab1707-7a90-4adc-90d9-68f3d0cc415c','2016-11-18T02:39:51.018Z',8,0,NULL),
	(7,'d5f27f1b-c56f-40e1-8f19-d8dd030c2726-aaf7ea5a-75a4-41c7-8177-8218fe133789-e6e6ead9-c9c6-4cd8-9b4d-3e44ad08fba3','2016-11-18T22:28:12.333Z',1,0,NULL),
	(8,'26b3bdaf-1cd5-4021-952c-77741b059052-8bf4f52e-3ebe-47cb-85e1-f31e884affdd-d50afb97-386f-41ff-a62c-cd02eef5a8c3','2016-11-20T04:42:44.288Z',1,0,NULL),
	(9,'ae5b5a07-c865-473c-9da0-fd7fee069fa9-403627fd-cc97-45cb-b311-4f814aea572a-a96ebce4-7811-4a8a-86af-b9d50995eb53','2016-11-20T04:45:33.970Z',1,0,NULL),
	(10,'d76712ef-72ea-4d10-8e86-1de686c56ba7-9184dacb-aa7c-4a2e-af73-499095aec846-c1c4f39e-c33c-452c-8bfa-13210db2bd06','2016-11-20T04:45:58.867Z',1,0,NULL),
	(11,'9b809719-f9fa-4036-a5e8-f1cb16800b09-e77c4b76-4e37-4d66-8273-f9053ab402cf-a496927b-5a6d-4ebe-a2f5-fbaeb8622a16','2016-11-20T04:51:42.271Z',1,0,NULL),
	(12,'e0771fc5-ffa1-47ec-a0ea-58933ad67366-5022cafd-5d31-4886-82c7-f1b589ce83ca-25b91f5e-dbd4-4a51-baac-0e4234616597','2016-11-20T04:54:59.933Z',1,0,NULL),
	(13,'c8201e81-0442-4e5e-be0f-265caf7fffb7-2845eb79-b5b8-4d37-a34f-65df0088ef95-7d3cb41e-95e8-473c-9e0b-1b175409c39f','2016-11-20T04:55:39.421Z',1,0,NULL),
	(14,'b365b85a-7ee7-425c-afff-559d4f5dd9f7-9d2b55fe-2259-4c39-b366-f0d0648e9fdf-563dbcee-e564-44fa-aeb6-b01240e92e60','2016-11-20T04:56:37.658Z',1,0,NULL),
	(15,'19d67596-d8ba-417e-b02a-1fcf615ba07a-69f57226-0866-4244-95d4-078f05d20ac9-76cad512-9e1a-40be-bf51-f7a65a41ab52','2016-11-20T04:58:25.839Z',1,0,NULL);

/*!40000 ALTER TABLE `Token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Session`;

CREATE TABLE `Session` (
  `sessionName` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hasPassword` boolean NOT NULL DEFAULT false,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `dateCreated` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;

INSERT INTO `Session` (`sessionName`, `title`, `hasPassword`, `hash`, `dateCreated`)
VALUES
	('testGame', 'Hello World!', false, '$2a$06$qFvr6Rs.8JuyFpwjWlTsEejjoPky9ynSWI8qglcN2mzXUfVHusaKG','2016-11-18T00:47:09.396Z'),
    ('passwordGame', 'Hello Protected World!', true, '$2a$06$qFvr6Rs.8JuyFpwjWlTsEejjoPky9ynSWI8qglcN2mzXUfVHusaKG','2016-11-18T00:47:09.396Z');

/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Votes`;

CREATE TABLE `Votes` (
  `sessionName` varchar(100) NOT NULL,
  `group` int NOT NULL,
  `ability1` int unsigned NOT NULL DEFAULT 0,
  `ability2` int unsigned NOT NULL DEFAULT 0,
  `ability3` int unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY (`sessionName`),
  UNIQUE KEY (`group`),
  FOREIGN KEY (`sessionName`) REFERENCES `Session` (`sessionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
