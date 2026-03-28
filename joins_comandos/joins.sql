-- Quer somente dados relacionados corretamente.
select nomecidade, nomeEstado, sigla from cidade 
inner join estado on cidade. estadoID = estado.id;

-- faz exatamente o mesmo que o INNER JOIN.
select nomecidade, nomeEstado, sigla from cidade, estado 
where cidade.estadoID = estado.id;

--  Retorna todos os registros da tabela da esquerda.
select nomecidade, nomeEstado, sigla from cidade 
left join estado on cidade. EstadoID = estado.id;

-- Mostra apenas os registros que não têm correspondência.
select nomecidade, nomeEstado, sigla from cidade 
left join estado on cidade. EstadoID = estado.id 
where estado.id is null;

-- É o oposto do left join.
select nomecidade, nomeEstado, sigla from cidade 
right join estado on cidade. EstadoID = estado.id; 

-- mostra estados que não possuem cidade associada
select nomecidade, nomeEstado
from cidade
right join estado
on cidade.estadoID = estado.id
where cidade.id is null;

-- Retornar todos os registros das duas tabelas. MySQL não possui FULL JOIN.
select nomecidade, nomeEstado, sigla from cidade 
full join estado on cidade. EstadoID = estado.id; 

-- Full join usando union
select nomecidade, nomeEstado, sigla from cidade 
left join estado on cidade.EstadoID = estado.id 
union select nomecidade, nomeEstado, sigla from cidade 
right join estado on cidade.EstadoID = estado.id 
where cidade.EstadoID is null;

-- Combina todos os registros com todos.
select nomefunc, pergunta from pergunta 
cross join funcionario;

-- Usado quando uma tabela tem hierarquia.
select funcionario.nomefunc, gerente.nomeFunc ‘gerente’ 
from funcionario inner join funcionario as gerente 
on funcionario.gerente = gerente.matricula 
order by funcionario.nomefunc; 

-- junta funcionário, cidade e estado
select nomeFunc, nomecidade, nomeEstado from funcionario 
inner join cidade on funcionario.cidadeID = cidade.id 
inner join estado on cidade.EstadoID = estado.id 
order by nomeFunc;