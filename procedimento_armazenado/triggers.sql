use aula;
show tables;
show triggers;
show triggers from aula;
show triggers from aula where 'table' = 'funcionario';
drop trigger nomeTrigger;



delimiter $$
create trigger trg_inclusao
after insert on funcionario
for each row
begin
    insert into auditoria values
    ('INSERT', new.matricula, null, new.salarioFunc, curdate());
end$$
delimiter ;

delimiter $$
create trigger trg_update
after update on funcionario
for each row
begin
    insert into auditoria values
    ('UPDATE', new.matricula, old.salarioFunc, new.salarioFunc, curdate());
end$$
delimiter ;

delimiter $$
create trigger trg_delete
after delete on funcionario
for each row
begin
    insert into auditoria values
    ('DELETE', old.matricula, old.salarioFunc, old.salarioFunc, curdate());
end$$
delimiter ;
