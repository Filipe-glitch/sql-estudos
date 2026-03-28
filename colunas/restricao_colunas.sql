select * from cliente;
select * from cidade;
select * from funcionario;
SHOW TABLES;

select nome, genero, salario from cliente
where salario >= 5000 and salario <= 8000;

select nome, salario, genero, cidadeId from cliente
where cidadeId between 1 and 4;

select nome, salario, genero, cidadeId from cliente
where cidadeId in (1,2,4);

select nome, salario, genero, cidadeId from cliente
where cidadeId = 1 or cidadeId = 2 or cidadeId = 4;

select * from cidade
where uf is not null;

select nome, salario from cliente
order by salario desc;

select nome from cliente
where nome like 'P%'; -- nomes que começam com 'p'

select nome from cliente
where nome like '%a'; -- nomes que terminar com 'a'

select count(*) as total_clientes from cliente; -- conta o total de clientes

select cidadeId, count(*) as total_clientes from cliente
group by cidadeId order by total_clientes desc;  -- qual cidade tem mais clientes

select nome, salario, email from cliente order by 3 asc;

select nome, salario from cliente 
where genero = 'F' order by nome desc, salario asc;

insert into funcionario (id, nome, cidadeid)
    select id, nome, cidadeid from cliente; -- copia dados de uma tabela para outra.
    
update cidade
set nome = 'Gramado', uf = 'RN'
where id = 2; -- altera um registro especifico.

delete from cidade where id = 4;
SET SQL_SAFE_UPDATE = 0; -- comando que permite que vc delete ou modifique todas as colunas.

update cidade 
set nome = 'teste'; -- com o comando de cima ativado, dá para modificar tudo de uma vez.

delete from cidade; -- deleta toda a tabela
truncate table cliente; -- deleta toda a tabela  
delete from cidade where uf = 'RS';

DELETE FROM cliente WHERE cidadeId IN (
    SELECT id FROM cidade WHERE uf = 'RS'
);  -- também precisa do comando
delete from cliente where nome = 'solange' and cidadeid = 3; -- comando também

