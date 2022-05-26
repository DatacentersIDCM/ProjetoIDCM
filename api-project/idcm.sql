
-- Copiando estrutura do banco de dados para idcm
CREATE DATABASE IF NOT EXISTS `idcm`;
USE `idcm`;

-- Copiando estrutura para tabela idcm.assinatura
CREATE TABLE IF NOT EXISTS `assinatura` (
  `ID_Assinatura` int(11) NOT NULL AUTO_INCREMENT,
  `Plano` enum('Anual','Bianual','Quinquenal') NOT NULL,
  `Status_assinatura` tinyint(1) NOT NULL,
  `Inicio` date DEFAULT NULL,
  `Vencimento` date DEFAULT NULL,
  `FK_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Assinatura`),
  KEY `FK_empresa` (`FK_empresa`)

);

) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `ID_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_empresa` varchar(100) NOT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `CEP` varchar(20) DEFAULT NULL,
  `Endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Empresa`),
  UNIQUE KEY `CNPJ` (`CNPJ`)

);

) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.registro
CREATE TABLE IF NOT EXISTS `registro` (
  `ID_Registro` int(11) NOT NULL AUTO_INCREMENT,
  `Hora_registro` time NOT NULL,
  `Data_registro` date NOT NULL,
  `Valor_temperatura` float NOT NULL,
  `Valor_umidade` float NOT NULL,
  `FK_Sensor` int(11) NOT NULL,
  PRIMARY KEY (`ID_Registro`),
  KEY `FK_Sensor` (`FK_Sensor`)

);

) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.sensor
CREATE TABLE IF NOT EXISTS `sensor` (
  `ID_Sensor` int(11) NOT NULL AUTO_INCREMENT,
  `Localizacao` varchar(50) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Data_instalacao` date DEFAULT NULL,
  `Status_sensor` tinyint(1) DEFAULT NULL,
  `FK_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Sensor`),
  KEY `FK_Empresa` (`FK_Empresa`)

);

) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela idcm.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Sobrenome` varchar(100) DEFAULT NULL,
  `Telefone` varchar(100) DEFAULT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `Imagem` text,
  `Email` varchar(100) DEFAULT NULL,
  `Senha` varchar(25) DEFAULT NULL,
  `FK_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Telefone` (`Telefone`),
  UNIQUE KEY `Email` (`Email`),
  KEY `FK_Empresa` (`FK_Empresa`)
);
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
>>>>>>> bf26975886c0c3c31039b581420281d77a215259
