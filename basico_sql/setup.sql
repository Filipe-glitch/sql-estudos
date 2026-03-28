create database if not exists aula; 
show databases; 
use aula; -- conecta ao banco de dados aula

create table exemplo (
    id int,
    nome varchar(100)
);

insert into exemplo (id, nome) values (1, 'ana');
insert into exemplo (id, nome) values (2, 'carlos');
insert into exemplo (id, nome) values (3, null);

create table usuario ( 
    id integer, 
    email varchar(100), 
    senha varchar(20)
);

insert into usuario (id, email, senha) values (1, 'ana@email.com', '123');
insert into usuario (id, email, senha) values (2, 'carlos@email.com', '456');
insert into usuario (id, email, senha) values (3, null, '789');