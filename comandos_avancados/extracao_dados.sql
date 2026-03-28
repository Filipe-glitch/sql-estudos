-- Quantos funcionários existem na tabela Funcionário? 
select count(*) from funcionario; -- todas as linhas devem ser contabilizadas
select count(generoFunc) from funcionario; -- linhas que apresentem valor(2 funcionario null)

-- há quantos funcionários do sexo masculino?
select count(*) from funcionario where generoFunc = 'm';

-- mostrar a soma dos salários de todos os funcionários
select sum(salarioFunc) from funcionario;

-- soma dos salários do departamento 1
select sum(salarioFunc) from funcionario where departamento = 1;

-- qual o menor salário entre todos os funcionários? E qual o funcionário mais velho?
select min(salarioFunc), min(NascFunc) from funcionario;

-- qual o maior salário entre todos os funcionários? E qual o funcionário mais novo?
select max(salarioFunc), max(NascFunc) from funcionario;

-- média salarial dos funcionários?
select avg(salarioFunc) from funcionario;

-- Quantos funcionários existem por departamento?
select departamento, count(*) from funcionario 
group by departamento order by departamento;

-- qual a média salarial por gênero?
select generoFunc, avg(salarioFunc) from funcionario 
group by generoFunc;

-- qual a média salarial por departamento?
select departamento, avg(salarioFunc), min(salarioFunc), 
max(salarioFunc) from funcionario group by departamento order by departamento;

-- qual funcionário recebe o maior salário?
select nomeFunc, max(salarioFunc) from funcionario; -- erro pois não tem o group by.
-- precisamos usar subquery
select nomeFunc, salarioFunc from funcionario
where salarioFunc = (select max(salarioFunc) from funcionario);

-- quantos departamentos possuem mais de dois funcionários? 
select departamento, count(*) from funcionario 
group by departamento having count(departamento);

-- departamentos que salários somados passam de 20000
select departamento, sum(salarioFunc) as 'soma dos salarios' from funcionario
group by departamento having sum(salarioFunc) > 20000 order by 2 desc;

-- soma dos salários de cada departamento
select departamento, sum(salarioFunc) from funcionario group by departamento;

-- quem recebe o menor salário
select nomeFunc, salarioFunc from funcionario
where salarioFunc = (select min(salarioFunc) from funcionario); 

-- funcionario mais novo da empresa
select min(nascFunc) from funcionario;
