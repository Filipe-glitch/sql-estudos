show tables;
drop table cidade;
drop table cliente;
drop table vendas;

-- subquery
select nome, cidadeId from cliente 
where cidadeId = (select id from cidade where nomecidade = 'Curitiba');

select nome, cidadeId from cliente inner join cidade 
on cliente.cidadeid = cidade.id where nomecidade = 'Curitiba';

-- qual o cliente mais jovem?
select nome, genero, dataNascimento from cliente 
where dataNascimento = (select max(dataNascimento) from cliente);

-- quais clientes residem em Curitiba e Imperatriz?
select nome,cidadeId from cliente where cidadeId in (1,5); -- consulta com valores predefinidos

select nome, cidadeId from cliente where cidadeId -- consulta dinâmica
in (select id from cidade where nomeCidade = 'Curitiba' or nomeCidade = 'Imperatriz');

-- quais os clientes não residem em Curitiba ou Imperatriz?
select nome, cidadeId from cliente where cidadeId not in (1,5); 

-- existe clientes com renda superior a 11000? Se sim, quais clientes tem inferior a 7000?
select nome, genero, salario from cliente 
where salario < 7000 and exists (select * from cliente where salario > 11000); 

-- projetar o código, o nome e o gênero dos clientes que possuem 
-- o ‘id’ maior que o ‘id’ de QUALQUER cliente que já realizou alguma compra.
select id, nome, genero from cliente 
where id > any (select distinct clienteId from vendas);

-- projetar o código, o nome e o gênero dos clientes que possuem 
-- o ‘id’ maior que o ‘id’ de TODOS os clientes que já realizaram alguma compra.
select id, nome, genero from cliente 
where id > all (select distinct clienteId from vendas);

-- projetar o código, o nome, o gênero e o salário dos clientes que 
-- ganham um salário superior a outros clientes do mesmo gênero.
select id, nome, genero, salario from cliente c 
where salario > any (select salario from cliente where genero = c.genero);

-- quais cidades possuem clientes? simula intersect
select distinct cidadeId from cliente 
where cidadeId in (select id from cidade); 

-- quais cidades não possuem clientes cadastrados? simula except
select distinct id from cidade 
where id not in (select cidadeId from cliente);


