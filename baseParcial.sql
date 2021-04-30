-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para asistencialg4p2
CREATE DATABASE IF NOT EXISTS `asistencialg4p2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `asistencialg4p2`;

-- Volcando estructura para tabla asistencialg4p2.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sesion_id` int(11) unsigned NOT NULL,
  `estudiante_id` int(11) unsigned NOT NULL,
  `asistencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asistencia_estudiantes` (`estudiante_id`),
  KEY `FK_asistencia_sesiones` (`sesion_id`),
  CONSTRAINT `FK_asistencia_estudiantes` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_asistencia_sesiones` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla asistencialg4p2.asistencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;

-- Volcando estructura para tabla asistencialg4p2.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` int(100) unsigned NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `celular` varchar(250) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `semestre` int(100) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla asistencialg4p2.estudiantes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

-- Volcando estructura para tabla asistencialg4p2.estudiate_materia
CREATE TABLE IF NOT EXISTS `estudiate_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `materia_id` int(10) unsigned NOT NULL,
  `estudiante_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estudiate_materia_materias` (`materia_id`),
  KEY `FK_estudiate_materia_estudiantes` (`estudiante_id`),
  CONSTRAINT `FK_estudiate_materia_estudiantes` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_estudiate_materia_materias` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla asistencialg4p2.estudiate_materia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiate_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiate_materia` ENABLE KEYS */;

-- Volcando estructura para tabla asistencialg4p2.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `semestre` int(50) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla asistencialg4p2.materias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;

-- Volcando estructura para tabla asistencialg4p2.sesiones
CREATE TABLE IF NOT EXISTS `sesiones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `materia_id` int(11) unsigned NOT NULL,
  `fecha` varchar(222) NOT NULL,
  `hora_inicio` varchar(222) NOT NULL,
  `hora_final` varchar(222) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sesiones_materias` (`materia_id`),
  CONSTRAINT `FK_sesiones_materias` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla asistencialg4p2.sesiones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
