create database IDCM;

use IDCM;


create table Assinatura(
ID_Assinatura int primary key auto_increment not null,
Plano enum ('Anual','Bianual','Quinquenal') not null,
Status_assinatura boolean not null,
Inicio date,
Vencimento date
);

  insert into Assinatura(Plano,Status_assinatura,Inicio,Vencimento)
  values ('Anual',true,'2022-03-12','2023-03-12'),
		('Bianual',false,'2022-02-16','2023-02-16'),
		('Bianual',false,'2022-02-22','2023-02-22'),
		('Quinquenal',true,'2022-01-04','2023-01-04'),
		('Quinquenal',true,'2022-01-09','2023-01-09'),
        ('Anual',true,'2022-03-15','2023-03-15'),
		('bianual',false,'2021-04-01','2023-04-01'),
		('quinquenal',true,'2022-10-23','2027-10-23'),
		('Anual',false,'2021-03-17','2022-03-17'),
		('bianual',true,'2022-05-01','2024-05-01');

create table Empresa(
ID_Empresa int primary key auto_increment not null,
Nome_empresa varchar(100) not null,
CNPJ varchar(18) not null,
CEP varchar(20), 
Endereco varchar(100) not null,
Representante varchar(80) not null,
Email varchar(200) not null,
Telefone varchar(20) not null,
Senha varchar(200) not null,
FK_Assinatura int,
foreign key (FK_Assinatura)
references Assinatura(ID_Assinatura)
);

create table Sensore(
ID_Sensor int primary key auto_increment,
Localizacao varchar (50) not null,
Quantidade int not null,
Data_instalacao date,
Status_sensor boolean,
FK_Empresa int,
foreign key FK_Empresa(FK_Empresa)
references Empresa(ID_Empresa)
);

create table Registro(
ID_Registro int primary key auto_increment,
Hora_registro time not null,
Data_registro  date,
Valor_temperatura float,
Valor_umidade float,
FK_Sensor int,
foreign key (FK_Sensor)
references Sensore(ID_Sensor)
);

insert into Empresa (Nome_empresa, CNPJ, CEP, Endereco, Representante, Email, Telefone, Senha, FK_Assinatura)
values ('C6 Bank','61.364.200/0001-18','04913-129', ' AV Paulista - Paulista, 133', 'Caio Messias Aguiar', 'caioc6Bank@c6bank.com', '11 95512-2121', 'csixbank', 1),
	   ('Alpe', '11.161.200/0001-66', '04312-159', 'AV Aricanduva - Aricanduva, 181', 'Joana Silva Soares', 'contatoalpe@alpe.com', '11 92522-2525', 'this1isAlpe', 1),
	   ('Santander', '22.124.540/0001-44', '01113-553', 'AV Cantagalo - Carrão, 2498', 'Jonas Malaquias Santos', 'Jonassantander@santander.com', '11 95311-5331', 's4ant4and3rr', 2),
	   ('Itau', '64.364.300/0001-14', '04911-226', 'AV Rebouças - Paulista, 5419', 'Angela Merkel Silva', 'angelaitatu_contato@itau.com', '11 95177-7521', 'itau2341', 3),
	   ('Safra', '62.444.220/0001-38', '03412-133', 'AV Estado - Centro, 1231', 'Paulo dos Anjos Oliveira', 'paulo_contatoSafra@safra.com', '11 96332-7513', '5afr4tradic4ao', 4),
       ('Ambev', '44.945.370/0001-77', '14407-380', 'AV Paulista - Paulista, 51', 'Marcio Lopes Santos', 'Marcio_sl@outloook.com', '16 2851-5316', 'Amb@ve', 2),
	   ('Vivo', '56.471.326/0001-51', '06711-450', 'AV Cantagalo - Carrão, 120', 'Alexandre Gomes Almeida', 'Alexandrego5a@gmail.com', '13 2854-7322', 'v1v0', 2),
	   ('Natura', '69.289.357/0001-38', '12503-055', 'AV Republica - Republica, 46', 'Jessica Dantas Leite', 'Jessicadl01@hotmail.com', '13 2848-9532', 'natura#01', 5),
       ('Magazine Luiza', '32.992.976/0001-84', "02226-290", 'AV Liberdade - Liberdade, 200', 'Isabela Motta', 'isabelamo10@outlook.com', '11 2099-5602', 'luizam@', 3),
       ('Casas Bahia','87.396.779/0001-94', '15502-223', 'AV Republica - Republica, 128', 'Carlos Santos Silva','carlos_ss@outlook.com', '19 3285-8408', 'bahia_@', 4);
  
       

insert into Sensore(Localizacao,Quantidade,Data_instalacao,Status_sensor, FK_Empresa)
values('Corredor 3','5','2022-02-18', false, 2),
('Corredor 4','4','2022-03-21',  true, 6),
('Corredor 7','3','2022-02-13',  true, 1),
('Servidor 3','1','2022-03-14',  true, 3),
('Servidor 1','1','2022-02-12',  true, 8),
('Servidor 7', 1, '2022-03-14',true, 9),
('Servidor 10 ', 1 , '2022-05-01',true, 10),
('Corredor 11', 5 , '2022-02-20',true, 7),
('Corredor 15' , 10 , '2022-10-31',false, 5),
('Servidor 20', 1 , '2022-09-09',true, 4);
       

insert into Registro(Hora_registro,Data_registro,Valor_temperatura,Valor_umidade, FK_Sensor)
values  (132413,'2022-03-12','25.2','56', 2),
        (183414,'2022-03-12','28.3','45', 1),
        (211443,'2022-03-12','24.2','61', 3),
        (221526,'2022-03-12','25.2','51', 4),
        (235411,'2022-03-12','25.5','53', 5);
       

select * from Empresa;
select * from Assinatura;
select * from Sensore;
select * from Registro;
desc Empresa;
desc Sensore;
desc Registro;
desc Assinatura;

#Select para a tabela Empresa
select ID_empresa from Empresa ;
select Nome_empresa from Empresa;
select Representante from Empresa;
select Nome_empresa, Representante from Empresa;

select * from Empresa as E join Assinatura as A on A.ID_Assinatura = E.FK_Assinatura;

select * from Empresa as E join Assinatura as A join Sensore as S join Registro as R on A.ID_Assinatura = E.FK_Assinatura and E.ID_Empresa = S.FK_Empresa and S.ID_Sensor = R.FK_Sensor;
