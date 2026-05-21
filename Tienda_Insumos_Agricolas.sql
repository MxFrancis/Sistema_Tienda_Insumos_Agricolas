-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: Tienda_Insumos_Agricolas
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `id_categoria` varchar(10) NOT NULL,
  `nombre` enum('fertilizantes','pesticidas','abonos orgánicos','semillas','materiales de siembra') DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES ('CAT01','fertilizantes'),('CAT02','pesticidas'),('CAT03','abonos orgánicos'),('CAT04','semillas'),('CAT05','materiales de siembra');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('1105556661','Juan','Perez','Loja Centro','0991234561'),('1105556662','Maria','Soto','San Sebastian',NULL),('1105556663','Carlos','Armijos','El Valle','0991234563'),('1105556664','Ana','Lucia','Malacatos',NULL),('1105556665','Luis','Medina','Vilcabamba','0991234565');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `ruc` varchar(13) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `contacto` varchar(10) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES ('0190055667001','BioSemillas Cuenca','074100555','Cuenca - Av. de las Américas'),('0990078912001','Agripac S.A.','042560333','Guayaquil - Av. 25 de Julio'),('1190012345001','AgroServicios Loja','072570111','Av. Universitaria y Azuay'),('1190034455001','FertiLoja','072585444','Sabanilla y Mercadillo'),('1790045678001','Pronaca Agro','022999222','Quito - Vía Sangolquí');
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa_Insumo`
--

DROP TABLE IF EXISTS `Empresa_Insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa_Insumo` (
  `ruc` varchar(13) NOT NULL,
  `id_insumo` varchar(10) NOT NULL,
  PRIMARY KEY (`ruc`,`id_insumo`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `Empresa_Insumo_ibfk_1` FOREIGN KEY (`ruc`) REFERENCES `Empresa` (`ruc`),
  CONSTRAINT `Empresa_Insumo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `Insumo_Agricola` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa_Insumo`
--

LOCK TABLES `Empresa_Insumo` WRITE;
/*!40000 ALTER TABLE `Empresa_Insumo` DISABLE KEYS */;
INSERT INTO `Empresa_Insumo` VALUES ('1190012345001','INS01'),('0990078912001','INS02'),('1190034455001','INS03'),('0190055667001','INS04'),('1190012345001','INS05');
/*!40000 ALTER TABLE `Empresa_Insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Factura` (
  `id_factura` varchar(10) NOT NULL,
  `fecha` date DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `id_pedido` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
INSERT INTO `Factura` VALUES ('FAC01','2026-05-10',NULL,'PED01'),('FAC02','2026-05-12',NULL,'PED02'),('FAC03','2026-05-14',NULL,'PED03'),('FAC04','2026-05-15',NULL,'PED04'),('FAC05','2026-05-16',NULL,'PED05');
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insumo_Agricola`
--

DROP TABLE IF EXISTS `Insumo_Agricola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insumo_Agricola` (
  `id_insumo` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `id_categoria` varchar(10) NOT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `Insumo_Agricola_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insumo_Agricola`
--

LOCK TABLES `Insumo_Agricola` WRITE;
/*!40000 ALTER TABLE `Insumo_Agricola` DISABLE KEYS */;
INSERT INTO `Insumo_Agricola` VALUES ('INS01','Urea Granulada 50kg',28.50,100,'2026-12-31','CAT01'),('INS02','Voliam Flexi (Insect.)',42.00,40,'2027-04-15','CAT02'),('INS03','Humus de Lombriz Saco',12.50,200,'2028-01-01','CAT03'),('INS04','Semilla Maíz Híbrido',55.00,30,'2026-11-20','CAT04'),('INS05','Bandejas de Germinación',3.50,500,NULL,'CAT05');
/*!40000 ALTER TABLE `Insumo_Agricola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `id_pedido` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `cantidad_producto` int unsigned NOT NULL,
  `cedula` varchar(10) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `cedula` (`cedula`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `Cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES ('PED01','pendiente',2,'1105556661'),('PED02','pagado',1,'1105556662'),('PED03','pendiente',5,'1105556663'),('PED04','pagado',10,'1105556664'),('PED05','pendiente',3,'1105556665');
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido_Insumo`
--

DROP TABLE IF EXISTS `Pedido_Insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido_Insumo` (
  `id_insumo` varchar(10) NOT NULL,
  `id_pedido` varchar(10) NOT NULL,
  PRIMARY KEY (`id_insumo`,`id_pedido`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `Pedido_Insumo_ibfk_1` FOREIGN KEY (`id_insumo`) REFERENCES `Insumo_Agricola` (`id_insumo`),
  CONSTRAINT `Pedido_Insumo_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido_Insumo`
--

LOCK TABLES `Pedido_Insumo` WRITE;
/*!40000 ALTER TABLE `Pedido_Insumo` DISABLE KEYS */;
INSERT INTO `Pedido_Insumo` VALUES ('INS01','PED01'),('INS02','PED02'),('INS04','PED03'),('INS05','PED04'),('INS03','PED05');
/*!40000 ALTER TABLE `Pedido_Insumo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21  1:46:50
