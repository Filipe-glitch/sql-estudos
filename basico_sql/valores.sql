select database(); -- mostra a qual banco de dados está conectado
show tables;

select * from exemplo; -- consulta dados da tabela
select * from exemplo order by nome;
select * from exemplo where nome is null;
select * from exemplo order by id desc;

describe exemplo; -- mostra a estrutura da tabela

select * from usuario;
select * from usuario order by email;
select * from usuario where email is null;

describe usuario; 
drop table usuario; -- exclui a tabela usuario
drop database aula; 

