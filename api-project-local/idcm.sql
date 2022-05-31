-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para idcm
CREATE DATABASE IF NOT EXISTS `idcm` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `idcm`;

-- Copiando estrutura para tabela idcm.alert
CREATE TABLE IF NOT EXISTS `alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `fk_sensor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sensor` (`fk_sensor`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`fk_sensor`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.assinatura
CREATE TABLE IF NOT EXISTS `assinatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` enum('Anual','Bianual','Quinquenal') DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.metrica
CREATE TABLE IF NOT EXISTS `metrica` (
  `fk_sensor` int(11) DEFAULT NULL,
  `temperatura` float DEFAULT NULL,
  `umidade` float DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  KEY `fk_sensor` (`fk_sensor`),
  CONSTRAINT `metrica_ibfk_2` FOREIGN KEY (`fk_sensor`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.plano
CREATE TABLE IF NOT EXISTS `plano` (
  `fk_empresa` int(11) NOT NULL,
  `fk_assinatura` int(11) NOT NULL,
  `status_ass` int(11) DEFAULT NULL,
  `inicio` datetime DEFAULT current_timestamp(),
  `renovacao` datetime DEFAULT NULL,
  PRIMARY KEY (`fk_empresa`,`fk_assinatura`),
  KEY `fk_assinatura` (`fk_assinatura`),
  CONSTRAINT `plano_ibfk_1` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `plano_ibfk_2` FOREIGN KEY (`fk_assinatura`) REFERENCES `assinatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.sensor
CREATE TABLE IF NOT EXISTS `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fk_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sensor_and_empresa` (`fk_empresa`),
  CONSTRAINT `fk_sensor_and_empresa` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `imagem` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(25) DEFAULT NULL,
  `fk_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empresa` (`fk_empresa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
