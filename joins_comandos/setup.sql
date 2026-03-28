use aula;
show tables;
select * from funcionario;

create table estado (
    id int primary key,
    nomeEstado varchar(100),
    sigla char(2)
);

create table cidade (
    id int primary key,
    nomecidade varchar(100),
    estadoId int
);

create table pergunta (
    id int primary key,
    pergunta varchar(200)
);

create table funcionario (
    matricula int primary key,
    nomeFunc varchar(100),
    sexoFunc char(1),
    nascFunc date,
    salarioFunc decimal(10,2),
    departamento int,
    cargo int,
    gerente int,
    emailFunc varchar(100),
    cidadeId int
);

CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    genero CHAR(1),
    dataNascimento DATE,
    salario DECIMAL(10,2),
    email VARCHAR(100),
    cidadeId INT
);

INSERT INTO cliente VALUES
(1,'Helena Magalhaes','F','2000-01-01',12500.99,'helena@email.com',2),
(2,'Nicolas Silva','M','2002-12-10',8500.00,'nicolas.silva@email.com',3),
(3,'Silva Junior','M','1996-12-31',8500.00,'silva.junior@email.com',1),
(4,'Tales Silva Souza','M','2000-10-01',7689.00,'tales.souza@email.com',1),
(5,'Bia Meireles','F','2002-03-14',9450.00,'bia.meireles@email.com',2),
(6,'Pedro Filho','M','1998-05-22',6800.00,'pedro.filho@email.com',5),
(7,'Helena Magalhaes','F','1994-08-10',8600.00,'helena.magalhaes@email.com',4),
(8,'Sophia Arcanjo','F','1991-11-20',6320.00,'sophia.arcanjo@email.com',6);

insert into estado values
(1,'Paraná','PR'),
(2,'São Paulo','SP'),
(3,'Pernambuco','PE'),
(4,'Pará','PA'),
(5,'Rio Grande do Sul','RS');

insert into cidade values
(1,'Bagé',5),
(2,'Curitiba',1),
(3,'Recife',3),
(4,'São Paulo',null),
(5,'Porto Alegre',5),
(6,'Olinda',3);

insert into pergunta values
(1,'Qual a sua função?'),
(2,'Avalie a sua gerência:');

insert into funcionario values
(1,'Ana Rosa','F','1996-12-31',8500.00,1,1,null,'ana.rosa@email.com',1),
(2,'Tales Heitor','M','2000-10-01',7689.00,1,2,1,'tales.heitor@email.com',null),
(3,'Bia Meireles','F','2002-03-14',9450.00,1,2,1,'bia.meireles@email.com',2),
(4,'Pedro Filho','M','1998-05-22',6800.00,3,3,2,'pedro.filho@email.com',4),
(5,'Helena Magalhaes','F','2000-01-01',12500.99,4,5,2,'helena@email.com',6),
(6,'Nicolas Pinto','M','2002-12-10',8500.00,6,3,null,'nicolas.pinto@email.com',5);