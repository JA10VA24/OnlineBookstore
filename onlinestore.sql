/*
SQLyog Ultimate v8.32 
MySQL - 5.5.20 : Database - onlinebookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinebookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `onlinebookstore`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` char(32) NOT NULL,
  `adminName` varchar(50) DEFAULT NULL,
  `adminPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`adminName`,`adminPassword`) values ('001','zhangsan','zhangsan'),('002','admin','admin');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemId` char(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `orderId` char(32) DEFAULT NULL,
  `bookId` char(32) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `t_book` (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemId`,`count`,`subtotal`,`orderId`,`bookId`) values ('017444D7378F4EE18E2C94DC34830CEA',1,'108','F304FB0A3DC14084BEFA08569069EB36','5'),('0381690199BF46EFAC9A91817E535B6A',8,'294','C1D510AE756541AC8165AFC4E2D33444','2'),('0D649D0A671C4FDCA5BC65C678BA0505',7,'257','D2F05B77FA5341C89C43A3A09FC232A5','2'),('182B4DB692BD4608B0F662029112BDDE',1,'63','D2F05B77FA5341C89C43A3A09FC232A5','6'),('1D9E818C22C245B392ECA440519DCA67',1,'49','7054B9AB32324152936D6836CFF2ED21','1'),('204798F025C3409FB5D9079F70244728',1,'49','404D8550BC3C49A6B54FB34381C11E4B','1'),('20B5DEAFD18C4FD583734F4825D040BB',1,'49','1096C5704E27432D9D77C944D9B08DDE','3'),('3E19DCD5C4E848F4AA0C36B59506E327',2,'97','F304FB0A3DC14084BEFA08569069EB36','3'),('40A45B36FE614B89A1D981454A6BC9D5',1,'49','DD1F962EDCB841BBB87BAFFD38DF82EC','3'),('59A7ECC1EC144803A9E0B6C6F6F5D3ED',1,'49','C1D510AE756541AC8165AFC4E2D33444','1'),('60D099E6466D4582BB666108A057D261',2,'185','1096C5704E27432D9D77C944D9B08DDE','7'),('66690C80E60C4FB097ED015191221AF2',1,'49','19CF513EE93B47D39C8B65569BA7193D','3'),('82C017445FE84739BAC8FE55AB82BF51',1,'49','D2F05B77FA5341C89C43A3A09FC232A5','3'),('8AA2FEB7010C480FBEC4983B426C9812',2,'118','C1D510AE756541AC8165AFC4E2D33444','4'),('94DD495E9F02432BA31C25E702502BBA',1,'49','F5DB8FAC49C94E2196D9B476FF991F9C','1'),('A6B7FD4BD88347E892FF84580635AB74',3,'146','D2F05B77FA5341C89C43A3A09FC232A5','1'),('A767FAFA63924B0E9246E20DC8EA3ECE',1,'49','404D8550BC3C49A6B54FB34381C11E4B','3'),('CC7049A8DA424531999BB41AC88BF898',1,'37','F304FB0A3DC14084BEFA08569069EB36','2'),('D55B2548BB3C4E12B8671803023E57DB',1,'59','F304FB0A3DC14084BEFA08569069EB36','4'),('DBE04A848FBA493A9536DC12B9C1654B',2,'118','D2F05B77FA5341C89C43A3A09FC232A5','4'),('DC31A1E5778A4780AAC98031A6C544EC',1,'49','53E0C33CFAB949A492CE4DF646A0B630','1'),('E8014C57E5E542ACAD55A4CDE612F783',1,'49','F304FB0A3DC14084BEFA08569069EB36','1');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderId` char(32) NOT NULL,
  `orderTime` datetime DEFAULT NULL,
  `orderTotal` decimal(10,2) DEFAULT NULL,
  `orderState` smallint(1) DEFAULT NULL,
  `userId` char(32) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`orderId`,`orderTime`,`orderTotal`,`orderState`,`userId`,`address`) values ('1096C5704E27432D9D77C944D9B08DDE','2017-04-18 20:58:32','233.70',4,'0D28FB736BD841AB94A682DADB89C62D',NULL),('19CF513EE93B47D39C8B65569BA7193D','2017-05-06 13:49:27','48.70',3,'0D28FB736BD841AB94A682DADB89C62D',NULL),('404D8550BC3C49A6B54FB34381C11E4B','2017-04-17 15:14:25','97.40',1,'0D28FB736BD841AB94A682DADB89C62D',NULL),('53E0C33CFAB949A492CE4DF646A0B630','2017-05-02 12:38:15','48.70',2,'0D28FB736BD841AB94A682DADB89C62D',NULL),('7054B9AB32324152936D6836CFF2ED21','2017-05-02 12:34:39','48.70',1,'0D28FB736BD841AB94A682DADB89C62D',NULL),('C1D510AE756541AC8165AFC4E2D33444','2017-04-16 15:44:49','460.70',2,'0D28FB736BD841AB94A682DADB89C62D',NULL),('D2F05B77FA5341C89C43A3A09FC232A5','2017-04-16 15:35:25','633.30',1,'0D28FB736BD841AB94A682DADB89C62D',NULL),('DD1F962EDCB841BBB87BAFFD38DF82EC','2017-04-16 15:06:35','48.70',2,'0D28FB736BD841AB94A682DADB89C62D',NULL),('F304FB0A3DC14084BEFA08569069EB36','2017-04-16 15:07:35','350.00',1,'0D28FB736BD841AB94A682DADB89C62D',NULL),('F5DB8FAC49C94E2196D9B476FF991F9C','2017-05-02 12:32:57','48.70',2,'0D28FB736BD841AB94A682DADB89C62D',NULL);

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `bookId` char(32) NOT NULL,
  `bookName` varchar(100) DEFAULT NULL,
  `bookPrice` decimal(5,1) DEFAULT NULL,
  `bookAuthor` varchar(20) DEFAULT NULL,
  `bookImg` varchar(300) DEFAULT NULL,
  `categoryId` char(32) DEFAULT NULL,
  `del` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `t_book_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `t_category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_book` */

insert  into `t_book`(`bookId`,`bookName`,`bookPrice`,`bookAuthor`,`bookImg`,`categoryId`,`del`) values ('1','一路编程（电子工业出版社）','48.7','【美】史蒂夫 富特','bookimages/java1.jpg','c001',0),('2','Java遗传算法编程','36.7','英 lee jacobson 雅各布森','bookimages/java2.jpg','c002',0),('22F3EAFBCC8048E9B53D8676C593D814','世界的凛冬','68.6','[英]福莱特','bookimages/shijie.jpg','c003',0),('3','大数据背后的核心技术','48.7','张桂刚(著)','bookimages/java3.jpg','c002',0),('4','Java并发编程的艺术','59.2','方腾飞 魏鹏 程晓明(著)','bookimages/java4.jpg','c002',0),('5','Java核心技术卷（II）','108.0','（美）cay s. horstmann','bookimages/java5.jpg','c002',0),('5E7CCE8DB0464E7A8517C315401F69AB','白鹿原','49.9','陈忠实','bookimages/bailuyuan1.jpg','c003',0),('6','深入理解计算机网络','63.2','王达','bookimages/java6.jpg','c002',0),('7','算法（英文版第4版）','92.5','李胜','bookimages/pc1.jpg','c002',0),('90F96CC883BC4835BE375B6905993298','列表','19.9','的撒多','bookimages/wuweigou.jpg','c006',0),('A92FCEC8F7604CECBDE33868FF690CB7','与撒旦的约定','46.0','布鲁诺.舒尔茨','bookimages/yu2.jpg','c005',0),('AC022BE68E294AB18E6D5AE2977C0673','世界的凛冬','45.7',NULL,'bookimages/shijie.jpg','c007',1),('D0756F50137F403385769CFCE49D08AE','世界的凛冬','78.9',NULL,'bookimages/shijie.jpg','c003',1);

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `categoryId` char(32) NOT NULL,
  `categoryName` varchar(100) NOT NULL,
  `categoryDesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `NewIndex1` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_category` */

insert  into `t_category`(`categoryId`,`categoryName`,`categoryDesc`) values ('c001','经济管理','经济管理'),('c002','计算机','计算机'),('c003','小说','小说类'),('c005','青春文学','青春类'),('c006','励志','励志类'),('c007','人文社科','人文社科');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` char(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`username`,`password`,`email`) values ('0012','zhangsan2','123','dasdasd@qq.com'),('0D28FB736BD841AB94A682DADB89C62D','guo','123','abc@163.com'),('29F32F272E11458AB87EDCC941772211','guo1','123','aaa@qq.com'),('9D0DB6171D354A778558FAC66257EE12','admin','sss','sas@163.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
