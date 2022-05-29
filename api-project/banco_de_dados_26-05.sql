
CREATE DATABASE idcm;
use idcm;

CREATE TABLE empresa(
id int primary key auto_increment,
nome varchar(45),
cnpj varchar(45) unique,
cep varchar(45),
endereco varchar(100)
);

CREATE TABLE usuario (
id int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
telefone varchar(45),
cargo int,
imagem text,
email varchar(100),
senha varchar(25),
fk_empresa int, foreign key (fk_empresa) references empresa(id)
);

CREATE TABLE assinatura(
id int primary key auto_increment,
nome enum('Anual','Bianual','Quinquenal'),
duracao int
);

CREATE TABLE plano (
fk_empresa int, foreign key (fk_empresa) references empresa(id),
fk_assinatura int, foreign key (fK_assinatura) references assinatura(id),
status_ass int,
inicio datetime default current_timestamp,
renovacao datetime,
primary key (fk_empresa, fk_assinatura)
);

CREATE TABLE sensor(
id int primary key auto_increment,
rack int,
status int
);

CREATE TABLE metrica (
fk_empresa int, foreign key (fk_empresa) references empresa(id),
fk_sensor int, foreign key (fk_sensor) references sensor(id),
temperatura float,
umidade float,
date_time datetime default current_timestamp
);


CREATE TABLE alert(
id int primary key auto_increment,
tipo int,
nome varchar(45),
valor float,
date_time datetime default current_timestamp,
fk_sensor int, foreign key (fk_sensor) references sensor(id)
);