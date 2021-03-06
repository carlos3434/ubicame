/*
SQLyog Ultimate v8.61 
MySQL - 5.5.49-0ubuntu0.14.04.1 : Database - ubicame
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ubicame` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ubicame`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`descripcion`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,'Otros',1,1,'2015-01-06 00:00:00',NULL,NULL);

/*Table structure for table `detalles_usuarios` */

DROP TABLE IF EXISTS `detalles_usuarios`;

CREATE TABLE `detalles_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `campo` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `du_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalles_usuarios` */

/*Table structure for table `logs_accesos` */

DROP TABLE IF EXISTS `logs_accesos`;

CREATE TABLE `logs_accesos` (
  `id` int(11) NOT NULL,
  `usuario_visita_id` int(11) NOT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logs_accesos` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`descripcion`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,'aéíóúÁÉÍÓÚÑñÁ..  ,, bueno',1,NULL,NULL,NULL,'2015-01-07 22:14:07'),(2,'rol2',0,NULL,NULL,NULL,NULL),(4,'probando nuevo',1,NULL,'2015-01-07 20:46:09',NULL,'2015-01-07 20:46:09'),(6,'ddtf',1,NULL,'2015-01-07 22:19:19',NULL,'2015-01-07 22:19:19'),(7,'new rol',1,NULL,'2015-01-08 03:31:58',NULL,'2015-01-08 03:31:58');

/*Table structure for table `tipos_accesos` */

DROP TABLE IF EXISTS `tipos_accesos`;

CREATE TABLE `tipos_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tipos_accesos` */

insert  into `tipos_accesos`(`id`,`descripcion`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,'Público',1,1,'2015-01-06 00:00:00',NULL,NULL),(2,'Privado',1,1,'2015-01-06 00:00:00',NULL,NULL);

/*Table structure for table `tipos_usuarios` */

DROP TABLE IF EXISTS `tipos_usuarios`;

CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tipos_usuarios` */

insert  into `tipos_usuarios`(`id`,`descripcion`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,'Regular',1,NULL,NULL,NULL,NULL),(2,'Empresa',1,NULL,NULL,NULL,NULL),(3,'Facebook',1,NULL,NULL,NULL,NULL),(4,'Google',1,NULL,NULL,NULL,NULL),(5,'Twiter',1,NULL,NULL,NULL,NULL);

/*Table structure for table `ubicaciones` */

DROP TABLE IF EXISTS `ubicaciones`;

CREATE TABLE `ubicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(8) NOT NULL COMMENT 'Código único de la dirección 8 caracteres alfanumérico',
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `tipo_acceso_id` int(11) NOT NULL,
  `x` varchar(50) DEFAULT NULL,
  `y` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `etiquetas` varchar(200) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `usuario_ubicacion_id` (`usuario_id`),
  KEY `tipo_acceso_id` (`tipo_acceso_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `ub_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ub_tipo_acceso_id` FOREIGN KEY (`tipo_acceso_id`) REFERENCES `tipos_accesos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ub_usuario_ubicacion_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ubicaciones` */

insert  into `ubicaciones`(`id`,`codigo`,`usuario_id`,`categoria_id`,`tipo_acceso_id`,`x`,`y`,`descripcion`,`etiquetas`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,'a6b7k90g',1,1,1,'-12.111943','-77.011509','Open Plaza','centro comercial, open plaza, surquillo',1,1,'2015-01-06 00:00:00',NULL,NULL);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `url_validacion` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuario_creacion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_usuario_id` (`tipo_usuario_id`),
  CONSTRAINT `u_tipo_usuario_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipos_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`tipo_usuario_id`,`email`,`password`,`remember_token`,`url_validacion`,`estado`,`usuario_creacion`,`created_at`,`usuario_modificacion`,`updated_at`) values (1,1,'j@g.com','$2y$10$0/Qet4nkobImsWSNmRof0O0F34cMXC3NluLiCzUvDtpV.iiGAy29m','',NULL,1,NULL,NULL,NULL,'2014-12-30 05:08:07'),(2,1,'jorgeshevchenk1@gmail.com','$2y$10$l/1ctynAwUnfGWo/ruHGiOtZBL.3lOIMCDp0GX7GT5ii37VQ727d6','',NULL,0,NULL,'2015-01-02 17:45:33',NULL,'2015-01-02 17:45:33'),(3,1,'jorgeshevchenk198@gmail.com','$2y$10$nVdrSqMsJekHeuXDuANnxet4XHCv8k3wzzmMtfajAF69MPVOzMfQy','',NULL,0,NULL,'2015-01-02 17:47:42',NULL,'2015-01-02 17:47:42'),(4,1,'jorgeshevchenk19@gmail.com','$2y$10$VqYG1.RXLP8a2zfOVBz9j.qFKRYpJHQSZtxlmcS3bFHw.vfbowmt2','',NULL,0,NULL,'2015-01-02 17:50:47',NULL,'2015-01-02 17:50:47'),(5,1,'jorgeshevchenk18@gmail.com','$2y$10$FxwbYKr6VmsCzOSTQ9pyVOrWGAA/ExT1A70quo.TpoqVFFXIAgwLG','',NULL,0,NULL,'2015-01-02 17:52:57',NULL,'2015-01-02 17:52:57'),(6,1,'sss','$2y$10$fMpm6kWAC5uemCRz67WyTuAoiFCU78T0aRsXJQt/M5xYd7pW4FsBi','',NULL,0,NULL,'2015-01-02 17:53:52',NULL,'2015-01-02 17:53:52'),(7,1,'3sdfsdf sdf','$2y$10$zXBoCmb/aS1kPqlxqcCngeWxrJYf1fHTOBPXF9d6hUE5gL5Wanbrq','',NULL,0,NULL,'2015-01-02 17:56:43',NULL,'2015-01-02 17:56:43'),(17,1,'pruebadsss','$2y$10$9Iv9VE7DuHsiLnntEMu3peClXOE7KLFWD3aZkynnfGIj0rOEk3S6m','Jgm9UhTT6B75X4AXD7PEx1C0BjULjWs8eJT2gqbC5msCSgKh1TT93fvg6WRY',NULL,1,NULL,'2015-01-02 18:38:30',NULL,'2015-01-02 18:38:55'),(18,1,'prueba','$2y$10$.erwoGlgLolfhKxTJ2/pD.SGik146Jy0Cz.X15Hmu6egkn6ktGAhK','44LBQtPddXEfLUaSU6DRQyhqZo018C33mYFT5QAkorsyoij4ycvXGJz6rwGT','$2y$10$eaQi7z59OgGN.1/uRueDZuobjaOd/kQcNtsmxxjoz/w28BfVPOKVe',1,NULL,'2015-01-02 20:25:20',NULL,'2015-01-07 15:07:46'),(25,1,'j@gmail.com','$2y$10$88Uplqp/jZ0kGOwH4TMy6uCth76IFUneCb4KLnjSRMhjJtPl0KsRu','AJNYjU97zcp7yCEli92ikGdT7M0SyACjBhSyU4b86ujiPUiEWwknjsYlUArI','$2y$10$nXIPTPUDmiL6cqLRZizr3uQJlzfJilExapD/CXXtrAl23RSdYJsA.',0,NULL,'2015-01-07 15:51:09',NULL,'2015-01-07 15:59:16'),(30,1,'jorgeshevchenk@gmail.com','$2y$10$wVdgPihnmadGmfitOZv3tO0gTjUybPuvSQ4bLz0rwRYRELz1FDUMi','vFsyvg2vBBPgMrdxNshTGUfyxOsArTkNoem8Lzo4xOr8CtCQSURUSPzwLmRm','$2y$10$djmczYpAMDRphQKjLGa.CuVngayQM31qJsQK2XUs/q3GzqLlzLATm',1,NULL,'2015-01-07 16:21:20',NULL,'2015-01-07 16:21:49'),(31,1,'jose.escalante@gmail.com','$2y$10$tZ0PQ246yg4hEKk9PVl3fe8Rbke15FH0.bcOUMn8UREtVuifCKF1m','euyCaTf4kMzFOpLPr3tjlfi9R7Grdjf0mFL13U3dPIDbNI0roTV8wtL6H3QR','$2y$10$eUYa9fIegWUdHOVJSTF31u.fdH1beIzo3IoM84JKT.AqMUTVG6WEi',1,NULL,'2015-01-07 22:17:33',NULL,'2015-01-07 22:18:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
