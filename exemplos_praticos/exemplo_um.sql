
create table produto(
id int not null,
descricao varchar(100),
preco decimal(8,2));

insert into produto (id, descricao, preco)
values (1, 'smarphone xpto', 1510.99);

insert into produto values (2, 'notebook i9', 2855.99);
select * from produto;
select * from produto order by preco desc;

create table aluno (
    id int,
    nome varchar(100) not null,
    genero char(01),
    nascimento date,
    estadoCivil char(01) check (estadoCivil in ('C', 'S', 'V', 'O')),
    salario decimal(10,2) unsigned default 0,
    email varchar(120) unique
);
insert into aluno values (1, 'Helena Magalhães', 'F', '2000-01-01', 'C', 12500.99, 'helena.magalhaes@email.com'),
                         (2, 'Nicolas Oliveira', 'M', '2002-12-10', 'S', 8500, 'nicolas.oliveira@email.com'),
                         (3, 'Ana Rosa Silva', 'F', '1996-12-31', 'S', 8500, 'ana.rosa@email.com'),
                         (4, 'Tales Heitor Souza', 'M', '2000-10-01', 'O', 7689, 'tales.heitor@email.com'),
                         (5, 'Bia Meireles', 'F', '2002-03-14', 'O', 9450, 'bia.meireles@email.com'),
                         (6, 'Pedro Filho', 'M', null, 'V', 6800, 'pedro.filho@email.com'),
                         (7, 'Helena Soares', 'F', '1994-08-10', 'S', 8600, 'helena.soares@email.com');

select * from aluno where genero = 'F';
select * from aluno where genero = 'F' order by nascimento;
select * from aluno where nascimento = null order by nascimento;
select * from aluno where nascimento is null order by nascimento;
select * from aluno where salario is not null order by nascimento;

-- restrição de unique
insert into aluno values (8, 'Helena Magalhães Bandeira', 'F', '1995-10-01', 'S', 12400, 'helena.magalhaes@email.com');
-- Not null
insert into aluno values (8, null, 'F', '1995-10-01', 'S', 12400, 'testes@email.com');
-- check
insert into aluno values (8, 'Wilquison', 'M', '1995-10-01', 'X', 12400, 'testes@email.com');
-- default
insert into aluno (id, nome, genero, nascimento, estadoCivil, email) values (8, 'Wilquison', 'M', '1995-10-01', 'C', 'testes@email.com');
-- unsigned
insert into aluno (id, nome, genero, nascimento, estadoCivil, salario, email) values (8, 'Wilquison', 'M', '1995-10-01', 'C', -9000, 'testes@email.com');

alter table aluno
add telefone varchar(10);
select * from aluno

alter table aluno
add ddd int zerofill after email;

alter table aluno
modify celular varchar(12)

alter table aluno
add constraint pkAluno primary key(id);

create table estado(
id int not null primary key auto_increment,
nome varchar(100) not null );

insert into estado (id, nome) values (2, 'Mato Grosso');
select * from estado

create table cidade (
id int not null primary key auto_increment,
nome varchar(100) not null,
idEstado int,
constraint fkCidadeEstado foreign key (idEstado) references estado(id)
);

insert into cidade (nome, idEstado) values ('Salvador', 2);
insert into cidade (nome, idEstado) values ('Imperatriz', 2);
