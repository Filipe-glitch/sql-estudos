-- formatação de dados textuais
select nome, length(nome), dataNascimento, 
length(dataNascimento), salario, length(salario) from cliente;

select nome, upper(nome) as 'maiúscula', lower(nome) as 'minuscula' from cliente;

select nome, length(nome), ltrim(nome), length(ltrim(nome)) from cliente;

select nome, length(nome), rtrim(nome), length(rtrim(nome)) from cliente;

select trim(nome), trim(both from nome), trim(leading from nome), 
trim(trailing from nome) from cliente;

-- extrair somente as 3 primeiras letras das placas dos veículos dos clientes:
select placaVeiculo, substring(placaVeiculo, 1, 3) from cliente; //// -- 1 forma
select placaVeiculo, substring(placaVeiculo from 1 for 3) from cliente; -- 2 forma
select placaVeiculo, substring(placaVeiculo, -2) from cliente;

select email, replace(email, '#', '@') from cliente;

select cast('2000-01-01' as date),  cast('1000.00' as decimal), cast('20:15' as time);

-- formatação de dados numéricos e temporais

select salario, round(salario), round(salario, 1),  round(salario, 2) from cliente;
select salario, truncate(salario,0), truncate(salario,1), truncate(salario, 2) from cliente; 

select mod(4, 2) as 'resto divisão', 4 div 2 as 'quociente';
select mod(5, 2) as 'resto divisão', 5 div 2 as 'quociente';
-- ou 
select mod(4, 2) as 'resto divisão', mod(5,2) as 'resto divisão', 
4 div 2 as 'quociente', 5 div 2 as 'quociente'; 

select curdate(); -- data atual
select curtime(); -- hora atual
select now();

select day('2030-12-31'), month('2030-12-31'), year('2030-12-31');
select dayname('2030-12-31'), monthname('2030-12-31');

select hour('12:00:10');
select minute('12:00:10');
select adddate('2030-12-31', interval 30 day); -- ou
select adddate('2030-12-31', interval 1 month);
select datediff('2035-12-31', '2032-12-31');

select now(), date(curdate()), date(now());
select dayname(curdate()), curdate(), 
day(curdate()), dayofweek(curdate()), dayofyear(curdate()), last_day(curdate());

select curdate(), now(), week(curdate()), weekday(now()), weekday(curdate());

select month(curdate()), monthname(curdate()), year(curdate());

select curdate(), adddate(curdate(), interval 31 day), adddate(curdate(), interval 1 month);

select curdate(), datediff('2022-01-01', curdate()), datediff(curdate(), '2022-01-01');

select curdate(), date_format(curdate(), '%w %m %y'), 
date_format('2022-01-01 20:15:00', '%h:%i:%s');

select timediff('2021-12-31 23:59:59.000001', '2021-12-30 01:01:01.000002'); 

select curtime(), time(curtime()), hour(curtime()), 
minute(curtime()), second(curtime()), microsecond(curtime());

select addtime('01:00:00.999999', '02:00:00.999998'); 
select timestamp('2003-12-31'); 
select timestamp('2003-12-31 12:00:00', '12:00:00');

select curdate(), curtime(), 
timestampadd(minute, 30, curdate()), 
timestampadd(week, 1, 'curtime()'); 

select time_format('100:00:00', '%h %k %h %i %l');