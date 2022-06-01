CREATE DATABASE IF NOT EXISTS `idcm`;
USE `idcm`;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.assinatura
CREATE TABLE IF NOT EXISTS `assinatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` enum('Anual','Bianual','Quinquenal') DEFAULT NULL,
  `duracao` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
);

-- Exportação de dados foi desmarcado.
CREATE TABLE IF NOT EXISTS `sensor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rack` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `fk_empresa` int DEFAULT NULL,
  PRIMARY KEY (`id`), FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`)
);
-- Copiando estrutura para tabela idcm.metrica
CREATE TABLE IF NOT EXISTS `metrica` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fk_sensor` int DEFAULT NULL,
  `temperatura` float DEFAULT NULL,
  `umidade` float DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
	FOREIGN KEY (`fk_sensor`) REFERENCES `sensor` (`id`)
);

-- Copiando estrutura para tabela idcm.alert
CREATE TABLE IF NOT EXISTS `alert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` int DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `fk_sensor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
	FOREIGN KEY (`fk_sensor`) REFERENCES `sensor` (`id`)
);

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.plano
CREATE TABLE IF NOT EXISTS `plano` (
  `fk_empresa` int NOT NULL,
  `fk_assinatura` int NOT NULL,
  `status_ass` int DEFAULT NULL,
  `inicio` datetime DEFAULT current_timestamp(),
  `renovacao` datetime DEFAULT NULL,
  PRIMARY KEY (`fk_empresa`,`fk_assinatura`),
	FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`),
	FOREIGN KEY (`fk_assinatura`) REFERENCES `assinatura` (`id`)
);

-- Copiando estrutura para tabela idcm.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cargo` int DEFAULT NULL,
  `imagem` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(25) DEFAULT NULL,
  `fk_empresa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
   FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id`)
);