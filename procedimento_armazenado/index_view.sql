select nome, email from pessoa where nome = 'Vitoria';

show index from pessoa; -- Isso mostra que o índice realmente existe.
select * from pessoa where nome = 'Vitoria';

select * from funcionario where salarioFunc > 5000; 

select * from mostraFuncionario order by Nome;

set autocommit = off; -- Desabilita o autocommit 
start transaction; -- Inicia a transação 
insert into funcionario values( 
12, 'Wilquison Fontes', 'M', '2001-04-01', 
9800, 3, 1, 'wilquison.fontes@email.com', 7); 
select * from funcionario where matricula = 12; -- Pausa 

rollback; -- Descarte 
select * from funcionario where matricula = 12; -- erro pois foi removido