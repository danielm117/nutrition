-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nutricionApp
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add alimento',8,'add_alimento'),(23,'Can change alimento',8,'change_alimento'),(24,'Can delete alimento',8,'delete_alimento'),(25,'Can add nutriente',9,'add_nutriente'),(26,'Can change nutriente',9,'change_nutriente'),(27,'Can delete nutriente',9,'delete_nutriente'),(28,'Can add etiqueta',10,'add_etiqueta'),(29,'Can change etiqueta',10,'change_etiqueta'),(30,'Can delete etiqueta',10,'delete_etiqueta'),(34,'Can add regla',12,'add_regla'),(35,'Can change regla',12,'change_regla'),(36,'Can delete regla',12,'delete_regla'),(37,'Can add gramosporporcion',13,'add_gramosporporcion'),(38,'Can change gramosporporcion',13,'change_gramosporporcion'),(39,'Can delete gramosporporcion',13,'delete_gramosporporcion'),(43,'Can add cantidad_ nutriente_ alimento',15,'add_cantidad_nutriente_alimento'),(44,'Can change cantidad_ nutriente_ alimento',15,'change_cantidad_nutriente_alimento'),(45,'Can delete cantidad_ nutriente_ alimento',15,'delete_cantidad_nutriente_alimento'),(46,'Can add nutriente_ etiqueta',16,'add_nutriente_etiqueta'),(47,'Can change nutriente_ etiqueta',16,'change_nutriente_etiqueta'),(48,'Can delete nutriente_ etiqueta',16,'delete_nutriente_etiqueta'),(49,'Can add funcion_ lineal',17,'add_funcion_lineal'),(50,'Can change funcion_ lineal',17,'change_funcion_lineal'),(51,'Can delete funcion_ lineal',17,'delete_funcion_lineal'),(55,'Can add recomendacion',19,'add_recomendacion'),(56,'Can change recomendacion',19,'change_recomendacion'),(57,'Can delete recomendacion',19,'delete_recomendacion'),(58,'Can add precendente_ regla',20,'add_precendente_regla'),(59,'Can change precendente_ regla',20,'change_precendente_regla'),(60,'Can delete precendente_ regla',20,'delete_precendente_regla'),(61,'Can add paciente',21,'add_paciente'),(62,'Can change paciente',21,'change_paciente'),(63,'Can delete paciente',21,'delete_paciente'),(64,'Can add paciente_ alimento_ porcion',22,'add_paciente_alimento_porcion'),(65,'Can change paciente_ alimento_ porcion',22,'change_paciente_alimento_porcion'),(66,'Can delete paciente_ alimento_ porcion',22,'delete_paciente_alimento_porcion'),(67,'Can add medico',23,'add_medico'),(68,'Can change medico',23,'change_medico'),(69,'Can delete medico',23,'delete_medico'),(70,'Can add medico_ paciente',24,'add_medico_paciente'),(71,'Can change medico_ paciente',24,'change_medico_paciente'),(72,'Can delete medico_ paciente',24,'delete_medico_paciente');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$jirdEmlhPmLX$G1+4Dr08N600PJk1n3heOyRFsIhizYifDc85tpWASYA=','2016-08-18 00:18:17',1,'admin','','','dadaoros@gmail.com',1,1,'2016-07-07 01:00:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-07 01:01:47','1','Muy Bajo',1,'',10,1),(2,'2016-07-07 01:01:51','2','Bajo',1,'',10,1),(3,'2016-07-07 01:01:58','3','Recomendado',1,'',10,1),(4,'2016-07-07 01:02:06','4','Muy Alto',1,'',10,1),(5,'2016-07-07 01:02:12','5','Excesivo',1,'',10,1),(6,'2016-07-07 01:02:33','1','Calcio',1,'',9,1),(7,'2016-07-07 01:02:41','2','Sodio',1,'',9,1),(8,'2016-07-07 01:02:49','3','Potasio',1,'',9,1),(9,'2016-07-07 01:03:03','1','Calcio Bajo',1,'',16,1),(10,'2016-07-07 01:26:42','4','Colesterol',1,'',9,1),(11,'2016-07-07 01:26:58','2','Colesterol Recomendado',1,'',16,1),(12,'2016-07-07 01:27:49','3','Colesterol Muy Alto',1,'',16,1),(13,'2016-07-07 01:28:37','1','Colesterol Recomendable',1,'',17,1),(14,'2016-07-07 01:30:18','2','Colesterol Recomendable',1,'',17,1),(15,'2016-07-07 01:34:19','3','Colesterol Muy Alto',1,'',17,1),(16,'2016-07-07 01:34:44','4','Colesterol Muy Alto',1,'',17,1),(17,'2016-07-07 01:34:51','3','Colesterol Muy Alto',2,'No fields changed.',17,1),(18,'2016-07-10 16:47:27','4','Exces',2,'Changed nombre.',10,1),(19,'2016-07-10 16:47:43','5','Alto',2,'Changed nombre.',10,1),(20,'2016-07-10 16:47:57','4','Alto1',2,'Changed nombre.',10,1),(21,'2016-07-10 16:48:09','5','Excesivo',2,'Changed nombre.',10,1),(22,'2016-07-10 16:48:18','4','Alto',2,'Changed nombre.',10,1),(23,'2016-07-10 16:49:27','3','Colesterol Excesivo',2,'Changed etiqueta.',16,1),(24,'2016-07-10 16:53:31','4','Calcio Muy Bajo',1,'',16,1),(25,'2016-07-10 16:53:42','5','Calcio Excesivo',1,'',16,1),(26,'2016-07-10 16:53:52','6','Calcio Alto',1,'',16,1),(27,'2016-07-10 16:54:04','7','Calcio Recomendable',1,'',16,1),(28,'2016-07-10 16:54:15','8','Calcio Alto',1,'',16,1),(29,'2016-07-10 16:54:35','8','Calcio Alto',3,'',16,1),(30,'2016-07-11 00:01:54','3','Colesterol Excesivo',2,'No fields changed.',17,1),(31,'2016-07-11 00:02:04','4','Colesterol Excesivo',2,'No fields changed.',17,1),(32,'2016-07-19 18:15:49','1','Calcio',2,'Changed kcalxgramo.',9,1),(33,'2016-07-20 00:17:45','1','Sudar mas',1,'',19,1),(34,'2016-07-20 00:17:48','1','Regla 1',1,'',12,1),(35,'2016-07-20 00:18:25','1','1',1,'',20,1),(36,'2016-07-20 00:18:33','2','1',1,'',20,1),(37,'2016-08-03 01:38:42','1','Alimento object',1,'',8,1),(38,'2016-08-03 01:39:10','2','Alimento object',1,'',8,1),(39,'2016-08-03 01:43:43','1','Grande',1,'',13,1),(40,'2016-08-03 01:43:59','2','Mediana',1,'',13,1),(41,'2016-08-03 01:44:17','3','prueba leche 1',1,'',13,1),(42,'2016-08-03 01:44:31','4','prueba leche 2',1,'',13,1),(43,'2016-08-08 17:14:16','1','Leche de Soya',2,'Changed tags.',8,1),(44,'2016-08-08 17:56:38','2','Manzana con piel',2,'Changed tags.',8,1),(45,'2016-08-09 00:20:28','1','Cantidad_Nutriente_Alimento object',1,'',15,1),(46,'2016-08-09 01:25:25','1','Leche de Soya Calcio',2,'No fields changed.',15,1),(47,'2016-08-10 00:58:28','1','david@empresa.com',1,'',23,1),(48,'2016-08-10 01:01:05','1','dadaoros@gmail.com',1,'',21,1),(49,'2016-08-11 23:01:08','2','prueba reco1',1,'',19,1),(50,'2016-08-11 23:01:19','3','prueba reco2',1,'',19,1),(51,'2016-08-12 01:52:35','2','Regla 2',1,'',12,1),(52,'2016-08-12 01:57:11','8','Precendente_Regla object',1,'',20,1),(53,'2016-08-12 01:58:56','9','Regla 2',1,'',20,1),(54,'2016-08-12 01:59:56','10','Regla 2 Colesterol Recomendable',1,'',20,1),(55,'2016-08-12 23:10:41','2','carly@correo.com',1,'',23,1),(56,'2016-08-12 23:17:23','2','casas Carlos Rodriguez',1,'',24,1),(57,'2016-08-18 00:18:31','3','Regla 1',1,'',12,1),(58,'2016-08-18 00:23:43','16','Regla 1 Calcio Bajo',1,'',20,1),(59,'2016-08-18 23:37:41','9','asdasd',1,'',12,1),(60,'2016-08-18 23:55:32','10','asdasd',1,'',12,1),(61,'2016-08-18 23:56:37','28','Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión por  esto es fundamental reducir el consumo de sal.  Además esta elevado el consumo de proteína,  para esto se reco',2,'No fields changed.',19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'nutricionApp','alimento'),(15,'nutricionApp','cantidad_nutriente_alimento'),(10,'nutricionApp','etiqueta'),(17,'nutricionApp','funcion_lineal'),(13,'nutricionApp','gramosporporcion'),(23,'nutricionApp','medico'),(24,'nutricionApp','medico_paciente'),(9,'nutricionApp','nutriente'),(16,'nutricionApp','nutriente_etiqueta'),(21,'nutricionApp','paciente'),(22,'nutricionApp','paciente_alimento_porcion'),(20,'nutricionApp','precendente_regla'),(19,'nutricionApp','recomendacion'),(12,'nutricionApp','regla'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-07 00:54:15'),(2,'auth','0001_initial','2016-07-07 00:54:18'),(3,'admin','0001_initial','2016-07-07 00:54:19'),(4,'contenttypes','0002_remove_content_type_name','2016-07-07 00:54:20'),(5,'auth','0002_alter_permission_name_max_length','2016-07-07 00:54:20'),(6,'auth','0003_alter_user_email_max_length','2016-07-07 00:54:20'),(7,'auth','0004_alter_user_username_opts','2016-07-07 00:54:21'),(8,'auth','0005_alter_user_last_login_null','2016-07-07 00:54:21'),(9,'auth','0006_require_contenttypes_0002','2016-07-07 00:54:21'),(10,'nutricionApp','0001_initial','2016-07-07 00:54:29'),(11,'sessions','0001_initial','2016-07-07 00:54:29'),(12,'nutricionApp','0002_auto_20160715_2349','2016-07-15 23:52:55'),(13,'nutricionApp','0003_auto_20160720_0004','2016-07-20 00:04:22'),(14,'nutricionApp','0002_paciente_fecha_nacimiento','2016-08-10 00:42:10'),(15,'nutricionApp','0003_remove_paciente_password','2016-08-10 00:43:18'),(16,'nutricionApp','0004_paciente_password','2016-08-10 00:43:32'),(17,'nutricionApp','0005_remove_regla_recomendacion','2016-08-19 00:05:04'),(18,'nutricionApp','0006_regla_recomendacion','2016-08-19 00:08:40');
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
INSERT INTO `django_session` VALUES ('1cdfco8hh4s8sbiq19yi4yl1i93hgbay','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-04 22:53:20'),('c5pz9vefy18puzn06w7scb6rszeup9ud','NTViYzdmOGM4NWVlYWI5YWQ0MTdiODQ1ZjUyYWU4Y2I0ZDNhYTI0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-24 00:58:05'),('mprlhcf6goizw1c5zcbju50iijsq4qa9','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-21 01:01:02'),('s3238jg9nuuqlhjexmxg4gx9wq8ngkho','NTViYzdmOGM4NWVlYWI5YWQ0MTdiODQ1ZjUyYWU4Y2I0ZDNhYTI0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-01 00:18:17'),('y51phnlgssnhdwxqjhr1ty8zbhovkygn','MzVhN2I5YWMzNzhiZjhhMWU1ODBhZTI2OWRkMzJmNmZlYzgwMGFjYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VjNTllNmEyNTQ0MmIwMmQ1MDc5NjQyYmVlMGIwODc1YjY2ZDdhMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-08-17 01:36:06'),('zjnwyrdhc895o42eilzbl9lywpp92ihw','NjdlMTA1ZGY3ZTRmNzdhMmI3Y2ZmZjhlZDllZjYzYjUwZDhjZjIyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlYzU5ZTZhMjU0NDJiMDJkNTA3OTY0MmJlZTBiMDg3NWI2NmQ3YTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-09 23:38:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_alimento`
--

LOCK TABLES `nutricionApp_alimento` WRITE;
/*!40000 ALTER TABLE `nutricionApp_alimento` DISABLE KEYS */;
INSERT INTO `nutricionApp_alimento` VALUES (1,'Leche de Soya','1212','cena, almuerzo'),(2,'Manzana con piel','09003','frutas, desayuno');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_cantidad_nutriente_alimento`
--

LOCK TABLES `nutricionApp_cantidad_nutriente_alimento` WRITE;
/*!40000 ALTER TABLE `nutricionApp_cantidad_nutriente_alimento` DISABLE KEYS */;
INSERT INTO `nutricionApp_cantidad_nutriente_alimento` VALUES (1,1,1,0.026),(2,2,1,123123.121);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_funcion_lineal`
--

LOCK TABLES `nutricionApp_funcion_lineal` WRITE;
/*!40000 ALTER TABLE `nutricionApp_funcion_lineal` DISABLE KEYS */;
INSERT INTO `nutricionApp_funcion_lineal` VALUES (1,0.0000,1.0000,0.0000,0.1500,2,'g'),(2,-6.6700,2.0000,1.0000,0.3000,2,'g'),(3,6.6700,22.0000,1.1500,1.3000,3,'g'),(4,0.0000,1.0000,0.3000,100.0000,3,'g'),(5,1.0000,1.0000,1.0000,1.0000,2,'g');
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
  `valor_gramos` decimal(5,2) NOT NULL,
  `alimento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrici_alimento_id_66fe05d4918385af_fk_nutricionApp_alimento_id` (`alimento_id`),
  CONSTRAINT `nutrici_alimento_id_66fe05d4918385af_fk_nutricionApp_alimento_id` FOREIGN KEY (`alimento_id`) REFERENCES `nutricionApp_alimento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_gramosporporcion`
--

LOCK TABLES `nutricionApp_gramosporporcion` WRITE;
/*!40000 ALTER TABLE `nutricionApp_gramosporporcion` DISABLE KEYS */;
INSERT INTO `nutricionApp_gramosporporcion` VALUES (1,'Grande',223.00,2),(2,'Mediana',182.00,2),(3,'prueba leche 1',100.00,1),(4,'prueba leche 2',50.00,1);
/*!40000 ALTER TABLE `nutricionApp_gramosporporcion` ENABLE KEYS */;
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
  `empresa` varchar(254) NOT NULL,
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
INSERT INTO `nutricionApp_medico` VALUES (1,'David','Empresa','david@empresa.com'),(2,'Carlos Rodriguez','Hospital San carlos','carly@correo.com');
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
INSERT INTO `nutricionApp_nutriente` VALUES (1,'Calcio',0),(2,'Sodio',0),(4,'Colesterol',0),(6,'Potasio',0),(7,'Proteina',0),(8,'Magnesio',0),(9,'Fibra',0),(10,'Carbohidratos',0),(11,'Grasa',0),(14,'GrasaSaturada',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_precendente_regla`
--

LOCK TABLES `nutricionApp_precendente_regla` WRITE;
/*!40000 ALTER TABLE `nutricionApp_precendente_regla` DISABLE KEYS */;
INSERT INTO `nutricionApp_precendente_regla` VALUES (32,13,42),(33,14,42),(35,15,42),(37,17,41),(38,18,41),(39,19,41),(40,20,36),(41,21,35),(42,13,37),(43,20,44),(44,14,36),(45,21,44),(46,22,46),(47,15,35),(48,23,46),(49,24,46),(50,25,46),(51,26,45),(52,27,45),(53,17,37),(54,28,45),(55,29,45),(56,30,44),(57,31,44),(58,32,44),(59,33,44),(60,34,43),(61,35,43),(62,18,36),(63,36,43),(64,37,43),(65,38,43),(66,39,43),(67,40,43),(68,19,35),(69,23,15),(70,22,15),(71,23,49),(72,22,50),(73,25,14),(74,24,15),(75,25,50),(76,24,48),(77,27,15),(78,27,49),(79,26,15),(80,29,14),(81,26,50),(82,29,50),(83,31,15),(84,31,49),(85,28,15),(86,28,48),(87,33,14),(88,33,50),(89,35,17),(90,30,15),(91,35,50),(92,30,50),(93,37,15),(94,37,50),(95,32,15),(96,32,48),(97,39,14),(98,39,50),(99,40,14),(100,40,49),(101,36,16),(102,36,50),(103,38,15),(104,38,49),(105,34,18),(106,34,50);
/*!40000 ALTER TABLE `nutricionApp_precendente_regla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionApp_recomendacion`
--

DROP TABLE IF EXISTS `nutricionApp_recomendacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutricionApp_recomendacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_recomendacion`
--

LOCK TABLES `nutricionApp_recomendacion` WRITE;
/*!40000 ALTER TABLE `nutricionApp_recomendacion` DISABLE KEYS */;
INSERT INTO `nutricionApp_recomendacion` VALUES (5,'Los bajos niveles de consumo de magnesio  empeoran la deficiencia de potasio. Por esto se  recomiendan alimentos como arvejas, fríjoles,  leche y banano.'),(6,'Los bajos niveles de consumo de magnesio  provocan niveles bajos en el potasio. Por esto  se recomiendan alimentos como arvejas,  fríjoles y leche.'),(7,'Pese a que el consumo de potasio se muestra  recomendable se recomienda disminuirlo y  cuidar los niveles de magnesio consumiendo  alimentos como arvejas, fríjoles y leche.'),(8,'Una deficiencia de magnesio empeora la  deficiencia de potasio. Por esto se recomiendan  alimentos ricos en ambos nutrientes como  arvejas, fríjoles, leche, espinacas y banano.'),(9,'Los bajos niveles de potasio se deben a una  deficiencia en el consumo de magnesio. Por  esto se recomiendan alimentos como arvejas,  fríjoles y leche.'),(10,'Pese a que el consumo de potasio se muestra  recomendable se recomienda disminuirlo y  cuidar los niveles de magnesio consumiendo  alimentos como arvejas, fríjoles y leche.'),(11,'Pese a que el consumo de sodio se muestra  recomendable se recomienda disminuirlo y  mantener los niveles de potasio'),(12,'Pese a que el consumo de sodio se muestra  recomendable se recomienda disminuirlo'),(13,'El consumo de calcio se muestra muy bajo  debido al alto consumo de proteína se  recomienda reducir el consumo de carne y reemplazarlo por lácteos.'),(14,'El consumo de calcio se muestra como bajo  debido al alto consumo de proteína se  recomienda reducir el consumo de carne.'),(15,'Aun cuando el consumo de calcio se muestra  recomendable, se recomienda controlar el  consumo de calcio y proteína reduciendo el  consumo de lácteos.'),(16,'El consumo de calcio se muestra como muy  bajo debido al excesivo consumo de proteína.  Se recomienda reducir el consumo de carne.'),(17,'El consumo de calcio se muestra como muy  bajo debido al alto consumo de proteína. Se  recomienda reducir el consumo de carne y  reemplazarlo por lácteos.'),(18,'El consumo de calcio se muestra como bajo  debido al alto consumo de proteína. Se  recomienda reducir el consumo de carne y  reemplazarlo por lácteos.'),(19,'Aun cuando el consumo de calcio se muestra  recomendable, Se recomienda controlar el  consumo de proteína reduciendo el consumo de  lácteos y carne'),(20,'El consumo de calcio se muestra muy bajo  debido al excesivo consumo de proteína. Se  recomienda reducir el consumo de carne y  reemplazarlo por lácteos.'),(21,'El consumo de calcio se muestra muy bajo  debido al alto consumo de proteína y sodio. Se  recomienda reducir el consumo de carne y  reemplazarlo por lácteos.'),(22,'El consumo de calcio se muestra bajo debido al  alto consumo de proteína y sodio. Se  recomienda reducir el consumo de carne.'),(23,'Aun cuando el consumo de calcio se muestra  recomendable, se recomienda controlar el  consumo de calcio, sodio y proteína reduciendo  el consumo de lácteos y la ingesta de sal.'),(24,'El consumo de calcio se muestra como muy  bajo debido al excesivo consumo de proteína.  Se recomienda reducir el consumo de carne y  reemplazarlo por lácteos, así como reducir la  ingesta de sal.'),(25,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión. Es  fundamental reducir el consumo de sal y consumir más productos ricos en calcio como  los lácteos.'),(26,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión. Es  fundamental reducir el consumo de sal y  consumir más productos ricos en calcio como  los lácteos.'),(27,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión. Es  fundamental reducir el consumo de sal y  consumir más productos ricos en calcio como  los lácteos.'),(28,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión por  esto es fundamental reducir el consumo de sal.  Además esta elevado el consumo de proteína,  para esto se recomienda reducir el consumo de  carne y reemplazarlo por l'),(29,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión por  esto es fundamental reducir el consumo de sal.  Además esta elevado el consumo de proteína,  para esto se recomienda reducir el consumo de  carne.'),(30,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión por  esto es fundamental reducir el consumo de sal.  Además es excesivo el consumo de proteína,  para esto se recomienda reducir el consumo de  carne y reemplazarlo por lá'),(31,'Los consumos de sodio son excesivos lo que  aumenta el riesgo de sufrir hipertensión por  esto es fundamental reducir el consumo de sal.  Además es excesivo el consumo de proteína,  para esto se recomienda reducir el consumo de  carne.');
/*!40000 ALTER TABLE `nutricionApp_recomendacion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionApp_regla`
--

LOCK TABLES `nutricionApp_regla` WRITE;
/*!40000 ALTER TABLE `nutricionApp_regla` DISABLE KEYS */;
INSERT INTO `nutricionApp_regla` VALUES (13,'Potasio 1',38,'Los bajos niveles de consumo de magnesio empeoran la deficiencia de potasio. Por esto se recomiendan alimentos como arvejas, fríjoles, leche y banano.\r\n \r\n						'),(14,'Potasio 2',37,'Los bajos niveles de consumo de magnesio provocan niveles bajos en el potasio. Por esto se recomiendan alimentos como arvejas, fríjoles y leche.'),(15,'Potasio 3',36,'Pese a que el consumo de potasio se muestra recomendable se recomienda disminuirlo y cuidar los niveles de magnesio consumiendo alimentos como arvejas, fríjoles y leche.\r\n						'),(17,'Potasio 4',38,'Una deficiencia de magnesio empeora la deficiencia de potasio. Por esto se recomiendan alimentos ricos en ambos nutrientes como arvejas, fríjoles, leche, espinacas y banano.'),(18,'Potasio 5',37,'Los bajos niveles de potasio se deben a una deficiencia en el consumo de magnesio. Por esto se recomiendan alimentos como arvejas,fríjoles y leche.'),(19,'Potasio 6',36,'Pese a que el consumo de potasio se muestra recomendable se recomienda disminuirlo y cuidar los niveles de magnesio consumiendo alimentos como arvejas, fríjoles y leche.\r\n'),(20,'Sodio 1',45,'Pese a que el consumo de sodio se muestra recomendable se recomienda disminuirlo y mantener los niveles de potasio'),(21,'Sodio 2',45,'Pese a que el consumo de sodio se muestra recomendable se recomienda disminuirlo'),(22,'Calcio 1',51,'El consumo de calcio se muestra muy bajo debido al alto consumo de proteína se recomienda reducir el consumo de carne y reemplazarlo por lácteos. \r\n						 \r\n						 \r\n						'),(23,'Calcio 2',50,'El consumo de calcio se muestra como bajo debido al alto consumo de proteína se recomienda reducir el consumo de carne.\r\n \r\n						 \r\n						'),(24,'Calcio 3',49,'Aun cuando el consumo de calcio se muestra recomendable, se recomienda controlar el consumo de calcio y proteína reduciendo el consumo de lácteos.					 \r\n						 \r\n						'),(25,'Calcio 4',51,'El consumo de calcio se muestra como muy bajo debido al excesivo consumo de proteína. Se recomienda reducir el consumo de carne.\r\n \r\n						'),(26,'Calcio 5',51,'El consumo de calcio se muestra como muy bajo debido al alto consumo de proteína. Se recomienda reducir el consumo de carne y reemplazarlo por lácteos.					 \r\n						 \r\n						'),(27,'Calcio 6',50,'El consumo de calcio se muestra como bajo debido al alto consumo de proteína. Se recomienda reducir el consumo de carne y reemplazarlo por lácteos.\r\n \r\n						'),(28,'Calcio 7',49,'Aun cuando el consumo de calcio se muestra recomendable, Se recomienda controlar el consumo de proteína reduciendo el consumo de lácteos y carne.				 \r\n						'),(29,'Calcio 8',51,'El consumo de calcio se muestra muy bajo debido al excesivo consumo de proteína. Se recomienda reducir el consumo de carne y reemplazarlo por lácteos. \r\n						'),(30,'Calcio 9',51,'El consumo de calcio se muestra muy bajo debido al alto consumo de proteína y sodio. Se recomienda reducir el consumo de carne y reemplazarlo por lácteos. \r\n						'),(31,'Calcio 10',50,'El consumo de calcio se muestra bajo debido al alto consumo de proteína y sodio. Se recomienda reducir el consumo de carne. \r\n						'),(32,'Calcio 11',49,'Aun cuando el consumo de calcio se muestra recomendable, se recomienda controlar el consumo de calcio, sodio y proteína reduciendo el consumo de lácteos y la ingesta de sal. \r\n						'),(33,'Calcio 12',51,'El consumo de calcio se muestra como muy bajo debido al excesivo consumo de proteína. Se recomienda reducir el consumo de carne y reemplazarlo por lácteos, así como reducir la ingesta de sal.\r\n \r\n						'),(34,'Calcio 13',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión. Es fundamental reducir el consumo de sal y consumir más productos ricos en calcio como los lácteos. \r\n						 \r\n						'),(35,'Calcio 14',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión. Es fundamental reducir el consumo de sal y consumir más productos ricos en calcio como los lácteos. \r\n						'),(36,'Calcio 15',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión. Es fundamental reducir el consumo de sal y consumir más productos ricos en calcio como los lácteos.						'),(37,'Calcio 16',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión por esto es fundamental reducir el consumo de sal. Además esta elevado el consumo de proteína, para esto se recomienda reducir el consumo de carne y reemplazarlo por lácteos. \r\n						'),(38,'Calcio 17',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión por esto es fundamental reducir el consumo de sal. Además esta elevado el consumo de proteína, para esto se recomienda reducir el consumo de carne.\r\n \r\n						'),(39,'Calcio 18',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión por esto es fundamental reducir el consumo de sal. Además es excesivo el consumo de proteína, para esto se recomienda reducir el consumo de carne y reemplazarlo por lácteos. \r\n						 \r\n						'),(40,'Calcio 19',51,'Los consumos de sodio son excesivos lo que aumenta el riesgo de sufrir hipertensión por esto es fundamental reducir el consumo de sal. Además es excesivo el consumo de proteína, para esto se recomienda reducir el consumo de carne. \r\n						');
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

-- Dump completed on 2016-08-19 19:10:59
