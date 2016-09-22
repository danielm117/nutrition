-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nutricionApp
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Ingeniero de conocimiento');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,13),(5,1,14),(6,1,15),(7,1,16),(8,1,17),(9,1,18),(10,1,22),(11,1,23),(12,1,24),(13,1,25),(14,1,26),(15,1,27),(16,1,28),(17,1,29),(18,1,30),(19,1,34),(20,1,35),(21,1,36),(22,1,37),(23,1,38),(24,1,39),(25,1,43),(26,1,44),(27,1,45),(28,1,46),(29,1,47),(30,1,48),(31,1,49),(32,1,50),(33,1,51),(34,1,58),(35,1,59),(36,1,60),(37,1,61),(38,1,62),(39,1,63),(40,1,64),(41,1,65),(42,1,66),(43,1,67),(44,1,68),(45,1,69),(46,1,70),(47,1,71),(48,1,72),(49,1,73),(50,1,74),(51,1,75),(52,1,76),(53,1,77),(54,1,78);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add alimento',8,'add_alimento'),(23,'Can change alimento',8,'change_alimento'),(24,'Can delete alimento',8,'delete_alimento'),(25,'Can add nutriente',9,'add_nutriente'),(26,'Can change nutriente',9,'change_nutriente'),(27,'Can delete nutriente',9,'delete_nutriente'),(28,'Can add etiqueta',10,'add_etiqueta'),(29,'Can change etiqueta',10,'change_etiqueta'),(30,'Can delete etiqueta',10,'delete_etiqueta'),(34,'Can add regla',12,'add_regla'),(35,'Can change regla',12,'change_regla'),(36,'Can delete regla',12,'delete_regla'),(37,'Can add gramosporporcion',13,'add_gramosporporcion'),(38,'Can change gramosporporcion',13,'change_gramosporporcion'),(39,'Can delete gramosporporcion',13,'delete_gramosporporcion'),(43,'Can add cantidad_ nutriente_ alimento',15,'add_cantidad_nutriente_alimento'),(44,'Can change cantidad_ nutriente_ alimento',15,'change_cantidad_nutriente_alimento'),(45,'Can delete cantidad_ nutriente_ alimento',15,'delete_cantidad_nutriente_alimento'),(46,'Can add nutriente_ etiqueta',16,'add_nutriente_etiqueta'),(47,'Can change nutriente_ etiqueta',16,'change_nutriente_etiqueta'),(48,'Can delete nutriente_ etiqueta',16,'delete_nutriente_etiqueta'),(49,'Can add funcion_ lineal',17,'add_funcion_lineal'),(50,'Can change funcion_ lineal',17,'change_funcion_lineal'),(51,'Can delete funcion_ lineal',17,'delete_funcion_lineal'),(58,'Can add precendente_ regla',20,'add_precendente_regla'),(59,'Can change precendente_ regla',20,'change_precendente_regla'),(60,'Can delete precendente_ regla',20,'delete_precendente_regla'),(61,'Can add paciente',21,'add_paciente'),(62,'Can change paciente',21,'change_paciente'),(63,'Can delete paciente',21,'delete_paciente'),(64,'Can add paciente_ alimento_ porcion',22,'add_paciente_alimento_porcion'),(65,'Can change paciente_ alimento_ porcion',22,'change_paciente_alimento_porcion'),(66,'Can delete paciente_ alimento_ porcion',22,'delete_paciente_alimento_porcion'),(67,'Can add medico',23,'add_medico'),(68,'Can change medico',23,'change_medico'),(69,'Can delete medico',23,'delete_medico'),(70,'Can add medico_ paciente',24,'add_medico_paciente'),(71,'Can change medico_ paciente',24,'change_medico_paciente'),(72,'Can delete medico_ paciente',24,'delete_medico_paciente'),(73,'Can add recomendacion',25,'add_recomendacion'),(74,'Can change recomendacion',25,'change_recomendacion'),(75,'Can delete recomendacion',25,'delete_recomendacion'),(76,'Can add ingeniero',26,'add_ingeniero'),(77,'Can change ingeniero',26,'change_ingeniero'),(78,'Can delete ingeniero',26,'delete_ingeniero');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$jirdEmlhPmLX$G1+4Dr08N600PJk1n3heOyRFsIhizYifDc85tpWASYA=','2016-09-16 23:25:01',1,'admin','','','dadaoros@gmail.com',1,1,'2016-07-07 01:00:46'),(2,'pbkdf2_sha256$20000$ymt4yTPLSaXv$m98Qyup66xdlC1OGuR4jevx5RMFnJd5tAeY1mIYI7YE=','2016-09-08 22:57:37',0,'adminstrador','Administrador','NutricionApp','dmartinez@datacrm.com',1,1,'2016-09-08 01:07:13'),(3,'pbkdf2_sha256$20000$b5Jgq9oo7gm0$iLPSJH5TEr4OevB3N2mxxMVMoiXlefQJ34PWQ4BWYag=','2016-09-08 01:43:56',0,'prueba','','','',0,1,'2016-09-08 01:10:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (7,2,10),(8,2,11),(9,2,12);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-07 01:01:47','1','Muy Bajo',1,'',10,1),(2,'2016-07-07 01:01:51','2','Bajo',1,'',10,1),(3,'2016-07-07 01:01:58','3','Recomendado',1,'',10,1),(4,'2016-07-07 01:02:06','4','Muy Alto',1,'',10,1),(5,'2016-07-07 01:02:12','5','Excesivo',1,'',10,1),(6,'2016-07-07 01:02:33','1','Calcio',1,'',9,1),(7,'2016-07-07 01:02:41','2','Sodio',1,'',9,1),(8,'2016-07-07 01:02:49','3','Potasio',1,'',9,1),(9,'2016-07-07 01:03:03','1','Calcio Bajo',1,'',16,1),(10,'2016-07-07 01:26:42','4','Colesterol',1,'',9,1),(11,'2016-07-07 01:26:58','2','Colesterol Recomendado',1,'',16,1),(12,'2016-07-07 01:27:49','3','Colesterol Muy Alto',1,'',16,1),(13,'2016-07-07 01:28:37','1','Colesterol Recomendable',1,'',17,1),(14,'2016-07-07 01:30:18','2','Colesterol Recomendable',1,'',17,1),(15,'2016-07-07 01:34:19','3','Colesterol Muy Alto',1,'',17,1),(16,'2016-07-07 01:34:44','4','Colesterol Muy Alto',1,'',17,1),(17,'2016-07-07 01:34:51','3','Colesterol Muy Alto',2,'No fields changed.',17,1),(18,'2016-07-10 16:47:27','4','Exces',2,'Changed nombre.',10,1),(19,'2016-07-10 16:47:43','5','Alto',2,'Changed nombre.',10,1),(20,'2016-07-10 16:47:57','4','Alto1',2,'Changed nombre.',10,1),(21,'2016-07-10 16:48:09','5','Excesivo',2,'Changed nombre.',10,1),(22,'2016-07-10 16:48:18','4','Alto',2,'Changed nombre.',10,1),(23,'2016-07-10 16:49:27','3','Colesterol Excesivo',2,'Changed etiqueta.',16,1),(24,'2016-07-10 16:53:31','4','Calcio Muy Bajo',1,'',16,1),(25,'2016-07-10 16:53:42','5','Calcio Excesivo',1,'',16,1),(26,'2016-07-10 16:53:52','6','Calcio Alto',1,'',16,1),(27,'2016-07-10 16:54:04','7','Calcio Recomendable',1,'',16,1),(28,'2016-07-10 16:54:15','8','Calcio Alto',1,'',16,1),(29,'2016-07-10 16:54:35','8','Calcio Alto',3,'',16,1),(30,'2016-07-11 00:01:54','3','Colesterol Excesivo',2,'No fields changed.',17,1),(31,'2016-07-11 00:02:04','4','Colesterol Excesivo',2,'No fields changed.',17,1),(32,'2016-07-19 18:15:49','1','Calcio',2,'Changed kcalxgramo.',9,1),(34,'2016-07-20 00:17:48','1','Regla 1',1,'',12,1),(35,'2016-07-20 00:18:25','1','1',1,'',20,1),(36,'2016-07-20 00:18:33','2','1',1,'',20,1),(37,'2016-08-03 01:38:42','1','Alimento object',1,'',8,1),(38,'2016-08-03 01:39:10','2','Alimento object',1,'',8,1),(39,'2016-08-03 01:43:43','1','Grande',1,'',13,1),(40,'2016-08-03 01:43:59','2','Mediana',1,'',13,1),(41,'2016-08-03 01:44:17','3','prueba leche 1',1,'',13,1),(42,'2016-08-03 01:44:31','4','prueba leche 2',1,'',13,1),(43,'2016-08-08 17:14:16','1','Leche de Soya',2,'Changed tags.',8,1),(44,'2016-08-08 17:56:38','2','Manzana con piel',2,'Changed tags.',8,1),(45,'2016-08-09 00:20:28','1','Cantidad_Nutriente_Alimento object',1,'',15,1),(46,'2016-08-09 01:25:25','1','Leche de Soya Calcio',2,'No fields changed.',15,1),(47,'2016-08-10 00:58:28','1','david@empresa.com',1,'',23,1),(48,'2016-08-10 01:01:05','1','dadaoros@gmail.com',1,'',21,1),(51,'2016-08-12 01:52:35','2','Regla 2',1,'',12,1),(52,'2016-08-12 01:57:11','8','Precendente_Regla object',1,'',20,1),(53,'2016-08-12 01:58:56','9','Regla 2',1,'',20,1),(54,'2016-08-12 01:59:56','10','Regla 2 Colesterol Recomendable',1,'',20,1),(55,'2016-08-12 23:10:41','2','carly@correo.com',1,'',23,1),(56,'2016-08-12 23:17:23','2','casas Carlos Rodriguez',1,'',24,1),(57,'2016-08-18 00:18:31','3','Regla 1',1,'',12,1),(58,'2016-08-18 00:23:43','16','Regla 1 Calcio Bajo',1,'',20,1),(59,'2016-08-18 23:37:41','9','asdasd',1,'',12,1),(60,'2016-08-18 23:55:32','10','asdasd',1,'',12,1),(61,'2016-09-08 01:07:13','2','adminstrador',1,'',4,1),(62,'2016-09-08 01:08:19','2','adminstrador',2,'Changed first_name, last_name, email and user_permissions.',4,1),(63,'2016-09-08 01:09:40','2','adminstrador',2,'Changed is_staff.',4,1),(64,'2016-09-08 01:10:24','3','prueba',1,'',4,2),(65,'2016-09-08 01:37:56','1','Ingeniero de conocimiento',1,'',3,1),(66,'2016-09-08 01:39:43','3','prueba',2,'Changed groups.',4,1),(67,'2016-09-08 01:40:02','2','adminstrador',2,'No fields changed.',4,1),(68,'2016-09-14 00:32:05','4','Proteina Proteina',1,'',15,1),(69,'2016-09-14 00:34:29','5','Proteina Calcio',1,'',15,1),(70,'2016-09-14 00:34:40','5','Proteina Calcio',2,'Changed cantidad_gr.',15,1),(71,'2016-09-14 00:35:06','6','Proteina Sodio',1,'',15,1),(72,'2016-09-14 00:35:17','7','Proteina Colesterol',1,'',15,1),(73,'2016-09-14 00:35:26','8','Proteina Potasio',1,'',15,1),(74,'2016-09-14 00:36:06','9','Proteina Magnesio',1,'',15,1),(75,'2016-09-14 00:36:14','10','Proteina Fibra',1,'',15,1),(76,'2016-09-14 00:36:24','11','Proteina Carbohidratos',1,'',15,1),(77,'2016-09-14 00:36:34','12','Proteina Grasa',1,'',15,1),(78,'2016-09-14 00:36:45','13','Proteina GrasaSaturada',1,'',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'nutricionApp','alimento'),(15,'nutricionApp','cantidad_nutriente_alimento'),(10,'nutricionApp','etiqueta'),(17,'nutricionApp','funcion_lineal'),(13,'nutricionApp','gramosporporcion'),(26,'nutricionApp','ingeniero'),(23,'nutricionApp','medico'),(24,'nutricionApp','medico_paciente'),(9,'nutricionApp','nutriente'),(16,'nutricionApp','nutriente_etiqueta'),(21,'nutricionApp','paciente'),(22,'nutricionApp','paciente_alimento_porcion'),(20,'nutricionApp','precendente_regla'),(25,'nutricionApp','recomendacion'),(12,'nutricionApp','regla'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-07 00:54:15'),(2,'auth','0001_initial','2016-07-07 00:54:18'),(3,'admin','0001_initial','2016-07-07 00:54:19'),(4,'contenttypes','0002_remove_content_type_name','2016-07-07 00:54:20'),(5,'auth','0002_alter_permission_name_max_length','2016-07-07 00:54:20'),(6,'auth','0003_alter_user_email_max_length','2016-07-07 00:54:20'),(7,'auth','0004_alter_user_username_opts','2016-07-07 00:54:21'),(8,'auth','0005_alter_user_last_login_null','2016-07-07 00:54:21'),(9,'auth','0006_require_contenttypes_0002','2016-07-07 00:54:21'),(10,'nutricionApp','0001_initial','2016-07-07 00:54:29'),(11,'sessions','0001_initial','2016-07-07 00:54:29'),(12,'nutricionApp','0002_auto_20160715_2349','2016-07-15 23:52:55'),(13,'nutricionApp','0003_auto_20160720_0004','2016-07-20 00:04:22'),(14,'nutricionApp','0002_paciente_fecha_nacimiento','2016-08-10 00:42:10'),(15,'nutricionApp','0003_remove_paciente_password','2016-08-10 00:43:18'),(16,'nutricionApp','0004_paciente_password','2016-08-10 00:43:32'),(17,'nutricionApp','0005_remove_regla_recomendacion','2016-08-19 00:05:04'),(18,'nutricionApp','0006_regla_recomendacion','2016-08-19 00:08:40'),(19,'nutricionApp','0002_delete_recomendacion','2016-08-22 02:44:35'),(20,'nutricionApp','0007_remove_medico_empresa','2016-09-08 01:13:50'),(21,'nutricionApp','0008_ingeniero','2016-09-08 01:15:23'),(22,'nutricionApp','0009_auto_20160915_0108','2016-09-15 01:08:32');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1cdfco8hh4s8sbiq19yi4yl1i93hgbay','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-04 22:53:20'),('6boc8e5aro3hp4x0n2zzws38b0iznd0e','NjliMjBjNzFhMmQ5ZjgwMTFlYTBhN2UzYjVhMzEwNjhkYzE4M2ZhMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIyOGIwMDYwNThiODcxNzNmMTkyNDc0M2IxZmJmYWRkOGExMmYwODJkIn0=','2016-09-22 01:27:34'),('6olis1u94c8u9i47u2mozjxi3zvlwtcv','NjliMjBjNzFhMmQ5ZjgwMTFlYTBhN2UzYjVhMzEwNjhkYzE4M2ZhMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIyOGIwMDYwNThiODcxNzNmMTkyNDc0M2IxZmJmYWRkOGExMmYwODJkIn0=','2016-09-22 01:43:57'),('8kitsmvguuo1lnv4frcbxul192b2z305','YTYxM2M1MzdmZTRjYTlmMjZkY2JjZTliN2E3YTNmOTZmMjM1OGFlMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-28 00:29:15'),('9kmuvq085ou20ejsjxkegtoc8qic47up','YzYwYTc4ZDU0NzQ4MTYxYWY4NmI1ZmYxMGQwZDE2MWRhN2QxMTg2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNmMGI2MTYwNjdhZGNjMGRkNGE0OTY2YzczZTIxY2Q1N2VjMDc1YyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-09-22 22:57:37'),('axjwn3bhtjmcv76n0i5fotvp0nj64ati','YTYxM2M1MzdmZTRjYTlmMjZkY2JjZTliN2E3YTNmOTZmMjM1OGFlMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-30 23:25:01'),('blea6okucpp1vwmd4jtatvhxdpqx73qe','ODNlOWQwMWVjMzY1NmY5ZDZhZmQ1ZWNhMzkxNjE1MjQ3N2RlYWNiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4YjAwNjA1OGI4NzE3M2YxOTI0NzQzYjFmYmZhZGQ4YTEyZjA4MmQiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-22 01:25:35'),('c5pz9vefy18puzn06w7scb6rszeup9ud','NTViYzdmOGM4NWVlYWI5YWQ0MTdiODQ1ZjUyYWU4Y2I0ZDNhYTI0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-24 00:58:05'),('j4023h16h39upfpxqtek92xr2xulsyw6','ODNlOWQwMWVjMzY1NmY5ZDZhZmQ1ZWNhMzkxNjE1MjQ3N2RlYWNiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4YjAwNjA1OGI4NzE3M2YxOTI0NzQzYjFmYmZhZGQ4YTEyZjA4MmQiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-22 01:28:36'),('lqryt7kgijbpop8aiyn63cdg1558rjf6','YzYwYTc4ZDU0NzQ4MTYxYWY4NmI1ZmYxMGQwZDE2MWRhN2QxMTg2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNmMGI2MTYwNjdhZGNjMGRkNGE0OTY2YzczZTIxY2Q1N2VjMDc1YyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-09-22 22:57:14'),('mp04nipdf1u1ltlpi896gcqp16mi01va','ZGU2ZTk2Y2Q3OGZhNjExZWNkZmRlMGViZTFlMTlhZTM0NDcyYmFmZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhM2YwYjYxNjA2N2FkY2MwZGQ0YTQ5NjZjNzNlMjFjZDU3ZWMwNzVjIn0=','2016-09-22 01:09:45'),('mprlhcf6goizw1c5zcbju50iijsq4qa9','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-21 01:01:02'),('pjxdmc74l6z7yx5chmbwinse5np596df','N2YxZWE0MjZhNzJiOTljN2EwOTQ1Y2Q1ZGRjNmQxZjNlZGRkZTE0ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhM2YwYjYxNjA2N2FkY2MwZGQ0YTQ5NjZjNzNlMjFjZDU3ZWMwNzVjIn0=','2016-09-22 01:35:32'),('s0nttsu443uo3vas7yw7fxc0ve22wsom','YzYwYTc4ZDU0NzQ4MTYxYWY4NmI1ZmYxMGQwZDE2MWRhN2QxMTg2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNmMGI2MTYwNjdhZGNjMGRkNGE0OTY2YzczZTIxY2Q1N2VjMDc1YyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-09-22 22:51:25'),('s3238jg9nuuqlhjexmxg4gx9wq8ngkho','NTViYzdmOGM4NWVlYWI5YWQ0MTdiODQ1ZjUyYWU4Y2I0ZDNhYTI0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-01 00:18:17'),('vc0ywtxao9c53no19p2vd61rpzrm7p65','NDc3YTY2OGY5NDU3NGJiMzMyNjNlNGNjYzJjODI1YWJkMWEyMzJmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZWM1OWU2YTI1NDQyYjAyZDUwNzk2NDJiZWUwYjA4NzViNjZkN2EyIn0=','2016-09-28 23:07:48'),('y51phnlgssnhdwxqjhr1ty8zbhovkygn','MzVhN2I5YWMzNzhiZjhhMWU1ODBhZTI2OWRkMzJmNmZlYzgwMGFjYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-08-17 01:36:06'),('y5sjh5uwmfz253l9iq3s8nm8dvouk23z','N2QwY2U1NDcxMTY4NTdiZmIwMDFlMWYwM2VhY2MzODBkNzNlZmNiMjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjhiMDA2MDU4Yjg3MTczZjE5MjQ3NDNiMWZiZmFkZDhhMTJmMDgyZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-22 01:30:37'),('zegc09mhc3r6bq2tv06dpu4qz3njgzd6','N2RjNDA1OWEzMjUzYzVmMDdhYjk4MTczMjZhMjQ3Yzk4ZDlkNGNjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzZWM1OWU2YTI1NDQyYjAyZDUwNzk2NDJiZWUwYjA4NzViNjZkN2EyIn0=','2016-09-22 01:06:36'),('zjnwyrdhc895o42eilzbl9lywpp92ihw','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-09 23:38:48'),('ztbh2necmswhl8g5fuo4pa43rzodvh0l','YTYxM2M1MzdmZTRjYTlmMjZkY2JjZTliN2E3YTNmOTZmMjM1OGFlMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-30 22:07:28');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_alimento`
--

DROP TABLE IF EXISTS `nutricionApp_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_alimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo_fao` varchar(50) NOT NULL,
  `tags` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `codigo_fao` (`codigo_fao`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_alimento`
--

LOCK TABLES `nutricionApp_alimento` WRITE;
/*!40000 ALTER TABLE `nutricionApp_alimento` DISABLE KEYS */;
INSERT INTO `nutricionApp_alimento` VALUES (1,'Leche de Soya','1212','cena, almuerzo'),(3,'Proteina','1','nutriente'),(4,'Calcio','2','nutriente'),(6,'Carbohidratos','3','nutriente'),(7,'Grasa','4','nutriente'),(8,'Grasa Saturada','5','nutriente'),(9,'Potasio','6','nutriente'),(10,'Sodio','7','nutriente'),(11,'Magnesio','8','nutriente'),(12,'Fibra','9','nutriente'),(13,'Colesterol','10','nutriente'),(14,'Cereal de salvado','08001','desayuno'),(15,'Pan integral ','18075','desayuno'),(16,'Banano','09040','desayuno, frutas'),(17,'Yogurt sin grasa','43261','desayuno, lacteos'),(18,'Leche libre de grasa','01292','desayuno, lacteos'),(19,'Gelatina','19300','desayuno'),(20,'Mostaza Amarilla','02046','almuerzo, adiciones, salsas'),(21,'Pepino Cohombro','11205','almuerzo, vegetales'),(22,'Tomate','11527','almuerzo, vegetales'),(23,'Salsa ranch','04638','salsa, ensalada'),(24,'Coctél de frutas','09097','almuerzo, refrigerio'),(25,'Centro de cadera de vaca','13415','almuerzo, carnes'),(26,'Frijoles','11723','vegetales'),(27,'Papas al horno','11357','tuberculo'),(28,'Crema agria libre de grasa','10180','Aderezo'),(29,'Queso chedar','01009','queso, lacteos'),(30,'Cebolla larga','11291','vegetal'),(31,'Panecillos','18348','cena'),(32,'Margarina para untar','04630','Aderezo'),(33,'Manzana','09003','fruta'),(34,'Almendras','12061','refrigerio'),(35,'Uva pasa','09298','refrigerio'),(36,'Jugo de naranja','09206','desayuno'),(37,'Mogolla integral ','18968','desayuno'),(38,'Pechuga de pollo','05063','pollo, almuerzo'),(39,'Queso Americano','01061','lacteos '),(40,'Lechuga Romana','11251','Vegetales'),(41,'Salsa BBQ','45077468','salsas'),(42,'Mayonesa','42138','Aderezo'),(43,'Durazno','09236','Fruta'),(44,'Jugo de Manzana','09400','Bebida, Fruta'),(46,'Sushi','15027','Pescado'),(47,'Salsa Vegetariana para Pasta (DASH)','DASH 2','Salsa'),(50,'Pasta','20420','Almuerzo'),(51,'naranja','09200','fruta'),(52,'Queso Parmessano','01032','Lacteos, Desayuno'),(53,'Espinaca','11457','Vegetales'),(54,'Bacalao','15016','Pescado'),(55,'Zanahoria','11124','Vegetales'),(56,'Jugo de limon','09152','Jugo'),(57,'Champiñon','11260','Vegetales'),(58,'Mazorca de Maíz','11168','Cereal'),(59,'Arroz integral','20036','almuerzo, cena'),(60,'muffin','18412','cena'),(61,'Peras Enlatadas','09254','Bebida, Fruta, Jugo'),(62,'Frutos secas','45012363','refrigerio'),(63,'Melocoton Secos','09032','Refrigerio'),(64,'Galleta graham','18617','refrigerio'),(65,'jugo de uva','09135','Bebida, Fruta, Jugo'),(66,'Jamon Ahumado','07977','Refrigerio'),(68,'Mantequilla de mani','42291','refrigerio'),(69,'Trigo triturado','45031861','desayuno'),(70,'Galleta de trigo ','18235','almuerzo'),(71,'Arvejas verdes','11313','Almuerzo'),(72,'Melon','09181','Fruta'),(73,'Queso Cottage','01015','almuerzo'),(74,'Jugo de piña enlatado','09345','almuerzo'),(75,'Barra de Granola baja en grasa','19439','Refrigerio'),(76,'Apio','11143','vegetales, almuerzo'),(77,'Pechuga de Pavo','05220','Refrigerio'),(78,'Salsa de tomate','11935','salsas'),(79,'Salsa Vinagreta','45062913','Salsa'),(80,'Atun en lata','15121','Pescado'),(81,'Crouton','18243','pan');
/*!40000 ALTER TABLE `nutricionApp_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_cantidad_nutriente_alimento`
--

DROP TABLE IF EXISTS `nutricionApp_cantidad_nutriente_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_cantidad_nutriente_alimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nutriente_id` int(11) NOT NULL,
  `alimento_id` int(11) NOT NULL,
  `cantidad_gr` decimal(15,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutric_nutriente_id_12d26eaa6fa8bd4_fk_nutricionApp_nutriente_id` (`nutriente_id`),
  KEY `nutrici_alimento_id_28ae3f747af60cf0_fk_nutricionApp_alimento_id` (`alimento_id`),
  CONSTRAINT `nutrici_alimento_id_28ae3f747af60cf0_fk_nutricionApp_alimento_id` FOREIGN KEY (`alimento_id`) REFERENCES `nutricionApp_alimento` (`id`),
  CONSTRAINT `nutric_nutriente_id_12d26eaa6fa8bd4_fk_nutricionApp_nutriente_id` FOREIGN KEY (`nutriente_id`) REFERENCES `nutricionApp_nutriente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_cantidad_nutriente_alimento`
--

LOCK TABLES `nutricionApp_cantidad_nutriente_alimento` WRITE;
/*!40000 ALTER TABLE `nutricionApp_cantidad_nutriente_alimento` DISABLE KEYS */;
INSERT INTO `nutricionApp_cantidad_nutriente_alimento` VALUES (1,1,1,1.026),(2,2,1,123123.121),(4,7,3,1.000),(5,1,3,0.000),(6,2,3,0.000),(7,4,3,0.000),(8,6,3,0.000),(9,8,3,0.000),(10,9,3,0.000),(11,10,3,0.000),(12,11,3,0.000),(13,14,3,0.000),(14,1,4,100.000),(15,2,4,0.000),(16,4,4,0.000),(17,6,4,0.000),(18,7,4,0.000),(19,8,4,0.000),(20,9,4,0.000),(21,10,4,0.000),(22,11,4,0.000),(23,14,4,0.000),(24,1,6,0.000),(25,2,6,0.000),(26,4,6,0.000),(27,6,6,0.000),(28,7,6,0.000),(29,8,6,0.000),(30,9,6,0.000),(31,10,6,1.000),(32,11,6,0.000),(33,14,6,0.000),(34,1,7,0.000),(35,2,7,0.000),(36,4,7,0.000),(37,6,7,0.000),(38,7,7,0.000),(39,8,7,0.000),(40,9,7,0.000),(41,10,7,0.000),(42,11,7,1.000),(43,1,8,0.000),(44,2,8,0.000),(45,4,8,0.000),(46,6,8,0.000),(47,7,8,0.000),(48,8,8,0.000),(49,9,8,0.000),(50,10,8,0.000),(51,11,8,0.000),(52,14,8,1.000),(53,1,9,0.000),(54,2,9,0.000),(55,4,9,0.000),(56,6,9,1.000),(57,7,9,0.000),(58,8,9,0.000),(59,9,9,0.000),(60,10,9,0.000),(61,11,9,0.000),(62,14,9,0.000),(63,1,10,0.000),(64,2,10,1.000),(65,4,10,0.000),(66,6,10,0.000),(67,7,10,0.000),(68,8,10,0.000),(69,9,10,0.000),(70,10,10,0.000),(71,11,10,0.000),(72,14,10,0.000),(73,1,11,0.000),(74,2,11,0.000),(75,4,11,0.000),(76,6,11,0.000),(77,7,11,0.000),(78,8,11,1.000),(79,9,11,0.000),(80,10,11,0.000),(81,11,11,0.000),(82,14,11,0.000),(83,1,12,0.000),(84,2,12,0.000),(85,4,12,0.000),(86,6,12,0.000),(87,7,12,0.000),(88,8,12,0.000),(89,9,12,1.000),(90,10,12,0.000),(91,11,12,0.000),(92,14,12,0.000),(93,1,13,0.000),(94,2,13,0.000),(95,4,13,1.000),(96,6,13,0.000),(97,7,13,0.000),(98,8,13,0.000),(99,9,13,0.000),(100,10,13,0.000),(101,11,13,0.000),(102,14,13,0.000),(104,1,14,0.389),(105,2,14,0.258),(106,4,14,0.000),(107,6,14,1.020),(108,7,14,13.140),(109,8,14,0.362),(110,9,14,29.300),(111,10,14,74.240),(112,11,14,4.900),(113,14,14,1.100),(114,1,15,0.161),(115,2,15,0.455),(116,4,15,0.000),(117,6,15,0.254),(118,7,15,12.450),(119,8,15,0.075),(120,9,15,6.000),(121,10,15,42.710),(122,11,15,3.500),(123,14,15,0.722),(124,1,16,0.005),(125,2,16,0.001),(126,4,16,0.000),(127,6,16,0.358),(128,7,16,1.090),(129,8,16,0.027),(130,9,16,2.600),(131,10,16,22.840),(132,11,16,0.330),(133,14,16,0.112),(134,1,17,0.152),(135,2,17,0.058),(136,4,17,0.002),(137,6,17,0.194),(138,7,17,4.400),(139,8,17,0.015),(140,9,17,0.000),(141,10,17,19.000),(142,11,17,0.200),(143,14,17,0.119),(144,1,18,0.127),(145,2,18,0.110),(146,4,18,0.002),(147,6,18,0.182),(148,7,18,3.390),(149,8,18,0.013),(150,9,18,0.000),(151,10,18,13.460),(152,11,18,0.000),(153,14,18,0.000),(154,1,19,0.007),(155,2,19,0.030),(156,4,19,0.000),(157,6,19,0.054),(158,7,19,0.150),(159,8,19,0.006),(160,9,19,1.000),(161,10,19,69.950),(162,11,19,0.020),(163,14,19,0.005),(164,1,20,0.063),(165,2,20,1.104),(166,4,20,0.000),(167,6,20,0.152),(168,7,20,3.740),(169,8,20,0.048),(170,9,20,4.000),(171,10,20,5.830),(172,11,20,3.340),(173,14,20,0.214),(174,1,21,0.016),(175,2,21,0.002),(176,4,21,0.000),(177,6,21,0.147),(178,7,21,0.650),(179,8,21,0.013),(180,9,21,0.500),(181,10,21,3.630),(182,11,21,0.110),(183,14,21,0.037),(184,1,22,0.013),(185,2,22,0.013),(186,4,22,0.000),(187,6,22,0.204),(188,7,22,1.200),(189,8,22,0.010),(190,9,22,1.100),(191,10,22,5.100),(192,11,22,0.200),(193,14,22,0.028),(194,1,23,0.050),(195,2,23,0.897),(196,4,23,0.007),(197,6,23,0.111),(198,7,23,0.250),(199,8,23,0.008),(200,9,23,0.100),(201,10,23,26.510),(202,11,23,1.920),(203,14,23,0.447),(204,1,24,0.008),(205,2,24,0.004),(206,4,24,0.000),(207,6,24,0.095),(208,7,24,0.460),(209,8,24,0.007),(210,9,24,1.000),(211,10,24,11.860),(212,11,24,0.010),(213,14,24,0.001),(214,1,25,0.016),(215,2,25,0.067),(216,4,25,0.076),(217,6,25,0.401),(218,7,25,29.660),(219,8,25,0.015),(220,9,25,0.000),(221,10,25,0.000),(222,11,25,4.460),(223,14,25,1.615),(224,1,26,0.044),(225,2,26,0.239),(226,4,26,0.000),(227,6,26,0.146),(228,7,26,1.890),(229,8,26,0.018),(230,9,26,3.200),(231,10,26,7.880),(232,11,26,0.280),(233,14,26,0.064),(234,1,27,0.010),(235,2,27,0.007),(236,4,27,0.000),(237,6,27,0.544),(238,7,27,2.100),(239,8,27,0.027),(240,9,27,2.100),(241,10,27,21.080),(242,11,27,0.150),(243,14,27,0.022),(244,1,28,0.125),(245,2,28,0.141),(246,4,28,0.009),(247,6,28,0.129),(248,7,28,3.100),(249,8,28,0.010),(250,9,28,0.000),(251,10,28,15.600),(252,11,28,0.000),(253,14,28,0.000),(254,1,29,0.710),(255,2,29,0.653),(256,4,29,0.099),(257,6,29,0.076),(258,7,29,22.870),(259,8,29,0.027),(260,9,29,0.000),(261,10,29,3.090),(262,11,29,33.310),(263,14,29,18.867),(264,1,30,0.072),(265,2,30,0.016),(266,4,30,0.000),(267,6,30,0.276),(268,7,30,1.830),(269,8,30,0.020),(270,9,30,2.600),(271,10,30,7.240),(272,11,30,0.190),(273,14,30,0.032),(274,1,31,0.106),(275,2,31,0.521),(276,4,31,0.000),(277,6,31,0.272),(278,7,31,8.700),(279,8,31,0.085),(280,9,31,7.500),(281,10,31,51.100),(282,11,31,4.700),(283,14,31,0.836),(284,1,32,0.004),(285,2,32,0.646),(286,4,32,0.001),(287,6,32,0.036),(288,7,32,0.200),(289,8,32,0.001),(290,9,32,0.000),(291,10,32,0.860),(292,11,32,47.530),(293,14,32,8.792),(294,1,33,0.006),(295,2,33,0.001),(296,4,33,0.000),(297,6,33,0.107),(298,7,33,0.260),(299,8,33,0.005),(300,9,33,2.400),(301,10,33,13.810),(302,11,33,0.170),(303,14,33,0.028),(304,1,34,0.269),(305,2,34,0.001),(306,4,34,0.000),(307,6,34,0.733),(308,7,34,21.150),(309,8,34,0.270),(310,9,34,12.500),(311,10,34,21.550),(312,11,34,49.930),(313,14,34,3.802),(314,1,35,0.050),(315,2,35,0.011),(316,4,35,0.000),(317,6,35,0.749),(318,7,35,3.070),(319,8,35,0.032),(320,9,35,3.700),(321,10,35,79.180),(322,11,35,0.460),(323,14,35,0.058),(324,1,36,0.110),(325,2,36,0.001),(326,4,36,0.000),(327,6,36,0.200),(328,7,36,0.700),(329,8,36,0.011),(330,9,36,0.200),(331,10,36,10.400),(332,11,36,0.200),(333,14,36,0.024),(334,1,37,0.020),(335,2,37,0.439),(336,4,37,0.000),(337,6,37,0.165),(338,7,37,10.200),(339,8,37,0.051),(340,9,37,4.100),(341,10,37,48.890),(342,11,37,1.530),(343,14,37,0.000),(344,1,38,0.016),(345,2,38,0.079),(346,4,38,0.091),(347,6,38,0.276),(348,7,38,33.440),(349,8,38,0.031),(350,9,38,0.000),(351,10,38,0.510),(352,11,38,4.710),(353,14,38,1.290),(354,1,39,0.789),(355,2,39,1.316),(356,4,39,0.026),(357,6,39,0.393),(358,7,39,21.050),(359,8,39,0.115),(360,9,39,0.000),(361,10,39,10.530),(362,11,39,0.000),(363,14,39,0.000),(364,1,40,0.033),(365,2,40,0.008),(366,4,40,0.000),(367,6,40,0.243),(368,7,40,1.230),(369,8,40,0.014),(370,9,40,2.100),(371,10,40,3.290),(372,11,40,0.300),(373,14,40,0.039),(374,1,41,0.000),(375,2,41,0.848),(376,4,41,0.000),(377,1,42,0.000),(378,2,42,0.733),(379,4,42,0.000),(380,6,42,0.067),(381,7,42,0.900),(382,8,42,0.000),(383,9,42,0.000),(384,6,41,0.232),(385,7,41,0.000),(386,10,42,6.700),(387,11,42,33.300),(388,8,41,0.013),(389,14,42,4.618),(390,9,41,0.000),(391,10,41,30.300),(392,11,41,0.000),(393,14,41,0.000),(394,1,43,0.060),(395,2,43,0.000),(396,4,43,0.000),(397,6,43,0.190),(398,7,43,0.910),(399,8,43,0.009),(400,9,43,1.500),(401,10,43,9.540),(402,11,43,0.250),(403,14,43,0.019),(404,1,44,0.008),(405,2,44,0.004),(406,4,44,0.000),(407,6,44,0.101),(408,7,44,0.100),(409,8,44,0.005),(410,9,44,0.200),(412,10,44,11.300),(414,11,44,0.130),(415,14,44,0.022),(419,1,46,0.016),(420,2,46,0.402),(421,4,46,0.028),(422,6,46,0.185),(423,7,46,11.010),(424,8,46,0.025),(425,9,46,1.500),(426,10,46,21.660),(427,11,46,16.230),(428,14,46,3.733),(436,1,50,0.021),(437,2,50,0.006),(438,4,50,0.000),(439,6,50,0.223),(440,7,50,13.040),(441,1,51,0.040),(442,8,50,0.053),(443,9,50,3.200),(444,2,51,0.000),(445,4,51,0.000),(446,10,50,73.670),(447,6,51,0.181),(448,11,50,1.510),(449,7,51,0.940),(450,14,50,0.277),(451,8,51,0.010),(452,9,51,2.400),(453,10,51,11.750),(454,11,51,0.120),(455,14,51,0.015),(456,1,52,0.853),(457,2,52,1.804),(458,4,52,0.086),(459,6,52,0.180),(460,7,52,28.420),(461,8,52,0.034),(462,9,52,0.000),(463,10,52,13.910),(464,11,52,27.840),(465,14,52,15.371),(466,1,54,0.014),(467,1,53,0.099),(468,2,54,0.078),(469,2,53,0.079),(470,4,53,0.000),(471,4,54,0.055),(472,6,53,0.558),(473,6,54,0.244),(474,7,53,2.860),(475,7,54,22.830),(476,8,53,0.079),(477,8,54,0.042),(478,9,54,0.000),(479,9,53,2.200),(480,10,54,0.000),(481,10,53,3.630),(482,11,54,0.860),(483,11,53,0.390),(484,14,53,0.063),(485,14,54,0.168),(486,1,55,0.033),(487,2,55,0.069),(488,4,55,0.000),(489,6,55,0.320),(490,7,55,0.930),(491,8,55,0.012),(492,9,55,2.800),(493,10,55,9.580),(494,11,55,0.240),(495,14,55,0.037),(496,1,56,0.006),(497,2,56,0.001),(498,4,56,0.000),(499,6,56,0.103),(500,7,56,0.350),(501,8,56,0.006),(502,9,56,0.300),(503,10,56,6.900),(504,11,56,0.240),(505,14,56,0.040),(506,1,57,0.003),(507,2,57,0.005),(508,4,57,0.000),(509,6,57,0.318),(510,7,57,3.090),(511,8,57,0.009),(512,9,57,1.000),(513,10,57,3.260),(514,11,57,0.340),(515,14,57,0.050),(516,1,58,0.003),(517,1,59,0.009),(518,2,58,0.001),(519,2,59,0.005),(520,4,58,0.000),(521,4,59,0.000),(522,6,58,0.218),(523,6,59,0.250),(524,7,58,3.410),(525,8,58,0.026),(526,7,59,7.540),(527,8,59,0.116),(528,9,59,3.600),(529,9,58,2.400),(530,10,59,76.250),(531,10,58,20.980),(532,11,59,3.200),(533,11,58,1.500),(534,14,59,0.591),(535,14,58,0.197),(536,1,60,0.057),(537,2,60,1.111),(538,4,60,0.002),(539,6,60,0.113),(540,7,60,7.000),(541,8,60,0.024),(542,9,60,6.500),(543,10,60,69.500),(544,11,60,12.200),(545,14,60,3.091),(546,1,61,0.009),(547,2,61,0.004),(548,4,61,0.000),(549,6,61,0.096),(550,7,61,0.340),(551,8,61,0.007),(552,9,61,1.600),(553,10,61,12.940),(554,11,61,0.070),(555,14,61,0.004),(556,1,62,0.050),(557,2,62,0.006),(558,4,62,0.000),(559,6,62,0.750),(560,7,62,2.500),(561,8,62,0.000),(562,9,62,5.000),(563,10,62,80.000),(564,1,63,0.055),(565,2,63,0.010),(566,4,63,0.000),(567,6,63,1.162),(568,11,62,0.000),(569,14,62,0.000),(570,7,63,3.390),(571,8,63,0.032),(572,9,63,7.300),(573,10,63,62.640),(574,11,63,0.510),(575,14,63,0.017),(576,1,64,0.079),(577,2,64,0.659),(578,4,64,0.000),(579,6,64,0.177),(580,7,64,6.990),(581,8,64,0.059),(582,9,64,3.400),(583,10,64,76.200),(584,11,64,10.000),(585,14,64,1.560),(586,1,65,0.011),(587,2,65,0.005),(588,4,65,0.000),(589,6,65,0.104),(590,7,65,0.370),(591,8,65,0.010),(592,9,65,0.200),(593,10,65,14.770),(594,11,65,0.130),(595,14,65,0.025),(596,1,66,0.005),(597,2,66,1.062),(598,4,66,0.050),(599,6,66,0.330),(600,7,66,18.520),(601,8,66,0.020),(602,9,66,0.000),(603,10,66,10.700),(604,11,66,2.710),(605,14,66,1.786),(614,1,68,0.035),(615,2,68,0.540),(616,4,68,0.000),(617,6,68,0.669),(618,7,68,25.900),(619,8,68,0.170),(620,9,68,5.200),(621,10,68,35.600),(622,11,68,34.000),(623,14,68,5.800),(624,2,69,0.003),(625,1,69,0.000),(626,4,69,0.000),(627,6,69,0.377),(628,7,69,9.090),(629,8,69,0.073),(630,9,69,9.100),(631,10,69,83.640),(632,11,69,1.820),(633,14,69,0.000),(634,1,70,0.036),(635,2,70,0.704),(636,4,70,0.000),(637,6,70,0.345),(638,7,70,10.580),(639,8,70,0.110),(640,9,70,10.300),(641,10,70,69.550),(642,1,71,0.024),(643,11,70,14.130),(644,2,71,0.072),(645,4,71,0.000),(646,14,70,2.063),(647,6,71,0.110),(648,7,71,5.150),(649,8,71,0.022),(650,9,71,4.500),(651,10,71,14.260),(652,11,71,0.270),(653,14,71,0.049),(654,1,73,0.111),(655,1,72,0.009),(656,2,73,0.308),(657,2,72,0.016),(658,4,73,0.012),(659,4,72,0.000),(660,6,72,0.267),(661,6,73,0.125),(662,7,72,0.840),(663,8,72,0.012),(664,7,73,10.450),(665,9,72,0.900),(666,8,73,0.009),(667,9,73,0.000),(668,10,72,8.160),(669,10,73,4.760),(670,11,72,0.190),(671,11,73,2.270),(672,14,72,0.051),(673,14,73,1.235),(674,1,74,0.016),(675,2,74,0.001),(676,4,74,0.000),(677,6,74,0.124),(678,7,74,0.510),(679,8,74,0.015),(680,9,74,1.300),(681,10,74,15.560),(682,11,74,0.110),(683,14,74,0.008),(684,1,75,0.035),(685,2,75,0.291),(686,1,76,0.040),(687,4,75,0.000),(688,6,75,0.249),(689,2,76,0.080),(690,7,75,8.000),(691,4,76,0.000),(692,8,75,8.087),(693,6,76,0.260),(694,9,75,6.200),(695,7,76,0.690),(696,10,75,78.000),(697,8,76,0.011),(698,11,75,7.400),(699,9,76,1.600),(700,14,75,1.100),(701,10,76,2.970),(702,11,76,0.170),(703,14,76,0.042),(704,1,78,0.015),(705,2,78,0.907),(706,4,78,0.000),(707,6,78,0.281),(708,7,78,1.040),(709,1,77,0.009),(710,8,78,0.013),(711,2,77,0.099),(712,9,78,0.300),(713,4,77,0.080),(714,10,78,27.400),(715,11,78,0.100),(716,6,77,0.249),(717,14,78,0.014),(718,7,77,30.130),(719,8,77,0.032),(720,9,77,0.000),(721,10,77,0.000),(722,11,77,2.080),(723,14,77,0.593),(724,1,79,0.000),(725,2,79,0.310),(726,4,79,0.000),(727,6,79,0.001),(728,7,79,0.000),(729,1,80,0.017),(730,8,79,0.001),(731,2,80,0.247),(732,9,79,0.000),(733,10,79,4.000),(734,4,80,0.036),(735,11,79,8.000),(736,14,79,1.000),(737,6,80,0.179),(738,7,80,19.440),(739,8,80,0.023),(740,9,80,0.000),(741,10,80,0.000),(742,11,80,0.960),(743,14,80,0.211),(744,1,81,0.096),(745,2,81,1.089),(746,2,81,1.089),(747,4,81,0.007),(748,6,81,0.181),(749,7,81,10.800),(750,8,81,0.042),(751,9,81,5.000),(752,10,81,63.500),(753,11,81,18.300),(754,14,81,5.247);
/*!40000 ALTER TABLE `nutricionApp_cantidad_nutriente_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_etiqueta`
--

DROP TABLE IF EXISTS `nutricionApp_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_etiqueta`
--

LOCK TABLES `nutricionApp_etiqueta` WRITE;
/*!40000 ALTER TABLE `nutricionApp_etiqueta` DISABLE KEYS */;
INSERT INTO `nutricionApp_etiqueta` VALUES (4,'Alto'),(2,'Bajo'),(5,'Excesivo'),(1,'Muy Bajo'),(3,'Recomendable');
/*!40000 ALTER TABLE `nutricionApp_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_funcion_lineal`
--

DROP TABLE IF EXISTS `nutricionApp_funcion_lineal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_funcion_lineal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m` decimal(8,4) NOT NULL,
  `b` decimal(8,4) NOT NULL,
  `x1` decimal(8,4) NOT NULL,
  `x2` decimal(8,4) NOT NULL,
  `conjunto_id` int(11) NOT NULL,
  `unidad_medida` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutricionApp_funcion_lineal_beb12286` (`conjunto_id`),
  CONSTRAINT `ecf987d2a67e3f07497267d14210acd1` FOREIGN KEY (`conjunto_id`) REFERENCES `nutricionApp_nutriente_etiqueta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_funcion_lineal`
--

LOCK TABLES `nutricionApp_funcion_lineal` WRITE;
/*!40000 ALTER TABLE `nutricionApp_funcion_lineal` DISABLE KEYS */;
INSERT INTO `nutricionApp_funcion_lineal` VALUES (1,0.0000,1.0000,0.0000,0.1500,2,'g'),(2,-6.6670,2.0000,0.1500,0.3000,2,'g'),(3,6.6670,-1.0000,0.1500,0.3000,3,'g'),(4,0.0000,1.0000,0.3000,500.0000,3,'g'),(6,0.1000,-6.5000,65.0000,75.0000,19,'%'),(7,0.0000,1.0000,75.0000,500.0000,19,'%'),(8,0.1000,-5.5000,55.0000,65.0000,20,'%'),(9,-0.1000,7.5000,65.0000,75.0000,20,'%'),(10,0.1000,-4.5000,45.0000,55.0000,21,'%'),(11,-0.1000,6.5000,55.0000,65.0000,21,'%'),(12,0.0000,1.0000,0.0000,45.0000,22,'%'),(13,-0.1000,5.5000,45.0000,55.0000,22,'%'),(14,0.0000,1.0000,0.0000,15.0000,30,'%'),(15,-0.2000,4.0000,15.0000,20.0000,30,'%'),(16,0.2000,-3.0000,15.0000,20.0000,29,'%'),(17,-0.1430,3.8570,20.0000,27.0000,29,'%'),(18,0.1400,-2.8600,20.0000,27.0000,28,'%'),(19,-0.1250,4.3750,27.0000,35.0000,28,'%'),(20,0.1250,-3.3750,27.0000,35.0000,27,'%'),(21,-0.2000,8.0000,35.0000,40.0000,27,'%'),(22,0.2000,-7.0000,35.0000,40.0000,26,'%'),(23,0.0000,1.0000,40.0000,500.0000,26,'%'),(24,-0.1667,1.0000,0.0000,6.0000,34,'%'),(25,0.1667,0.0000,0.0000,6.0000,32,'%'),(26,-0.2500,2.5000,6.0000,10.0000,32,'%'),(27,0.2500,-1.5000,6.0000,10.0000,31,'%'),(28,0.0000,1.0000,10.0000,500.0000,31,'%'),(29,-0.2849,1.0000,0.0000,3.5100,38,'g'),(31,0.2849,0.0000,0.0000,3.5100,37,'g'),(32,-1.0101,4.5454,3.5100,4.5000,37,'g'),(33,1.0101,-3.5454,3.5100,4.5000,36,'g'),(34,0.0000,1.0000,4.5000,5.5750,36,'g'),(35,-3.0769,18.1538,5.5750,5.9000,36,'g'),(36,3.0769,-17.1538,5.5750,5.9000,35,'g'),(37,0.0000,1.0000,5.9000,500.0000,35,'g'),(38,0.0000,1.0000,0.5890,500.0000,39,'g'),(39,11.2359,-5.6179,0.5000,0.5890,39,'g'),(40,-11.2359,6.6179,0.5000,0.5890,40,'g'),(41,10.0000,-4.0000,0.4000,0.5000,40,'g'),(42,-10.0000,5.0000,0.4000,0.5000,41,'g'),(43,14.2857,-4.7142,0.3300,0.4000,41,'g'),(44,-14.2857,5.7142,0.3300,0.4000,42,'g'),(45,0.0000,1.0000,0.0000,0.3300,42,'g'),(46,0.0000,1.0000,3.5000,500.0000,43,'g'),(47,0.9090,-2.1818,2.4000,3.5000,43,'g'),(48,-0.9090,3.1810,2.4000,3.5000,44,'g'),(49,1.1110,-1.6660,1.5000,2.4000,44,'g'),(50,-1.1110,2.6670,1.5000,2.4000,45,'g'),(51,1.0000,-0.5000,0.5000,1.5000,45,'g'),(52,-1.0000,1.5000,0.5000,1.5000,46,'g'),(53,0.0000,1.0000,0.0000,0.5000,46,'g'),(54,0.0000,1.0000,2.5000,500.0000,47,'g'),(55,1.4285,-2.5714,1.8000,2.5000,47,'g'),(56,-1.4285,3.5714,1.8000,2.5000,48,'g'),(57,1.8181,-2.2727,1.2500,1.8000,48,'g'),(58,-1.8181,3.2727,1.2500,1.8000,49,'g'),(59,1.8181,-1.2727,0.7000,1.2500,49,'g'),(60,-1.8181,2.2727,0.7000,1.2500,50,'g'),(61,3.3300,-1.3300,0.4000,0.7000,50,'g'),(62,-3.3300,2.3300,0.4000,0.7000,51,'g'),(63,0.0000,1.0000,0.0000,0.4000,51,'g'),(64,-0.2000,3.0000,10.0000,15.0000,18,'%'),(65,0.0000,1.0000,0.0000,10.0000,18,'%'),(66,-0.3300,6.0000,15.0000,18.0000,17,'%'),(67,0.2000,-2.0000,10.0000,15.0000,17,'%'),(68,-0.0800,2.5000,18.0000,30.0000,16,'%'),(69,0.3300,-5.0000,15.0000,18.0000,16,'%'),(70,-0.2000,7.0000,30.0000,35.0000,15,'%'),(71,0.0833,-1.5000,18.0000,30.0000,15,'%'),(72,0.0000,1.0000,35.0000,500.0000,14,'%'),(73,0.2000,-6.0000,30.0000,35.0000,14,'%'),(74,0.1000,-2.0000,20.0000,30.0000,24,'g'),(75,0.0000,1.0000,0.0000,20.0000,25,'g'),(76,-0.1000,3.0000,20.0000,30.0000,25,'g'),(77,0.0000,1.0000,30.0000,500.0000,24,'g');
/*!40000 ALTER TABLE `nutricionApp_funcion_lineal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_gramosporporcion`
--

DROP TABLE IF EXISTS `nutricionApp_gramosporporcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_gramosporporcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_porcion` varchar(254) NOT NULL,
  `valor_gramos` decimal(10,2) NOT NULL,
  `alimento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrici_alimento_id_66fe05d4918385af_fk_nutricionApp_alimento_id` (`alimento_id`),
  CONSTRAINT `nutrici_alimento_id_66fe05d4918385af_fk_nutricionApp_alimento_id` FOREIGN KEY (`alimento_id`) REFERENCES `nutricionApp_alimento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_gramosporporcion`
--

LOCK TABLES `nutricionApp_gramosporporcion` WRITE;
/*!40000 ALTER TABLE `nutricionApp_gramosporporcion` DISABLE KEYS */;
INSERT INTO `nutricionApp_gramosporporcion` VALUES (3,'prueba leche 1',100.00,1),(4,'prueba leche 2',50.00,1),(5,'Gramos',100.00,3),(6,'Gramos',1.00,4),(7,'Gramos',100.00,6),(8,'Gramos',100.00,7),(9,'Gramos',100.00,8),(10,'Gramos',100.00,9),(11,'Gramos',100.00,10),(12,'Gramos',100.00,11),(13,'Gramos',100.00,12),(14,'Gramos',100.00,13),(15,'Gramos',1.00,14),(16,'Pocillo(s)',62.00,14),(17,'Gramo(s)',1.00,15),(18,'Tajada(s)',32.00,15),(19,'Onza(s)',28.35,15),(20,'Pequeño',101.00,16),(21,'Mediano',118.00,16),(22,'Grande',136.00,16),(23,'Gramo',1.00,17),(24,'Pocillo',245.00,17),(25,'Gramo(s)',1.00,18),(26,'Pocillo(s)',245.00,18),(27,'Gramo(s)',1.00,19),(28,'Cucharadita(s)',8.40,19),(29,'Cucharada(s)',21.00,19),(30,'Gramo(s)',1.00,20),(31,'Cucharada(s)',12.50,20),(32,'Cucharadita(s)',5.00,20),(34,'Gramo(s)',1.00,21),(35,'Pocillo de tajadas',104.00,1),(36,'Gramo(s)',1.00,22),(37,'Pocillo(s) de tajadas',180.00,22),(38,'Grande',182.00,22),(39,'Mediano',123.00,22),(40,'Pequeño',91.00,22),(41,'Tajada',20.00,22),(42,'Gramo(s)',1.00,23),(43,'Cucharada(s)',14.00,23),(44,'Pocillo(s)',237.00,24),(45,'Gramo(s)',1.00,24),(46,'Gramo(s)',1.00,26),(47,'Taza',125.00,26),(48,'Gramo(s)',1.00,27),(49,'Grande',299.00,27),(50,'Mediana',173.00,27),(51,'Pequeña',138.00,27),(52,'Gramo(s)',1.00,28),(53,'Cucharada(s)',12.00,28),(54,'Gramo(s)',1.00,29),(55,'Tajada(s)',28.00,29),(56,'Cucharada(s)',14.00,29),(57,'Gramo(s)',1.00,30),(58,'Taza (tajada)',100.00,30),(59,'Cucharada(tajada)',6.00,30),(60,'Gramo(s)',1.00,31),(61,'Unidad(es)',28.00,31),(62,'Cucharadita(s)',5.60,32),(63,'Cucharada(s)',14.00,32),(64,'Gramo(s)',1.00,32),(65,'Pequeña(s)',149.00,33),(66,'Mediana(s)',182.00,33),(67,'Grande(s)',223.00,33),(68,'Gramo(s)',1.00,34),(69,'Gramo(s)',1.00,33),(70,'Taza',143.00,34),(71,'Unidad(es)',1.20,34),(72,'Gramo(s)',1.00,35),(73,'Taza',145.00,35),(74,'Unidad(es)',0.52,35),(75,'Pocillo(s)',248.00,36),(76,'Gramo(s)',1.00,36),(77,'Onza(s)',31.00,36),(78,'Gramo(s)',1.00,25),(79,'Onza(s)',28.33,25),(80,'Taza (tajada)',104.00,21),(81,'Gramo(s)',1.00,37),(82,'Pequeña',19.60,37),(83,'Grande(s)',98.00,37),(84,'Gramo(s)',1.00,38),(85,'Unidad(es)',172.00,38),(86,'Tajada(s)',43.00,1),(87,'Tajada(s)',19.00,39),(88,'Gramo(s)',1.00,39),(89,'Gramo(s)',1.00,40),(90,'Hoja(s)',28.00,40),(91,'Gramo(s)',1.00,42),(92,'Cucharada(s)',14.60,42),(93,'Gramo(s)',1.00,41),(94,'Cucharada(s)',16.50,41),(95,'Gramo(s)',1.00,43),(96,'Pequeño',130.00,43),(97,'Mediano',150.00,43),(98,'Grande',175.00,43),(99,'Gramo(s)',1.00,44),(100,'Pocillo(s)',248.00,44),(101,'Gramo(s)',1.00,46),(102,'Rollo(s)',79.80,46),(103,'Gramo(s)',1.00,50),(104,'Gramo(s)',1.00,51),(105,'Taza(s)',91.00,50),(106,'Grande(s)',184.00,51),(107,'Mediana(s)',65.50,51),(108,'Gramo(s)',1.00,52),(109,'Onza(s)',28.35,52),(110,'Cucharada(s)',5.00,52),(111,'Gramo(s)',1.00,53),(112,'Taza(s)',30.00,53),(113,'Hoja(s)',10.00,53),(114,'Gramo(s)',1.00,54),(115,'Onza(s)',85.00,54),(116,'Gramo(s)',1.00,55),(117,'Grande',72.00,55),(118,'Mediano',61.00,55),(119,'Pequeño',50.00,55),(120,'Pocillo(s) Rallado',110.00,55),(121,'Gramo(s)',1.00,56),(122,'Pocillo(s) Cortados',128.00,55),(123,'Cucharadita(s)',80.00,56),(124,'Gramo(s)',1.00,57),(125,'Pequeño',10.00,57),(126,'Mediano',18.00,57),(127,'Grande',23.00,57),(128,'Pocillo(s) Tajado',70.00,57),(129,'Gramo(s)',1.00,59),(130,'Taza',185.00,59),(131,'Gramo(s)',1.00,58),(132,'Pequeño',89.00,58),(133,'Mediano',103.00,58),(134,'Grande',118.00,58),(135,'Taza(s)',149.00,58),(136,'Gramo(s)',1.00,60),(137,'Unidad(es)',28.35,60),(138,'Gramo(s)',1.00,61),(139,'Lata ',76.00,61),(140,'Gramo(s)',1.00,62),(141,'Taza',40.00,62),(142,'Gramo(s)',1.00,63),(143,'Taza(s)',130.00,63),(144,'Mitade(s)',3.50,63),(145,'Gramo(s)',1.00,64),(146,'Rectangulo(s)',14.00,64),(147,'Gramo(s)',1.00,65),(148,'Taza(s)',253.00,65),(149,'Gramo(s)',1.00,66),(150,'Tajada',28.00,66),(151,'Taza(s) Julianas',128.00,55),(152,'Gramo(s)',1.00,68),(153,'Cucharada(s)',16.00,68),(154,'Gramo(s)',1.00,69),(155,'Taza',33.00,69),(156,'Gramo(s)',1.00,70),(157,'Unidad(es)',28.00,70),(158,'Gramo(s)',1.00,71),(159,'Taza(s)',160.00,71),(160,'Gramo(s)',1.00,73),(161,'Gramo(s)',1.00,72),(162,'Taza(s)',226.00,73),(163,'Taza(s) picado',156.00,72),(164,'Grande',814.00,72),(165,'Mediano',552.00,72),(166,'Pequeño',441.00,72),(167,'Gramo(s)',1.00,74),(168,'Taza',181.00,74),(169,'Gramo(s)',1.00,75),(170,'Gramo(s)',1.00,76),(171,'Juliana',40.00,76),(172,'Unidad',37.00,75),(173,'Gramo(s)',1.00,78),(174,'Cucharada(s)',17.00,78),(175,'Gramo(s)',1.00,77),(176,'Onza(s)',28.33,77),(177,'Unidad',1413.00,77),(178,'Gramo(s)',1.00,80),(179,'Taza',77.00,80),(180,'Gramo(s)',1.00,79),(181,'Gramo(s)',1.00,81),(182,'Cucharada(s)',15.50,79),(183,'Cucharada(s)',5.68,81);
/*!40000 ALTER TABLE `nutricionApp_gramosporporcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_ingeniero`
--

DROP TABLE IF EXISTS `nutricionApp_ingeniero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_ingeniero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `nutricionApp_ingeniero_user_id_2eb02f7a0613d846_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_ingeniero`
--

LOCK TABLES `nutricionApp_ingeniero` WRITE;
/*!40000 ALTER TABLE `nutricionApp_ingeniero` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutricionApp_ingeniero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_medico`
--

DROP TABLE IF EXISTS `nutricionApp_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_medico`
--

LOCK TABLES `nutricionApp_medico` WRITE;
/*!40000 ALTER TABLE `nutricionApp_medico` DISABLE KEYS */;
INSERT INTO `nutricionApp_medico` VALUES (1,'David','david@empresa.com'),(2,'Carlos Rodriguez','carly@correo.com');
/*!40000 ALTER TABLE `nutricionApp_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_medico_paciente`
--

DROP TABLE IF EXISTS `nutricionApp_medico_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_medico_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `seguimiento` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrici_paciente_id_7c4f27b10549a42b_fk_nutricionApp_paciente_id` (`paciente_id`),
  KEY `nutricionApp_medico_id_388d8e225f5439d_fk_nutricionApp_medico_id` (`medico_id`),
  CONSTRAINT `nutricionApp_medico_id_388d8e225f5439d_fk_nutricionApp_medico_id` FOREIGN KEY (`medico_id`) REFERENCES `nutricionApp_medico` (`id`),
  CONSTRAINT `nutrici_paciente_id_7c4f27b10549a42b_fk_nutricionApp_paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `nutricionApp_paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_medico_paciente`
--

LOCK TABLES `nutricionApp_medico_paciente` WRITE;
/*!40000 ALTER TABLE `nutricionApp_medico_paciente` DISABLE KEYS */;
INSERT INTO `nutricionApp_medico_paciente` VALUES (2,1,2,0);
/*!40000 ALTER TABLE `nutricionApp_medico_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_nutriente`
--

DROP TABLE IF EXISTS `nutricionApp_nutriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_nutriente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `kcalxgramo` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_nutriente`
--

LOCK TABLES `nutricionApp_nutriente` WRITE;
/*!40000 ALTER TABLE `nutricionApp_nutriente` DISABLE KEYS */;
INSERT INTO `nutricionApp_nutriente` VALUES (1,'Calcio',0),(2,'Sodio',0),(4,'Colesterol',0),(6,'Potasio',0),(7,'Proteina',4),(8,'Magnesio',0),(9,'Fibra',0),(10,'Carbohidratos',4),(11,'Grasa',9),(14,'GrasaSaturada',9);
/*!40000 ALTER TABLE `nutricionApp_nutriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_nutriente_etiqueta`
--

DROP TABLE IF EXISTS `nutricionApp_nutriente_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_nutriente_etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etiqueta_id` int(11) NOT NULL,
  `nutriente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrici_etiqueta_id_11a2bd0cc9efe215_fk_nutricionApp_etiqueta_id` (`etiqueta_id`),
  KEY `nutri_nutriente_id_4a75540207d4dc48_fk_nutricionApp_nutriente_id` (`nutriente_id`),
  CONSTRAINT `nutrici_etiqueta_id_11a2bd0cc9efe215_fk_nutricionApp_etiqueta_id` FOREIGN KEY (`etiqueta_id`) REFERENCES `nutricionApp_etiqueta` (`id`),
  CONSTRAINT `nutri_nutriente_id_4a75540207d4dc48_fk_nutricionApp_nutriente_id` FOREIGN KEY (`nutriente_id`) REFERENCES `nutricionApp_nutriente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_nutriente_etiqueta`
--

LOCK TABLES `nutricionApp_nutriente_etiqueta` WRITE;
/*!40000 ALTER TABLE `nutricionApp_nutriente_etiqueta` DISABLE KEYS */;
INSERT INTO `nutricionApp_nutriente_etiqueta` VALUES (2,3,4),(3,5,4),(14,5,7),(15,4,7),(16,3,7),(17,2,7),(18,1,7),(19,5,10),(20,4,10),(21,3,10),(22,2,10),(24,3,9),(25,2,9),(26,5,11),(27,4,11),(28,3,11),(29,2,11),(30,1,11),(31,5,14),(32,4,14),(34,3,14),(35,4,6),(36,3,6),(37,2,6),(38,1,6),(39,4,8),(40,3,8),(41,2,8),(42,1,8),(43,5,2),(44,4,2),(45,3,2),(46,1,2),(47,5,1),(48,4,1),(49,3,1),(50,2,1),(51,1,1);
/*!40000 ALTER TABLE `nutricionApp_nutriente_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_paciente`
--

DROP TABLE IF EXISTS `nutricionApp_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `estatura_cm` int(11) NOT NULL,
  `ejercicio` int(11) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `fecha_nacimiento` bigint(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_paciente`
--

LOCK TABLES `nutricionApp_paciente` WRITE;
/*!40000 ALTER TABLE `nutricionApp_paciente` DISABLE KEYS */;
INSERT INTO `nutricionApp_paciente` VALUES (1,'casas','dadaoros@gmail.com',59.00,180,1,'m',1,'hello'),(2,'Pablo poncio','ryuuzakiupldr@gmail.com',65.00,180,3,'f',703900800,'12345');
/*!40000 ALTER TABLE `nutricionApp_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_paciente_alimento_porcion`
--

DROP TABLE IF EXISTS `nutricionApp_paciente_alimento_porcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_paciente_alimento_porcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  `alimento_porcion_id` int(11) NOT NULL,
  `tamano_porcion` decimal(15,3) NOT NULL,
  `fecha_consumo` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrici_paciente_id_137aa0993862aa18_fk_nutricionApp_paciente_id` (`paciente_id`),
  KEY `D298b6d0261370a992ed2022d7fcdbac` (`alimento_porcion_id`),
  CONSTRAINT `D298b6d0261370a992ed2022d7fcdbac` FOREIGN KEY (`alimento_porcion_id`) REFERENCES `nutricionApp_gramosporporcion` (`id`),
  CONSTRAINT `nutrici_paciente_id_137aa0993862aa18_fk_nutricionApp_paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `nutricionApp_paciente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_paciente_alimento_porcion`
--

LOCK TABLES `nutricionApp_paciente_alimento_porcion` WRITE;
/*!40000 ALTER TABLE `nutricionApp_paciente_alimento_porcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutricionApp_paciente_alimento_porcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_precendente_regla`
--

DROP TABLE IF EXISTS `nutricionApp_precendente_regla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_precendente_regla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regla_id` int(11) NOT NULL,
  `precendente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutricionApp__regla_id_11b682b94f5a3056_fk_nutricionApp_regla_id` (`regla_id`),
  KEY `ee41f4e573ebfc71ff0310e64c25357b` (`precendente_id`),
  CONSTRAINT `ee41f4e573ebfc71ff0310e64c25357b` FOREIGN KEY (`precendente_id`) REFERENCES `nutricionApp_nutriente_etiqueta` (`id`),
  CONSTRAINT `nutricionApp__regla_id_11b682b94f5a3056_fk_nutricionApp_regla_id` FOREIGN KEY (`regla_id`) REFERENCES `nutricionApp_regla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_precendente_regla`
--

LOCK TABLES `nutricionApp_precendente_regla` WRITE;
/*!40000 ALTER TABLE `nutricionApp_precendente_regla` DISABLE KEYS */;
INSERT INTO `nutricionApp_precendente_regla` VALUES (32,13,42),(33,14,42),(35,15,42),(37,17,41),(38,18,41),(39,19,41),(40,20,36),(41,21,35),(42,13,37),(43,20,44),(44,14,36),(45,21,44),(46,22,46),(47,15,35),(48,23,46),(49,24,46),(50,25,46),(51,26,45),(52,27,45),(53,17,37),(54,28,45),(55,29,45),(56,30,44),(57,31,44),(58,32,44),(59,33,44),(60,34,43),(61,35,43),(62,18,36),(63,36,43),(64,37,43),(65,38,43),(66,39,43),(67,40,43),(68,19,35),(69,23,15),(70,22,15),(71,23,49),(72,22,50),(73,25,14),(74,24,15),(75,25,50),(76,24,48),(77,27,15),(78,27,49),(79,26,15),(80,29,14),(81,26,50),(82,29,50),(83,31,15),(84,31,49),(85,28,15),(86,28,48),(87,33,14),(88,33,50),(89,35,17),(90,30,15),(91,35,50),(92,30,50),(93,37,15),(94,37,50),(95,32,15),(96,32,48),(97,39,14),(98,39,50),(99,40,14),(100,40,49),(101,36,16),(102,36,50),(103,38,15),(104,38,49),(105,34,18),(106,34,50),(107,41,38),(108,42,38),(109,43,38),(110,44,38),(111,45,37),(112,46,37),(113,47,37),(114,48,37),(115,49,36),(116,50,36),(117,51,36),(118,52,44),(120,54,35),(121,55,35),(122,41,46),(123,42,45),(124,43,44),(125,44,43),(126,45,46),(127,46,45),(128,47,44),(129,48,43),(130,49,46),(131,50,45),(132,51,43),(133,52,46),(134,54,45),(135,55,43),(136,56,42),(137,57,41),(138,58,40),(139,59,40),(140,60,40),(141,61,40),(142,62,39),(143,63,39),(145,65,39),(146,66,39),(147,56,38),(148,57,38),(149,58,38),(150,59,37),(151,60,36),(152,61,35),(153,62,38),(154,63,37),(155,65,36),(156,66,35),(157,69,46),(158,70,46),(159,71,46),(160,72,46),(161,73,46),(162,74,46),(163,75,46),(164,76,46),(165,77,46),(166,78,46),(167,79,46),(168,80,46),(169,81,46),(170,82,46),(171,83,46),(172,84,46),(173,85,46),(174,86,46),(175,87,46),(176,88,46),(177,89,46),(178,90,45),(179,91,45),(180,92,45),(181,93,45),(182,94,45),(183,95,45),(184,96,45),(185,97,45),(186,98,45),(187,99,45),(188,100,45),(189,101,45),(190,102,45),(191,103,45),(192,104,45),(193,105,45),(194,106,45),(195,107,45),(196,108,45),(197,109,45),(198,110,45),(199,111,44),(200,112,44),(201,113,44),(202,114,44),(203,115,44),(204,116,44),(205,117,44),(206,118,44),(207,119,44),(208,120,44),(209,121,44),(210,122,44),(211,123,44),(212,124,44),(213,125,44),(214,126,44),(215,127,44),(216,128,44),(217,129,44),(218,130,44),(219,131,44),(220,132,43),(221,133,43),(222,134,43),(223,135,43),(224,136,43),(225,137,43),(226,138,43),(227,139,43),(228,140,43),(229,141,43),(230,142,43),(231,143,43),(232,144,43),(233,145,43),(234,146,43),(235,147,43),(236,148,43),(237,149,43),(238,69,18),(239,70,18),(240,71,18),(241,72,18),(242,73,18),(243,74,17),(244,75,17),(245,76,17),(246,77,17),(247,78,17),(248,79,16),(249,80,16),(250,81,16),(251,82,16),(252,83,16),(253,84,15),(254,85,15),(255,86,14),(256,87,14),(257,88,14),(258,89,14),(259,90,18),(260,91,18),(261,92,18),(262,93,18),(263,94,18),(264,95,17),(265,96,17),(266,97,17),(267,98,17),(268,99,17),(269,100,16),(270,101,16),(271,102,16),(272,103,16),(273,104,16),(274,105,15),(275,106,15),(276,107,14),(277,108,14),(278,109,14),(279,110,14),(280,111,18),(281,112,18),(282,113,18),(283,114,18),(284,115,18),(285,116,17),(286,117,17),(287,118,17),(288,119,17),(289,120,17),(290,121,16),(291,122,16),(292,123,16),(293,124,16),(294,125,16),(295,126,15),(296,127,15),(297,128,14),(298,129,14),(299,130,14),(300,131,14),(301,132,18),(302,133,18),(303,134,18),(304,135,18),(305,136,17),(306,137,17),(307,138,17),(308,139,17),(309,140,16),(310,141,16),(311,142,16),(312,143,16),(313,144,15),(314,145,15),(315,146,15),(316,147,14),(317,148,14),(318,149,14),(319,69,51),(320,70,50),(321,71,49),(322,72,48),(323,73,47),(324,74,51),(325,75,50),(326,76,49),(327,77,48),(328,78,47),(329,79,51),(330,80,50),(331,81,49),(332,82,48),(333,83,47),(334,84,51),(335,85,47),(336,86,51),(337,87,49),(338,88,48),(339,89,47),(340,90,51),(341,91,50),(342,92,49),(343,93,48),(344,94,47),(345,95,51),(346,96,50),(347,97,49),(348,98,48),(349,99,47),(350,100,51),(351,101,50),(352,102,49),(353,103,48),(354,104,47),(355,105,51),(356,106,47),(357,107,51),(358,108,49),(359,109,48),(360,110,47),(361,111,51),(362,112,50),(363,113,49),(364,114,48),(365,115,47),(366,116,51),(367,117,50),(368,118,49),(369,119,48),(370,120,47),(371,121,51),(372,122,50),(373,123,49),(374,124,48),(375,125,47),(376,126,51),(377,127,47),(378,128,51),(379,129,49),(380,130,48),(381,131,47),(382,132,51),(383,133,49),(384,134,48),(385,135,47),(386,136,51),(387,137,49),(388,138,48),(389,139,47),(390,140,51),(391,141,49),(392,142,48),(393,143,47),(394,144,51),(395,145,48),(396,146,47),(397,147,51),(398,148,48),(399,149,47);
/*!40000 ALTER TABLE `nutricionApp_precendente_regla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_regla`
--

DROP TABLE IF EXISTS `nutricionApp_regla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_regla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `consecuente_id` int(11) NOT NULL,
  `recomendacion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `d0ea497dcbc14c2b35c230fe9331723c` (`consecuente_id`),
  CONSTRAINT `d0ea497dcbc14c2b35c230fe9331723c` FOREIGN KEY (`consecuente_id`) REFERENCES `nutricionApp_nutriente_etiqueta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_regla`
--

LOCK TABLES `nutricionApp_regla` WRITE;
/*!40000 ALTER TABLE `nutricionApp_regla` DISABLE KEYS */;
INSERT INTO `nutricionApp_regla` VALUES (13,'Potasio 1',38,'El consumo de potasio fue bajo, pero se calculó como muy bajo debido a que el magnesio se encontró muy bajo.'),(14,'Potasio 2',37,'El consumo de potasio fue recomendable, pero se calculó como bajo debido a que el magnesio se encontró muy bajo.'),(15,'Potasio 3',36,'El consumo de potasio fue alto, pero se calculó como recomendable debido a que el magnesio se encontró muy bajo.'),(17,'Potasio 4',38,'El consumo de potasio fue bajo, pero se calculó como muy bajo debido a que el magnesio se encontró bajo.'),(18,'Potasio 5',37,'El consumo de potasio fue recomendable, pero se calculó como bajo debido a que el magnesio se encontró bajo'),(19,'Potasio 6',36,'El consumo de potasio fue alto, pero se calculó como recomendable debido a que el magnesio se encontró bajo'),(20,'Sodio 1',45,'El consumo de sodio se muestra recomendable, esto es  gracias a los beneficios del consumo de potasio, el cual tiende a mitigar los consumos altos en sodio.'),(21,'Sodio 2',45,' El consumo de sodio se muestra recomendable, esto es gracias a los beneficios de los consumos altos de potasio, los cuales tienden a mitigar los consumos altos de sodio. '),(22,'Calcio 1',51,'Aún cuando el consumo de calcio fue bajo  se muestra como muy bajo debido al alto consumo de proteína.'),(23,'Calcio 2',50,' Aún cuando el consumo de calcio fue recomendable se muestra como  bajo debido al alto consumo de proteína. '),(24,'Calcio 3',49,' Aún cuando el consumo de calcio fue alto se muestra como  recomendable debido al alto consumo de proteína. '),(25,'Calcio 4',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al excesivo consumo de proteína.'),(26,'Calcio 5',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al alto consumo de proteína.'),(27,'Calcio 6',50,'Aún cuando el consumo de calcio fue recomendable se muestra como bajo debido al alto consumo de proteína.'),(28,'Calcio 7',49,'Aún cuando el consumo de calcio fue alto se muestra como recomendable debido al alto consumo de proteína.'),(29,'Calcio 8',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al excesivo consumo de proteína.'),(30,'Calcio 9',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido a los altos consumos de proteína y sodio.'),(31,'Calcio 10',50,'Aún cuando el consumo de calcio fue recomendable se muestra como bajo debido a los altos consumos de proteína y sodio.'),(32,'Calcio 11',49,'Aún cuando el consumo de calcio fue alto se muestra como recomendable debido a los altos consumos de proteína y sodio.'),(33,'Calcio 12',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido a los altos consumos de proteína y sodio.'),(34,'Calcio 13',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al excesivo consumo de sodio.'),(35,'Calcio 14',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al excesivo consumo de sodio.'),(36,'Calcio 15',51,'Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido al excesivo consumo de sodio.'),(37,'Calcio 16',51,' Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido a los altos consumos de proteína y sodio. '),(38,'Calcio 17',51,' Aún cuando el consumo de calcio fue recomendable se muestra como muy bajo debido a los altos consumos de proteína y sodio. '),(39,'Calcio 18',51,' Aún cuando el consumo de calcio fue bajo se muestra como muy bajo debido a los excesivos consumos de proteína y sodio. '),(40,'Calcio 19',51,' Aún cuando el consumo de calcio fue recomendable se muestra como muy bajo debido a los excesivos consumos de proteína y sodio. '),(41,'Sodio 3',46,''),(42,'Sodio 4',45,''),(43,'Sodio 5',44,''),(44,'Sodio 6',43,''),(45,'Sodio 7',46,''),(46,'Sodio 8',45,''),(47,'Sodio 9',44,''),(48,'Sodio 10',43,''),(49,'Sodio 11',46,''),(50,'Sodio 12',45,''),(51,'Sodio 13',43,''),(52,'Sodio 14',46,''),(54,'Sodio 15',45,''),(55,'Sodio 16',43,''),(56,'Potasio  7',38,''),(57,'Potasio 8',38,''),(58,'Potasio 9',38,''),(59,'Potasio 10',37,''),(60,'Potasio 11',36,''),(61,'Potasio 12',35,''),(62,'Potasio 13',38,''),(63,'Potasio 14',37,''),(65,'Potasio 15',36,''),(66,'Potasio 16',35,''),(69,'Calcio 20',51,''),(70,'Calcio 21',50,''),(71,'Calcio 22',49,''),(72,'Calcio 23',48,''),(73,'Calcio 24',47,''),(74,'Calcio 25',51,''),(75,'Calcio 26',50,''),(76,'Calcio 27',49,''),(77,'Calcio 28',48,''),(78,'Calcio 29',47,''),(79,'Calcio 30',51,''),(80,'Calcio 31',50,''),(81,'Calcio 32',49,''),(82,'Calcio 33',48,''),(83,'Calcio 34',47,''),(84,'Calcio 35',51,''),(85,'Calcio 36',47,''),(86,'Calcio 37',51,''),(87,'Calcio 38',49,''),(88,'Calcio 39',48,''),(89,'Calcio 40',47,''),(90,'Calcio 41',51,''),(91,'Calcio 42',50,''),(92,'Calcio 43',49,''),(93,'Calcio 44',48,''),(94,'Calcio 45',47,''),(95,'Calcio 46',51,''),(96,'Calcio 47',50,''),(97,'Calcio 48',49,''),(98,'Calcio 49',48,''),(99,'Calcio 50',47,''),(100,'Calcio 51',51,''),(101,'Calcio 52',50,''),(102,'Calcio 53',49,''),(103,'Calcio 54',48,''),(104,'Calcio 55',47,''),(105,'Calcio 56',51,''),(106,'Calcio 57',47,''),(107,'Calcio 58',51,''),(108,'Calcio 59',49,''),(109,'Calcio 60',48,''),(110,'Calcio 61',47,''),(111,'Calcio 62',51,''),(112,'Calcio 63',50,''),(113,'Calcio 64',49,''),(114,'Calcio 65',48,''),(115,'Calcio 66',47,''),(116,'Calcio 67',51,''),(117,'Calcio 68',50,''),(118,'Calcio 69',49,''),(119,'Calcio 70',48,''),(120,'Calcio 71',47,''),(121,'Calcio 72',51,''),(122,'Calcio 73',50,''),(123,'Calcio 74',49,''),(124,'Calcio 75',48,''),(125,'Calcio 76',47,''),(126,'Calcio 77',51,''),(127,'Calcio 78',47,''),(128,'Calcio 79',51,''),(129,'Calcio 80',49,''),(130,'Calcio 81',48,''),(131,'Calcio 82',47,''),(132,'Calcio 83',51,''),(133,'Calcio 84',49,''),(134,'Calcio 85',48,''),(135,'Calcio 86',47,''),(136,'Calcio 87',51,''),(137,'Calcio 88',49,''),(138,'Calcio 89',48,''),(139,'Calcio 90',47,''),(140,'Calcio 91',51,''),(141,'Calcio 92',49,''),(142,'Calcio 93',48,''),(143,'Calcio 94',47,''),(144,'Calcio 95',51,''),(145,'Calcio 96',48,''),(146,'Calcio 97',47,''),(147,'Calcio 98',51,''),(148,'Calcio 99',48,''),(149,'Calcio 100',47,'');
/*!40000 ALTER TABLE `nutricionApp_regla` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-19 18:21:49
