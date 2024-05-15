-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: daw2
-- ------------------------------------------------------
-- Server version	11.4.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`,`codigo_producto`),
  KEY `contiene` (`codigo_producto`),
  CONSTRAINT `contiene` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`),
  CONSTRAINT `referentea` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (3,1,4,3.00),(3,2,2,50.00),(3,3,2,3.00),(19,1,3,25.00),(19,2,1,12.00),(20,1,2,25.00),(20,2,1,12.00),(21,1,1,25.00),(22,2,2,12.00),(23,2,1,12.00),(24,2,1,12.00),(25,2,1,12.00),(26,2,1,12.00),(27,2,2,12.00),(27,3,1,45.00),(28,1,1,25.00),(28,2,6,12.00),(29,3,1,45.00),(30,1,1,25.00),(31,2,1,12.00),(32,2,1,12.00);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'pendiente'),(2,'cancelado'),(3,'enviado'),(4,'entregado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pedidopor` (`persona`),
  KEY `enestado` (`estado`),
  CONSTRAINT `enestado` FOREIGN KEY (`estado`) REFERENCES `estados` (`codigo`),
  CONSTRAINT `pedidopor` FOREIGN KEY (`persona`) REFERENCES `usuarios` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (3,2,'2020-12-21',20.20,3),(4,2,'2020-10-20',30.00,4),(5,2,'2022-12-29',82.00,2),(6,4,'2022-12-29',25.00,1),(7,4,'2022-12-29',25.00,1),(17,2,'2022-12-29',25.00,2),(18,2,'2022-12-29',25.00,2),(19,2,'2022-12-29',37.00,2),(20,2,'2022-12-29',37.00,2),(21,2,'2022-12-29',25.00,1),(22,2,'2022-12-29',12.00,2),(23,2,'2022-12-29',12.00,2),(24,2,'2022-12-29',12.00,1),(25,2,'2022-12-29',12.00,2),(26,2,'2022-12-29',12.00,2),(27,2,'2022-12-29',57.00,1),(28,2,'2022-12-29',37.00,1),(29,2,'2022-12-29',45.00,2),(30,2,'2022-12-29',25.00,1),(31,4,'2022-12-29',12.00,1),(32,4,'2022-12-29',12.00,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Sudadera 10',25.00,8,'image-7.svg'),(2,'Sudadera 2',12.00,10,'image-2.svg'),(3,'Sudadera 3',45.00,1,'image-6.svg'),(4,'Sudadera 4 ',24.95,1,'image-2.svg'),(5,'Sudadera 1 ',10.00,1,'image-5.svg'),(6,'Sudadera 5',100.00,3,'image-8.svg'),(7,'Sudadera 6',34.95,0,'image-2.svg'),(8,'Sudadera 7',20.90,1,'image-2.svg'),(9,'Sudadera 8',90.00,0,'image-6.svg'),(10,'Sudadera 9',24.29,1,'image-5.svg'),(11,'Sudadera 11',11.11,1,'image-6.svg'),(12,'Sudadera 12',29.00,0,'image-2.svg'),(13,'Sudadera 13',33.33,0,'image-2.svg'),(14,'Sudadera 14',22.22,0,'image-2.svg'),(15,'Sudadera 15',22.25,0,'image-2.svg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellidos` varchar(128) DEFAULT NULL,
  `domicilio` varchar(128) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `provincia` varchar(32) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,'jogigar2','JoanGiron123','Joan','Giron Garcia','C/ literatoAzorin 9/1','Xirivella','Valencia','12345','644611325'),(2,1,1,'123','123','Joan','Giron','C. Literato Azorin',NULL,NULL,'1234','123'),(3,1,1,'1234','1234','1234','1234','1234',NULL,'asdsad','1234','1234'),(4,1,1,'234','234','234','234','234',NULL,'asdsad','234','234'),(5,1,1,'345','345','345','345','345',NULL,'345','345','345'),(6,1,1,'Joan','Joan','Joan','Giron Garcia','Xirivella',NULL,'Xirivella','2345','5445432'),(7,1,1,'pepe','pepe','pepe','pipo','pupu',NULL,'pipi','1234','1234'),(9,1,1,'333','333','333','333','333',NULL,'333','333','333'),(10,1,1,'444','444','444','444','444',NULL,'444','444','444');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

--
-- Dumping routines for database 'daw2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 23:01:32
