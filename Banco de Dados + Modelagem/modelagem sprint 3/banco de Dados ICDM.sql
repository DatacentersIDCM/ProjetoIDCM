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
FK_Assinatura int,
foreign key (FK_Assinatura)
references Assinatura(ID_Assinatura)
);

insert into Empresa (Nome_empresa, CNPJ, CEP, Endereco, FK_Assinatura)
values ('C6 Bank','61.364.200/0001-18','04913-129', ' AV Paulista - Paulista, 133', 1),
	   ('Alpe', '11.161.200/0001-66', '04312-159', 'AV Aricanduva - Aricanduva, 181', 1),
	   ('Santander', '22.124.540/0001-44', '01113-553', 'AV Cantagalo - Carrão, 2498', 2),
	   ('Itau', '64.364.300/0001-14', '04911-226', 'AV Rebouças - Paulista, 5419', 3),
	   ('Safra', '62.444.220/0001-38', '03412-133', 'AV Estado - Centro, 1231', 4),
       ('Ambev', '44.945.370/0001-77', '14407-380', 'AV Paulista - Paulista, 51', 2),
	   ('Vivo', '56.471.326/0001-51', '06711-450', 'AV Cantagalo - Carrão, 120', 2),
	   ('Natura', '69.289.357/0001-38', '12503-055', 'AV Republica - Republica, 46', 5),
       ('Magazine Luiza', '32.992.976/0001-84', "02226-290", 'AV Liberdade - Liberdade, 200', 3),
       ('Casas Bahia','87.396.779/0001-94', '15502-223', 'AV Republica - Republica, 128', 4);



create table Usuario(
ID_Usuario int primary key auto_increment,
Nome varchar (100),
Email varchar (100),
Telefone varchar (100),
Cargo varchar (100),
Imagem text (12000),
Login varchar (100),
Senha varchar (12),
FK_Empresa int,
foreign key (FK_Empresa)
references Empresa(ID_Empresa)
);

insert into Usuario (Nome, Email, Telefone, Cargo, Login, Senha, FK_Empresa) values
('Yasmin', 'yasmin.silva@gmail.com', '99564-8241','Gestora', 'YasMin', 'STXCAE145', 1),
('Jose', 'jose.alencar@gmail.com', '99124-1241','lider de equipe', 'josealncar', 'KaTa48', 1),
('Mario', 'mario.ribes@gmail.com', '99828-8241','Supervisor', 'MarioR', 'STAE145', 2),
('Davi', 'davi.gomes@gmail.com', '99683-8241','Gerente de infra-estrutura', 'daviG', 'fsAE145', 2),
('Renata','Renata.camillo@gmail.com', '995634-8241','Gestor', 'renataC', 'SdfE145', 3),
('Fabiano', 'fabio.front@gmail.com', '99664-6841','Lider de equipe', 'YasMin', 'S5145', 3),
('Antonio','antonio.vente@gmail.com', '99123-8242','Assistente', 'AnToNio43', 'sds545', 4),
('Nicky','niky.rosa@gmail.com', '99697-8789','Gerente de processo', 'NickY231', 'ok145', 4),
('Erick','erick.lorenzo@gmail.com', '993674-8241','Lider de equipes', 'EricK764', 'sdfsaqe', 5),
('Alice', 'alice.@gmail.com', '99974-8241','Gestora', 'Alice563', 'fdgsbd', 5),
('Geraldo', 'geraldo.roder@gmail.com', '99694-8241','Lider de equipe', 'GeraLdo', 'asfsaa', 6),
('Vinicios', 'vini.souza@gmail.com', '99774-6541','Assistente', 'ViNNISouza', 'aqrvvz', 6),
('Guilherme' , 'guilherme.hype@gmail.com', '9959-96441','Gestor', 'GuIHyyp', 'Sdssfg45', 7),
('Gustavo','gustavo.filho@gmail.com', '9999548-8241','Assistente', 'Gugustavo', 'StrE145', 7),
('Diana','diana.annabeth@gmail.com', '99564-8999','Gestora', 'Di@n@', '4weasdf', 8),
('Gwen' ,'grewn.silva@gmail.com', '99564-8241','Gestora', 'GwenAzul', 'STXCAE145', 9),
('Leonardo', 'leonardo.myles@gmail.com', '99774-8241','Assitente', 'LeoNardo', '54654E', 9),
('Sebastian', 'sebastian.romero@gmail.com', '99564-5551','Gestor', 'Sebastian', '4862E145', 10),
('Igor', 'igor.ferraz@gmail.com', '99564-4111','Assitente', 'FeRRazIgor', '5841145', 10);


create table Sensor(
ID_Sensor int primary key auto_increment,
Localizacao varchar (50) not null,
Quantidade int not null,
Data_instalacao date,
Status_sensor boolean,
FK_Empresa int,
foreign key FK_Empresa(FK_Empresa)
references Empresa(ID_Empresa)
);

insert into Sensor(Localizacao,Quantidade,Data_instalacao,Status_sensor, FK_Empresa)
values('Servidor 3','5','2022-02-18', false, 2),
('Servidor 4','4','2022-03-21',  true, 6),
('Servidor 7','3','2022-02-13',  true, 1),
('Servidor 3','1','2022-03-14',  true, 3),
('Servidor 1','1','2022-02-12',  true, 8),
('Servidor 7', 1, '2022-03-14',true, 9),
('Servidor 10 ', 1 , '2022-05-01',true, 10),
('Servidor 11', 5 , '2022-02-20',true, 7),
('Servidor 15' , 10 , '2022-10-31',false, 5),
('Servidor 20', 1 , '2022-09-09',true, 4);

create table Registro(
ID_Registro int primary key auto_increment,
Hora_registro time not null,
Data_registro  date,
Valor_temperatura float,
Valor_umidade float,
FK_Sensor int,
foreign key (FK_Sensor)
references Sensor(ID_Sensor)
);  
       
insert into Registro(Hora_registro,Data_registro,Valor_temperatura,Valor_umidade, FK_Sensor)
values  (132413,'2022-03-12','25.2','56', 2),
        (183414,'2022-03-12','28.3','45', 1),
        (211443,'2022-03-12','24.2','61', 3),
        (221526,'2022-03-12','25.2','51', 4),
        (235415,'2022-03-12','22.5','53', 5),
        (235416,'2022-03-12','19.5','53', 6),
        (235417,'2022-03-12','20.5','53', 7),
        (235418,'2022-03-12','17.5','53', 8),
        (235419,'2022-03-12','14.5','53', 9),
        (235410,'2022-03-12','30.5','53', 10);
       

select * from Empresa;
select * from Assinatura;
select * from Sensor;
select * from Registro;

desc Empresa;
desc Sensor;
desc Registro;
desc Assinatura;

#Select para a tabela Empresa
select ID_empresa from Empresa ;
select Nome_empresa from Empresa;
select * from Usuario;

select * from Usuario join Empresa on Usuario.FK_Empresa = Empresa.ID_Empresa;

select * from Empresa as E join Assinatura as A on A.ID_Assinatura = E.FK_Assinatura;

select * from Empresa as E join Sensor as S join Registro on E.ID_Empresa = S.FK_Empresa;

select * from Empresa as E join Assinatura as A join Sensor as S on A.ID_Assinatura = E.FK_Assinatura and E.ID_Empresa = S.FK_Empresa;

select * from Empresa as E join Assinatura as A join Sensor as S join Registro as R on A.ID_Assinatura = E.FK_Assinatura and E.ID_Empresa = S.FK_Empresa and S.ID_Sensor = R.FK_Sensor;

