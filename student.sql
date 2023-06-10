/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.19-log : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student`;

/*Table structure for table `cla2sub` */

DROP TABLE IF EXISTS `cla2sub`;

CREATE TABLE `cla2sub` (
  `cla2sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_id` int(11) DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL,
  `tec_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cla2sub_id`),
  UNIQUE KEY `uni_cla_sub` (`cla_id`,`sub_id`),
  KEY `fk_cla2sub_sub` (`sub_id`),
  KEY `fk_cla2sub_cla` (`cla_id`),
  KEY `tec_id` (`tec_id`),
  CONSTRAINT `cla2sub_ibfk_1` FOREIGN KEY (`tec_id`) REFERENCES `teacher` (`tec_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cla2sub_cla` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cla2sub_sub` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `cla2sub` */

insert  into `cla2sub`(`cla2sub_id`,`cla_id`,`sub_id`,`tec_id`) values 
(1,1,1,1),
(2,1,2,2),
(3,2,1,1),
(4,2,3,2),
(5,2,4,2),
(7,3,2,3),
(8,4,4,3),
(9,4,5,4),
(12,5,4,4),
(13,7,1,1),
(14,7,4,7),
(15,7,5,7),
(16,5,3,7),
(17,5,5,7);

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `cla_id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_name` varchar(22) DEFAULT NULL,
  `maj_id` int(11) DEFAULT NULL,
  `cla_tec` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`cla_id`),
  UNIQUE KEY `uni_name` (`cla_name`),
  KEY `fk_cla_maj` (`maj_id`),
  CONSTRAINT `fk_cla_maj` FOREIGN KEY (`maj_id`) REFERENCES `major` (`maj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`cla_id`,`cla_name`,`maj_id`,`cla_tec`) values 
(1,'12网编1班',1,'李红'),
(2,'12ERP1班',2,'陈鑫'),
(3,'12UI1班',3,'王伟'),
(4,'12智能楼宇1班',4,'钟宁涛'),
(5,'12网络1班',5,'陶月敏'),
(7,'12游软1班',6,'刘海');

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `maj_id` int(11) NOT NULL AUTO_INCREMENT,
  `maj_name` varchar(22) DEFAULT NULL,
  `maj_prin` varchar(22) DEFAULT NULL,
  `maj_link` varchar(22) DEFAULT NULL,
  `maj_phone` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`maj_id`),
  UNIQUE KEY `uni_name` (`maj_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `major` */

insert  into `major`(`maj_id`,`maj_name`,`maj_prin`,`maj_link`,`maj_phone`) values 
(1,'软件','李红','李红','123456'),
(2,'信管','刘海','刘海','1234567'),
(3,'游美','钱五','钱五','1234567'),
(4,'蓝盾','陶月敏','陶月敏','1234567'),
(5,'网络','陈鑫','陈鑫','1234567'),
(6,'游软','王伟','王伟','1234567');

/*Table structure for table `operator` */

DROP TABLE IF EXISTS `operator`;

CREATE TABLE `operator` (
  `ope_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_name` varchar(22) DEFAULT NULL,
  `ope_pwd` varchar(22) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ope_id`),
  UNIQUE KEY `uni_name` (`ope_name`),
  KEY `fk_ope_rol` (`rol_id`),
  CONSTRAINT `fk_ope_rol` FOREIGN KEY (`rol_id`) REFERENCES `role` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `operator` */

insert  into `operator`(`ope_id`,`ope_name`,`ope_pwd`,`rol_id`) values 
(1,'admin','admin',1),
(2,'tec1','tec1',2),
(3,'tec2','tec2',2),
(4,'tec3','tec3',2),
(5,'tec4','tec4',2),
(6,'tec5','tec5',2),
(7,'tec6','tec6',2),
(8,'stu01','stu01',3),
(9,'stu02','stu02',3),
(10,'stu03','stu03',3),
(11,'stu04','stu04',3),
(12,'stu05','stu05',3),
(13,'stu06','stu06',3),
(14,'stu07','stu07',3),
(36,'stu08','stu08',3),
(37,'tec7','tec7',2),
(38,'stu09','stu09',3),
(39,'stu10','stu10',3),
(40,'田静','田静',2);

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(22) DEFAULT NULL,
  `pri_url` varchar(55) DEFAULT NULL,
  `menu_name` varchar(22) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`pri_id`,`pri_name`,`pri_url`,`menu_name`,`rol_id`) values 
(1,'我的资料','/Student/InfoStudentServlet','学生管理',3),
(2,'查询成绩','/Student/pages/search_score.jsp','成绩管理',3),
(3,'查询课程','/Student/pages/search_subject.jsp','课程管理',3),
(4,'同班同学','/Student/SearchClassmatesServlet','班级管理',3),
(5,'我的资料','/Student/InfoTeacherServlet','教师管理',2),
(6,'查找学生','/Student/pages/search_student.jsp','学生管理',2),
(7,'学生成绩','/Student/pages/search_score.jsp','成绩管理',2),
(8,'我的班级','/Student/SearchTeacherClassServlet','班级管理',2),
(9,'我的课程','/Student/pages/search_subject.jsp','课程管理',2),
(10,'添加学生','/Student/PlanAddStudentServlet','学生管理',1),
(11,'查询学生','/Student/pages/search_student.jsp','学生管理',1),
(12,'添加班级','/Student/PlanAddClassesServlet','班级管理',1),
(13,'查询班级','/Student/pages/search_classes.jsp','班级管理',1),
(14,'添加班级课程','/Student/PlanAddCla2SubSevlet','班级管理',1),
(15,'查询班级课程','/Student/pages/search_classes_subject.jsp','班级管理',1),
(16,'添加教师','/Student/pages/add_teacher.jsp','教师管理',1),
(17,'查询教师','/Student/pages/search_teacher.jsp','教师管理',1),
(18,'查询成绩','/Student/pages/search_score.jsp','成绩管理',1),
(19,'添加课程','/Student/pages/add_subject.jsp','课程管理',1),
(20,'查询课程','/Student/pages/search_subject.jsp','课程管理',1),
(21,'添加专业','/Student/pages/add_major.jsp','专业管理',1),
(22,'查询专业','/Student/pages/search_major.jsp','专业管理',1),
(23,'班级课程表','/Student/pages/export_classes_subject.jsp','班级管理',1),
(24,'班级课程表','/Student/pages/export_classes_subject.jsp','班级管理',2),
(25,'班级课程表','/Student/pages/export_classes_subject.jsp','班级管理',3),
(26,'导出班级成绩','/Student/ReportScoreServlet','班级管理',2),
(27,'成绩统计图','/Student/pages/search_score_part_count.jsp','成绩管理',1),
(28,'成绩统计图','/Student/pages/search_score_part_count.jsp','成绩管理',2),
(29,'成绩分布图','/Student/pages/search_score_part_dist.jsp','成绩管理',1),
(30,'成绩分布图','/Student/pages/search_score_part_dist.jsp','成绩管理',2),
(31,'添加教评','/Student/PlanAddTeacherEvaluateServlet','学生管理',3),
(32,'查询教评','/Student/pages/search_teacher_evaluate.jsp','学生管理',2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `uni_name` (`rol_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`rol_id`,`rol_name`) values 
(3,'学生'),
(2,'教师'),
(1,'管理员');

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `sco_id` int(11) NOT NULL AUTO_INCREMENT,
  `sco_daily` float DEFAULT '0',
  `sco_exam` float DEFAULT '0',
  `sco_count` float DEFAULT '0',
  `stu_id` int(11) DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL,
  `cla2sub_id` int(11) NOT NULL,
  `cla_id` int(11) NOT NULL,
  PRIMARY KEY (`sco_id`),
  UNIQUE KEY `uni_stu_sub` (`stu_id`,`sub_id`,`cla2sub_id`),
  KEY `fk_sco_sub` (`sub_id`),
  KEY `fk_sco_stu` (`stu_id`),
  KEY `fk_sco_cla` (`cla2sub_id`),
  KEY `cla_id` (`cla_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_3` FOREIGN KEY (`cla2sub_id`) REFERENCES `cla2sub` (`cla2sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_4` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`sco_id`,`sco_daily`,`sco_exam`,`sco_count`,`stu_id`,`sub_id`,`cla2sub_id`,`cla_id`) values 
(1,66,30,96,1,1,1,1),
(2,20,72,92,1,2,2,1),
(3,33,64,97,2,1,1,1),
(4,28,62,90,2,2,2,1),
(5,18,61,79,3,1,3,2),
(6,31,66,97,3,3,4,2),
(7,28,60,88,3,4,5,2),
(8,33,56,89,4,1,3,2),
(9,21,45,66,4,3,4,2),
(10,25,65,90,4,4,5,2),
(12,0,0,0,5,2,7,3),
(14,30,66,96,6,2,7,3),
(15,0,0,0,7,4,8,4),
(16,0,0,0,7,5,9,4),
(25,0,0,0,8,4,8,4),
(26,0,0,0,8,5,9,4),
(27,0,0,0,9,3,16,5),
(28,0,0,0,10,3,16,5),
(29,0,0,0,9,5,17,5),
(30,0,0,0,10,5,17,5);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_id` int(11) DEFAULT NULL,
  `stu_no` varchar(22) DEFAULT NULL,
  `stu_name` varchar(22) DEFAULT NULL,
  `stu_sex` enum('男','女') DEFAULT '男',
  `stu_birth` date DEFAULT NULL,
  `stu_pic` varchar(22) DEFAULT NULL,
  `cla_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  UNIQUE KEY `uni_no` (`stu_no`),
  UNIQUE KEY `uni_ope` (`ope_id`),
  KEY `fk_stu_cla` (`cla_id`),
  KEY `fk_stu_ope` (`ope_id`),
  CONSTRAINT `fk_stu_cla` FOREIGN KEY (`cla_id`) REFERENCES `classes` (`cla_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stu_ope` FOREIGN KEY (`ope_id`) REFERENCES `operator` (`ope_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`stu_id`,`ope_id`,`stu_no`,`stu_name`,`stu_sex`,`stu_birth`,`stu_pic`,`cla_id`) values 
(1,8,'01','陈美丽','女','2013-02-26','../images/person.png',1),
(2,9,'02','王伟强','男','2013-11-23','../images/person.png',1),
(3,10,'03','蔡佳金','女','2013-11-19','../images/person.png',2),
(4,11,'04','何凤','男','2013-11-05','../images/person.png',2),
(5,12,'05','李言春','女','2013-11-19','../images/person.png',3),
(6,13,'06','董明','男','2013-11-03','../images/person.png',3),
(7,14,'07','吴小娟','女','2013-11-03','../images/person.png',4),
(8,36,'08','周建国','男','2013-09-06','../images/person.png',4),
(9,38,'09','魏坤','女','2013-11-19','../images/person.png',5),
(10,39,'10','管华山','男','2013-11-21','../images/person.png',5);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(22) DEFAULT NULL,
  `sub_type` varchar(22) DEFAULT NULL,
  `sub_times` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `uni_name` (`sub_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`sub_id`,`sub_name`,`sub_type`,`sub_times`) values 
(1,'J2SE','必修',108),
(2,'C语言','必修',108),
(3,'PhotoShop','选修',56),
(4,'DIV+CSS','必修',96),
(5,'矢量图','选修',56);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tec_id` int(11) NOT NULL AUTO_INCREMENT,
  `ope_id` int(11) DEFAULT NULL,
  `tec_name` varchar(22) DEFAULT NULL,
  `tec_birth` date DEFAULT NULL,
  `tec_sex` enum('男','女') DEFAULT '男',
  `tec_major` varchar(22) DEFAULT NULL,
  `tec_phone` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`tec_id`),
  UNIQUE KEY `uni_ope` (`ope_id`),
  UNIQUE KEY `fk_tec_ope` (`ope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tec_id`,`ope_id`,`tec_name`,`tec_birth`,`tec_sex`,`tec_major`,`tec_phone`) values 
(1,2,'李红','1988-04-14','女','J2SE','1234567'),
(2,3,'陈鑫','1990-07-21','女','C语言','1234567'),
(3,4,'王伟','2013-10-07','男','DIV+CSS','1234567'),
(4,5,'钟宁涛','2013-10-24','女','PhotoShop','1234567'),
(5,6,'陶月敏','1990-08-06','男','矢量图','1234567'),
(6,7,'刘海','2013-11-19','女','J2SE','1234567'),
(7,37,'钱五','1987-11-11','男','PhotoShop','1234567'),
(8,40,'田静','2013-10-29','女','PHP','1234576');

/*Table structure for table `teacher_evaluate` */

DROP TABLE IF EXISTS `teacher_evaluate`;

CREATE TABLE `teacher_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tec_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `evaluate` text,
  `score1` int(10) DEFAULT NULL,
  `score2` int(10) DEFAULT NULL,
  `score3` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `teacher_evaluate` */

insert  into `teacher_evaluate`(`id`,`tec_id`,`stu_id`,`evaluate`,`score1`,`score2`,`score3`) values 
(3,1,3,'123123',13,11,33),
(5,2,1,'1',1,1,1),
(7,1,7,'课堂上，为学生营造了一个民主、平等的课堂氛围，让人感到亲切、自然。应该说，这是一节重过程、重发现、重生活、重主体的具有探究精神和启发教育的课，让人耳目一新，感触颇多。结合评价，“互助互动”，评价时，同伴之间进行借鉴学习，有利于培养他们宽容的合作精神和敏锐的审美鉴赏力。我们不仅要将学生视为教育的主体，更应切实地将他们看作教育过程的平等参与者、合作者。教，关键在于“授之以渔”，教师给予学生的不应是“鱼”，而应该是捉鱼的方法。\r\n',10,20,30),
(8,1,3,'1',1,1,1),
(9,1,1,'1',1,1,1),
(10,1,2,'1',1,1,1),
(11,1,3,'1',1,1,1),
(12,1,3,'1',1,1,1),
(13,3,1,'1',1,1,1),
(14,2,1,'1',1,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
