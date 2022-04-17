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
ID_Empresa int primary key auto_increment,
Nome_usuario varchar (100),
Email varchar (100),
Telefone varchar (100),
Nome_empresa varchar(100),
CNPJ varchar(18),
Cargo varchar (100),
FK_Assinatura int,
foreign key (FK_Assinatura)
references Assinatura(ID_Assinatura),
Imagem varchar(100),
Senha varchar (12)
);

insert into Empresa (Nome_usuario, Email, Telefone, Nome_empresa, CNPJ, Cargo, FK_Assinatura, Senha) values
('Yasmin', 'yasmin.silva@gmail.com', '99564-8241', 'C6 Bank','61.364.200/0001-18', 'Gestora', 1, 'STXCAE145'),
('Jose', 'jose.alencar@gmail.com', '99124-1241', 'Alpe', '11.161.200/0001-66', 'lider de equipe', 2, 'KaTa48'),
('Mario', 'mario.ribes@gmail.com', '99828-8241', 'Alpe', '11.161.200/0001-66', 'Supervisor', 2, 'STAE145'),
('Davi', 'davi.gomes@gmail.com', '99683-8241', 'C6 Bank','61.364.200/0001-18', 'Gerente de infra-estrutura', 1, 'fsAE145'),
('Renata','Renata.camillo@gmail.com', '995634-8241', 'Santander', '22.124.540/0001-44', 'Gestor', 3, 'SdfE145'),
('Fabiano', 'fabio.front@gmail.com', '99664-6841', 'Santander', '22.124.540/0001-44', 'Lider de equipe', 3, 'S5145'),
('Antonio','antonio.vente@gmail.com', '99123-8242', 'Itau', '64.364.300/0001-14','Assistente', 4, 'sds545'),
('Nicky','niky.rosa@gmail.com', '99697-8789', 'Itau', '64.364.300/0001-14','Gerente de processo', 4, 'ok145'),
('Erick','erick.lorenzo@gmail.com', '993674-8241', 'Safra', '62.444.220/0001-38','Gestor', 5, 'sdfsaqe'),
('Alice', 'alice.@gmail.com', '99974-8241', 'Safra', '62.444.220/0001-38','Lider de equipes', 5, 'fdgsbd'),
('Geraldo', 'geraldo.roder@gmail.com', '99694-8241', 'Ambev', '44.945.370/0001-77', 'Lider de equipe', 6, 'asfsaa'),
('Vinicios', 'vini.souza@gmail.com', '99774-6541', 'Ambev', '44.945.370/0001-77','Assistente', 6, 'aqrvvz'),
('Guilherme' , 'guilherme.hype@gmail.com', '9959-96441', 'Vivo', '56.471.326/0001-51','Gestor', 7, 'Sdssfg45'),
('Gustavo','gustavo.filho@gmail.com', '9999548-8241', 'Vivo', '56.471.326/0001-51','Assistente', 7, 'StrE145'),
('Diana','diana.annabeth@gmail.com', '99564-8999', 'Natura', '69.289.357/0001-38', 'Gestora', 8, '4weasdf'),
('Gwen' ,'grewn.silva@gmail.com', '99564-8241', 'Natura', '69.289.357/0001-38','Assistente', 8, 'STXCAE145'),
('Leonardo', 'leonardo.myles@gmail.com', '99774-8241', 'Magazine Luiza', '32.992.976/0001-84','Gestor', 9, '54654E'),
('Sebastian', 'sebastian.romero@gmail.com', '99564-5551', 'Magazine Luiza', '32.992.976/0001-84','Assistente', 9, '4862E145'),
('Igor', 'igor.ferraz@gmail.com', '99564-4111', 'Casas Bahia','87.396.779/0001-94','Gestor', 10, '5841145');


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

select * from Empresa as E join Assinatura as A on A.ID_Assinatura = E.FK_Assinatura;

select * from Empresa as E join Sensor as S join Registro on E.ID_Empresa = S.FK_Empresa;

select * from Empresa as E join Assinatura as A join Sensor as S on A.ID_Assinatura = E.FK_Assinatura and E.ID_Empresa = S.FK_Empresa;

select * from Empresa as E join Assinatura as A join Sensor as S join Registro as R on A.ID_Assinatura = E.FK_Assinatura and E.ID_Empresa = S.FK_Empresa and S.ID_Sensor = R.FK_Sensor;
