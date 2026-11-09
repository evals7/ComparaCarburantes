-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mi_practica_dam
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comparativa_precios`
--

DROP TABLE IF EXISTS `comparativa_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comparativa_precios` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `gasolinera` varchar(100) NOT NULL,
  `precio_litro` decimal(5,3) NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `comparativa_precios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_combustible` (`id_tipo`) ON DELETE CASCADE,
  CONSTRAINT `comparativa_precios_ibfk_2` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comparativa_precios`
--

LOCK TABLES `comparativa_precios` WRITE;
/*!40000 ALTER TABLE `comparativa_precios` DISABLE KEYS */;
INSERT INTO `comparativa_precios` VALUES (1,'Repsol Móstoles',1.612,'2026-11-02',1,1),(2,'Plenoil Alcorcón',1.499,'2026-11-02',1,2),(3,'Cepsa Sevilla',1.589,'2026-11-02',1,3),(4,'Petroprix Móstoles',1.459,'2026-11-02',1,1),(5,'Shell Móstoles',1.650,'2026-11-02',1,1);
/*!40000 ALTER TABLE `comparativa_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_combustible`
--

DROP TABLE IF EXISTS `tipos_combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_combustible` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_combustible`
--

LOCK TABLES `tipos_combustible` WRITE;
/*!40000 ALTER TABLE `tipos_combustible` DISABLE KEYS */;
INSERT INTO `tipos_combustible` VALUES (1,'Diesel'),(2,'Gasolina 95'),(3,'Gasolina 98');
/*!40000 ALTER TABLE `tipos_combustible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `comunidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `unique_geo` (`comunidad`,`provincia`,`localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (3,'Andalucía','Sevilla','Dos Hermanas'),(2,'Comunidad de Madrid','Madrid','Alcorcón'),(1,'Comunidad de Madrid','Madrid','Móstoles');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-02  9:23:12
