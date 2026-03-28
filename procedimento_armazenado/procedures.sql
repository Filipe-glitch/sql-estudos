delimiter $$
create procedure geraCartela(
 nroInicial int,
 nroFinal int,
 nroConcurso int)
begin
 declare nroGerado int default 0;
 declare i int default 0;
 geraNumero: loop set nroGerado = (select floor(rand() * nroFinal) + nroInicial);
 if not exists (select * from cartela
 where numero = nroGerado) then
 insert into cartela values(nroConcurso, nroGerado);
 set i = i + 1;
 end if;
 if i < 6 then iterate geraNumero;
 end if;
 leave geraNumero;
 end loop geraNumero;
end $$

call geraCartela(1, 60, 200);
select * from cartela;

delimiter $$
create procedure geraCartelaWhile(nroInicial int, nroFinal int, nroConcurso int)
begin
    declare nroGerado int default 0;
    declare i int default 0;

    -- enquanto i for menor que 6, ele faz o sorteio
    while i < 6 do
        -- aqui gera o número aleatório
        set nroGerado = (select floor(rand() * nroFinal) + nroInicial);
        
        -- Verifica se o número já não foi gerado e grava na tabela
        if not exists (select * from cartela where numero = nroGerado) then
            insert into cartela values (nroConcurso, nroGerado);
            set i = i + 1; -- Incrementa o contador
        end if;
    end while; 
end $$
delimiter ;

delimiter $$
create procedure geraCartelaRepeat(nroInicial int, nroFinal int, nroConcurso int)
begin
    declare nroGerado int default 0;
    declare i int default 0;

    repeat
        -- Gera o número aleatório
        set nroGerado = (select floor(rand() * nroFinal) + nroInicial);
        
        -- Verifica se o número já não foi gerado e grava na tabela
        if not exists (select * from cartela where numero = nroGerado) then
            insert into cartela values (nroConcurso, nroGerado);
            set i = i + 1; -- Incrementa o contador
        end if;
        
    -- ATÊ QUE i seja maior que 5 (Ou seja, para no 6)
    until i > 5 
    end repeat;

end $$
delimiter ;