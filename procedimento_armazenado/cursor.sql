delimiter $$ 
create procedure simulaReajuste() 
begin -- Variável para identificar o final do cursor 
  declare done boolean default false; 
  declare vnome varchar(100); 
  declare vsalario decimal(10, 2); 
  declare vnovoSalario decimal(10, 2); 
  declare vdepartamento int; 
  declare cursorFuncionario cursor for 
    select nomeFunc, departamento, salarioFunc 
       from funcionario; -- Altera o status da variável de fim do cursor 
  declare continue handler for not found set done = true; 
  open cursorFuncionario; 
  leCursor: loop 
    fetch cursorFuncionario into 
	  vnome, vdepartamento, vsalario; 
  if done then -- Testa se o cursor chegou ao final 
    leave leCursor; -- Sai do loop no final 
  end if; 
  if vdepartamento = 1 then 
    set vnovoSalario = vsalario * 1.10; 
  elseif vdepartamento = 2 then 
    set vnovoSalario = vsalario * 1.12; 
  else 
    set vnovoSalario = vsalario * 1.08; 
  end if; 
  insert into simulacao values( 
    vnome, vsalario, vnovoSalario); 
  end loop; 
  close cursorFuncionario; 
end $$ 
delimiter ; 