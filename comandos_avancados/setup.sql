use aula;

create table cidade (
    id int primary key,
    nomecidade varchar(100),
    uf CHAR(02)
);

CREATE TABLE cliente (
    id INT,
    nome VARCHAR(100),
    genero CHAR(1),
    dataNascimento DATE,
    placaVeiculo VARCHAR(10),
    salario DECIMAL(10,2),
    email varchar(100),
    cidadeId INT,
    CONSTRAINT pk_cliente PRIMARY KEY (id),
    constraint fk_cliente_cidade foreign key (cidadeId) references cidade(id)
);

create table vendas(
    numeroVenda int,
    dia DATE,
    clienteID int,
    valorCompras Decimal(10,2),
    constraint fk_vendas primary key (numeroVenda),
    constraint fk_vendas_cliente foreign key (clienteID) references cliente(id)
);

CREATE TABLE funcionario (
    matricula INT PRIMARY KEY,
    nomeFunc VARCHAR(100),
    generoFunc CHAR(1),
    nascFunc DATE,
    salarioFunc DECIMAL(10,2),
    departamento INT,
    cargo INT,
    cidadeId INT
);

INSERT INTO funcionario VALUES
(1,'Ana Rosa Silva','F','1996-12-31',8500.00,1,1,1),
(2,'Tales Heitor Souza','M','2000-10-01',7689.00,1,2,1),
(3,'Bia Meireles','F','2002-03-14',9450.00,1,2,2),
(4,'Pedro Filho','M','1998-05-22',12340.00,3,3,2),
(5,'Camila Fialho','F','1989-03-15',10450.00,2,3,4),
(6,'Ulisses Frota','M','1997-06-30',12340.00,1,4,7),
(7,'Leonardo Timbo',NULL,'2001-07-02',7850.00,2,3,2),
(8,'Lucas Goes','M','2002-03-02',8834.00,3,4,5),
(9,'Sofia Lima',NULL,'1999-12-23',9578.00,4,4,5),
(10,'Nicolas Figueira','M','1997-06-01',12340.00,3,2,3),
(11,'Helena Arcanjo','F','1998-11-20',6320.00,2,2,7);

insert into cidade values
(1,'Curitiba', 'PR'),
(2,'Bagé','RS'),
(3,'Parnaíba','PI'),
(4,'Videira','SC'),
(5,'Imperatriz','MA'),
(6,'Belo Horizonte','MG'),
(7, 'São Paulo', 'SP');

INSERT INTO cliente VALUES
(1,'Helena Magalhaes','F', '2000-01-01', 'ABC-1234', 12500.99,'helena#email.com', 2),
(2,'Nicolas Silva','M', '2002-12-10','bbc-4567',8500.00, 'nicolas#email.com',3),
(3,'Ana Rosa Silva','F', '1996-12-31', 'XPT-99541', 8500.00, 'ana.rosa@email.com',1),
(4,'Tales Heitor Souza','M', '2000-10-01','PFA-0836', 7689.00, 'tales#email.com',1),
(5,'Bia Meireles','F', '2002-03-14','qer-3809', 9450.00, 'bia.meireles@email.com',2),
(6,'Pedro Filho','M', '1998-05-22','MLQ-5408', 6800.00, 'pedro@email.com', 5),
(7,'Helena Magalhaes','F','1994-08-10', 'MLQ-4445',8600.00,'helena.maga#email.com', 4);

insert into vendas values
(1, '2022-02-10', 4, 1000.00),
(2, '2022-02-10', 2, 500.00),
(3, '2022-03-11', 3, 100.00),
(4, '2022-03-11', 2, 400.00),
(5, '2022-03-11', 3, 200.00);