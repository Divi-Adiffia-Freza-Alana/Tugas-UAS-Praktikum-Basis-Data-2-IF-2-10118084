-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: 10118084_akademik
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `t_dosen`
--

DROP TABLE IF EXISTS `t_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dosen` (
  `nip` char(11) NOT NULL,
  `nama_dosen` varchar(30) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_telp` char(12) DEFAULT NULL,
  `alamat` text,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dosen`
--

LOCK TABLES `t_dosen` WRITE;
/*!40000 ALTER TABLE `t_dosen` DISABLE KEYS */;
INSERT INTO `t_dosen` VALUES ('19560701123','Ate','L','1956-07-01','083824123456','jl.ciwaruga no.12'),('19560701125','ilham','L','2020-08-12','083824123457','jl,ogah'),('19560701128','Tasya','P','2020-08-05','083824123460','ds.gabus');
/*!40000 ALTER TABLE `t_dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_jurusan`
--

DROP TABLE IF EXISTS `t_jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_jurusan` (
  `kode_jurusan` char(8) NOT NULL,
  `nama_jurusan` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_jurusan`
--

LOCK TABLES `t_jurusan` WRITE;
/*!40000 ALTER TABLE `t_jurusan` DISABLE KEYS */;
INSERT INTO `t_jurusan` VALUES ('IF 001','Teknik Informatika'),('SI 001','Sistem Informasi');
/*!40000 ALTER TABLE `t_jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mahasiswa`
--

DROP TABLE IF EXISTS `t_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mahasiswa` (
  `nim` char(8) NOT NULL,
  `nama_mhs` varchar(35) DEFAULT NULL,
  `jk` char(1) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_telp` char(15) DEFAULT NULL,
  `alamat` text,
  `kode_jurusan` char(8) NOT NULL,
  PRIMARY KEY (`nim`),
  KEY `kode_jurusan` (`kode_jurusan`),
  CONSTRAINT `t_mahasiswa_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `t_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mahasiswa`
--

LOCK TABLES `t_mahasiswa` WRITE;
/*!40000 ALTER TABLE `t_mahasiswa` DISABLE KEYS */;
INSERT INTO `t_mahasiswa` VALUES ('10118084','divi','L','2000-04-15','087828826848','jl.gabus','IF 001'),('10118085','reza','L','2020-08-13','083824123456','ds.omo','SI 001');
/*!40000 ALTER TABLE `t_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_matkul`
--

DROP TABLE IF EXISTS `t_matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_matkul` (
  `kode_mk` char(8) NOT NULL,
  `nama_mk` varchar(30) DEFAULT NULL,
  `sks` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`kode_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_matkul`
--

LOCK TABLES `t_matkul` WRITE;
/*!40000 ALTER TABLE `t_matkul` DISABLE KEYS */;
INSERT INTO `t_matkul` VALUES (' IN030','Basdat II',3,4),('IN 031','Si ',2,5),('IN 040','metnum',3,2),('IN 041','OR ',2,1),('IN 042','SO',2,3);
/*!40000 ALTER TABLE `t_matkul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_perkuliahan`
--

DROP TABLE IF EXISTS `t_perkuliahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_perkuliahan` (
  `id_perkuliahan` int NOT NULL AUTO_INCREMENT,
  `nim` char(8) NOT NULL,
  `kode_mk` char(8) NOT NULL,
  `nip` char(11) NOT NULL,
  `nilai` char(3) DEFAULT NULL,
  PRIMARY KEY (`id_perkuliahan`),
  KEY `nim` (`nim`),
  KEY `kode_mk` (`kode_mk`),
  KEY `nip` (`nip`),
  CONSTRAINT `t_perkuliahan_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `t_mahasiswa` (`nim`),
  CONSTRAINT `t_perkuliahan_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `t_matkul` (`kode_mk`),
  CONSTRAINT `t_perkuliahan_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `t_dosen` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_perkuliahan`
--

LOCK TABLES `t_perkuliahan` WRITE;
/*!40000 ALTER TABLE `t_perkuliahan` DISABLE KEYS */;
INSERT INTO `t_perkuliahan` VALUES (1,'10118084',' IN030','19560701123','80'),(5,'10118085','IN 040','19560701125','77');
/*!40000 ALTER TABLE `t_perkuliahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` enum('akademik','admin') NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'divi','akademik','akademik','akademik');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-18 21:48:15
