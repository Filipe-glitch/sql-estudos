-- cálculo do novo salário + troca de nome da parte superior da tabela.
select nomeFunc 'Nome do Funcionário', 
salarioFunc as 'Salário atual', 
salarioFunc * 1.10 as 'Novo salário' from funcionario; 

-- esse alias não é para coluna, é para tabela(evitar escrever o nome da tabela toda hora)
select nomeFunc, nomeCidade from funcionario f 
inner join cidade c on f.cidadeID = c.id;

select * from funcionario limit 3; -- só retorna 3 primeiras linhas
select * from funcionario LIMIT 3, 2; -- só retorna 2 linhas a partir da quarta linha

-- projetar o nome dos clientes por ordem alfabética
select nome from cliente order by nome; -- sem distinct
select distinct nome from cliente order by nome; -- com distinct (remove valores duplicados)

-- projetar o nome e o e-mail dos clientes por ordem alfabética
select nome, email from cliente order by nome; 
select distinct nome, email from cliente order by nome; 

select nomeFunc, 
case 
	when sexoFunc = 'M' then 'Masculino' 
	when sexoFunc = 'F' then 'Feminino' 
	else 'outros'
end as 'Genero' from funcionario;

-- juntar resultados de duas consultas.
select nome, dataNascimento from cliente 
union select nomeFunc, NascFunc from funcionario;

select nome, dataNascimento, 'cliente' from cliente 
union all select nomeFunc, NascFunc, 'funcionario' 
from funcionario order by 1;
