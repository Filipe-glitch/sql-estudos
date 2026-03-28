select * from funcionario;
select user, host from mysql.user; -- mostra todos os usuários

create user 'aluno@localhost' identified by '123'; -- cria usuário com senha 123
drop user 'aluno@localhost'; 
flush privileges; -- atualiza os privilégios
show grants for aluno@localhost; -- mostra os privilégios do usuário

show grants for 'aluno@localhost';

grant select, insert on aula. *to 'aluno@localhost'; -- dando permissões para o aluno
revoke select, insert on aula. *from 'aluno@localhost'; -- remove permissões

grant all privileges on *.* to aluno@localhost; -- atribuindo privilégios globais
revoke all, grant option from aluno@localhost; -- tirando todas as permissões do usuário

grant select, insert, update, delete on aula.* to aluno@localhost; 
show grants for aluno; -- atribuindo vários privilégios

revoke update on aula.* from aluno@localhost; -- precisamos estar no root