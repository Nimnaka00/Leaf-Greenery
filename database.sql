create database online_shopping;
use online_shopping;


CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(200) DEFAULT NULL,
  `uemail` varchar(100) DEFAULT NULL,
  `upassword` varchar(100) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `usecqus` text,
  `uans` text,
  `uaddress1` text,
  `uaddress2` text,
  PRIMARY KEY (`uid`)
); 

CREATE TABLE `supplier` (
  `sid` int NOT NULL,
  `sname` varchar(100) NOT NULL,
  `semail` varchar(100) DEFAULT NULL,
  `spassword` varchar(100) DEFAULT NULL,
  `sphone` varchar(15) DEFAULT NULL,
  `saddress1` text,
  `saddress2` text,
  PRIMARY KEY (`sname`)
); 

CREATE TABLE `category` (
  `cid` int NOT NULL,
  `cname` varchar(200) NOT NULL,
  `cdesc` text,
  PRIMARY KEY (`cname`),
  UNIQUE KEY `cid_UNIQUE` (`cid`)
);

CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(200) DEFAULT NULL,
  `cname` varchar(200) DEFAULT NULL,
  `pqty` int DEFAULT NULL,
  `pprice` double DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_category_name` (`cname`),
  CONSTRAINT `fk_category_name` FOREIGN KEY (`cname`) REFERENCES `category` (`cname`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `p_date` varchar(20) DEFAULT NULL,
  `uaddress` text,
  `receive_date` varchar(20) DEFAULT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_uid` (`uid`),
  KEY `fk_supplier_name` (`supplier`),
  CONSTRAINT `fk_supplier_name` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`sname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
);
