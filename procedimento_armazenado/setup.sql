use aula;

create table pessoa( 
nome varchar(50), 
email varchar(50)
); 

create index idxPessoa on pessoa(nome); -- banco, otimiza buscas pela coluna nome

INSERT INTO pessoa (nome, email) VALUES
('Anabel', 'anabel@email.com'),
('Luis Afonso', 'luisafonso@email.com'),
('Alais', 'alais@email.com'),
('João Pedro', 'joaopedro@email.com'),
('Marcos', 'marcos@email.com'),
('Ulisses', 'ulisses@email.com'),
('Amadeu', 'amadeu@email.com'),
('Vitoria', 'mvitoria@email.com'),
('Claudio', 'claudio@email.com'),
('Marcela', 'marcela@email.com'),
('Julia', 'julia@email.com'),
('Roberval', 'roberval@email.com'),
('Raiza', 'raiza@email.com'),
('Olavo', 'olavo@email.com'),
('Murilo', 'murilo@email.com'),
('Helena', 'melena@email.com'),
('Vitoria', 'vitoria@email.com'),
('Pedro', 'pedro@email.com'),
('Gabriela', 'gabriela@email.com'),
('Marilia', 'marilia@email.com'),
('Kevin', 'kevin@email.com');

CREATE TABLE funcionario (
    matricula INT PRIMARY KEY,
    nomeFunc VARCHAR(100),
    generoFunc CHAR(1),
    nascFunc DATE,
    salarioFunc DECIMAL(10,2),
    departamento INT,
    cargo INT,
    emailFunc VARCHAR(100),
    cidadeId INT
);

create index idxFuncionarioSalario on funcionario(salarioFunc);

create view mostraFuncionario as select nomeFunc as 'Nome', 
generoFunc as 'Genero', salarioFunc as 'Salario', 
emailFunc as 'Email' from funcionario; 

INSERT INTO funcionario VALUES
(1,'Ana Rosa Silva','F','1996-12-31',8500.00,1,1,'ana.rosa@email.com',1),
(2,'Tales Heitor Souza','M','2000-10-01',7689.00,1,2,'tales.heitor@email.com',1),
(3,'Bia Meireles','F','2002-03-14',9450.00,2,2,'bia.meireles@email.com',1),
(4,'Pedro Filho','M','1998-05-22',12340.00,3,3,'pedro.filho@email.com',2),
(5,'Camila Fialho','F','1989-03-15',10450.00,2,3,'camila.fialho@email.com',4),
(6,'Ulisses Frota','M','1997-06-30',12340.00,1,4,'ulisses.frota@email.com',7),
(7,'Leonardo Timbo','M','2001-07-02',7850.00,2,3,'leonardo.timbo@email.com',2),
(8,'Lucas Goes','M','2002-03-02',8834.00,3,4,'lucas.goes@email.com',5),
(9,'Sofia Lima','F','1999-12-23',9578.00,4,4,'sofia.lima@email.com',5),
(10,'Nicolas Figueira','M','1997-06-01',12340.00,3,2,'nicolas.figueira@email.com',3),
(11,'Helena Arcanjo','F','1998-11-20',6320.00,2,2,'helena.arcanjo@email.com',7);

create table auditoria( 
acao char(10), 
matricula int auto_increment, 
salarioAntigo decimal(10, 2), 
salarioNovo decimal(10, 2), 
dataOperacao date);

insert into funcionario (nomeFunc, salarioFunc)
values ('Filipe', 5000);
update funcionario set salarioFunc = 6000 where matricula = 1;
delete from funcionario where matricula = 1;
select * from auditoria;

create table cartela(
 concurso int,
 numero int);

create table simulacao( 
nome varchar(100), 
salario decimal(10, 2), 
novoSalario decimal(10, 2)); 