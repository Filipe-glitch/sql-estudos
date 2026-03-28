delimiter $$
create function fn_ParImpar(numero int)
returns char(5) deterministic
begin
    declare tipo char(5) default 'impar';
    if numero mod 2 = 0 then
        set tipo = 'par';
    end if;
    return (tipo);
end $$
delimiter ;

select fn_ParImpar(10), fn_ParImpar(5); -- Como usar

delimiter $$
create function fn_CalculaIdade(nascimento date)
returns int deterministic
begin
    declare dataAtual date;
    declare idade int default 0;
    set dataAtual = curdate(); -- Pega a data de hoje
    set idade = year(dataAtual) - year(nascimento); -- Subtrai os anos
    return idade;
end $$
delimiter ;

select nomeFunc, fn_CalculaIdade(nascFunc) as idade from funcionario; -- Como usar

delimiter $$
create function fn_GerarAleatorio(inicio int, final int)
returns int deterministic
begin
    declare numero int default 0;
    set numero = (select floor(rand() * final) + inicio);
    return numero;
end $$
delimiter ;

