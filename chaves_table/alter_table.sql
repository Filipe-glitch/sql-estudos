-- esqueci o ddd
alter table cidade
add dddd char(05); -- adicionei o dddd mas supostamente era ddd(errei o nome)

alter table cidade
change dddd ddd char(05); -- agora quero alterar o char

alter table cidade
modify ddd char(03);

alter table cidade
drop cepgeral; -- removi a coluna cepgeral e todos os dados das cidades 

alter table cidade rename to cidades;
select * from cidades;
alter table cidades rename to cidade;

SELECT cliente.nome, cidade.nome
FROM cliente
JOIN cidade -- serve para juntar dados de duas ou mais tabelas com relação(chaves)
ON cliente.idcidade = cidade.id;
