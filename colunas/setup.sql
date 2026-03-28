use aula;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS funcionario;
show tables;

create table cliente(
    id int auto_increment,
    nome varchar(100),
    salario int,
    datanascimento date,
    email varchar(100),
    genero char(1),
    cidadeId int not null,
    constraint pkcliente primary key (id),
    constraint fkClienteCidade foreign key (cidadeid) references cidade(id)
        on delete no action on update no action
        -- evita que a cidade seja apagada caso tenha um cliente
);

insert into cliente (nome, salario, datanascimento, email, genero, cidadeId) values
('Pedro', 6000,'1995-05-10', 'pedro@email.com', 'M', 1),
('Ana', 4500, '1997-09-09', 'ana@email.com', 'F', 2),
('Carlos', 8000,'1999-05-11', 'carlos@email.com', 'M', 3),
('Julia', 7000,'1996-11-16', 'julia@email.com', 'F', 4),
('Marcos', 3000, '1985-09-20', 'marcos@email.com', 'M', 5);
insert into cliente values (10, 'maria', 10); -- não pode, pois id é autoincremento
insert into cliente (nome, cidadeid) values ('maria', 20); -- não existe a cidade
insert into cliente (nome, cidadeid) values ('pedro', 1); 
insert into cliente (nome, cidadeid) values ('nicolas', 2), ('helena', 1), ('solange', 3);

create table cidade (
id int, 
nome varchar(100) not null,  
uf char(02), 
constraint pkcidade primary key (id));

insert into cidade (id, nome, uf) values
(1, 'Rio de Janeiro', 'RJ'),
(2, 'São Paulo', 'SP'),
(3, 'Curitiba', 'PR'),
(4, 'Belo Horizonte', 'MG'),
(5, 'Salvador', null);
insert into cidade(id, nome, uf) values (6, 'begé', 'RS');
insert into cidade values (7, 'parnaíba', 'PI');
insert into cidade (id, nome) values (8, 'Imperatriz');
insert into cidade values (9, 'Canoas', 'RS');


create table funcionario (
   id int,
   nome varchar(100),
   cidadeId int not null,
   constraint fkFuncionarioCidade foreign key (cidadeid) references cidade(id)
      on delete cascade on update no action
      -- apaga a linhas da tabela filha e da pai
   );
   
