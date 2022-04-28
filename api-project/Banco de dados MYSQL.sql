CREATE DATABASE idcm;
USE idcm;


CREATE TABLE empresa (
  ID_Empresa INT PRIMARY KEY AUTO_INCREMENT,
  Nome_empresa varchar(100) NOT NULL,
  CNPJ varchar(20) UNIQUE NOT NULL,
  CEP varchar(20) NOT NULL,
  Endereco varchar(100)
);

CREATE TABLE assinatura (
  ID_Assinatura int PRIMARY KEY AUTO_INCREMENT,
  Plano enum('Anual','Bianual','Quinquenal') NOT NULL,
  Status_assinatura tinyint(1) NOT NULL,
  Inicio date DEFAULT NULL,
  Vencimento date DEFAULT NULL,
  FK_empresa int DEFAULT NULL,
  FOREIGN KEY (FK_empresa) REFERENCES empresa(ID_Empresa)
);

CREATE TABLE usuario (
  ID_Usuario int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Nome varchar(100) DEFAULT NULL,
  Sobrenome varchar(100),
  Telefone varchar(100) UNIQUE,
  Cargo varchar(100) DEFAULT NULL,
  Imagem text,
  Email varchar(100) UNIQUE DEFAULT NULL,
  Senha varchar(25) DEFAULT NULL,
  FK_Empresa int DEFAULT NULL,
  FOREIGN KEY (FK_Empresa) REFERENCES empresa(ID_Empresa)
);

CREATE TABLE sensor (
  ID_Sensor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Localizacao varchar(50) NOT NULL,
  Quantidade int NOT NULL,
  Data_instalacao date DEFAULT NULL,
  Status_sensor tinyint(1) DEFAULT NULL,
  FK_Empresa int DEFAULT NULL,
  FOREIGN KEY (FK_Empresa) REFERENCES empresa(ID_Empresa)
);

CREATE TABLE registro (
  ID_Registro int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Hora_registro time NOT NULL,
  Data_registro date NOT NULL,
  Valor_temperatura float NOT NULL,
  Valor_umidade float NOT NULL,
  FK_Sensor int NOT NULL,
    FOREIGN KEY (FK_Sensor) REFERENCES  sensor(ID_Sensor)
); 