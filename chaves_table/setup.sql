use aula;
show tables;
select * from cidade;

CREATE TABLE cidade(
    id INT primary key auto_increment, -- 1,2,3 e assim por diante automaticamente
    nome VARCHAR(100) not null,
    cepgeral int unsigned zerofill, -- unsigned não aceita números negativos
    -- zerofill: completa o número com zeros à esquerda quando ele é exibido.
    sigla CHAR(03) UNIQUE -- valor não pode repetir
);

INSERT INTO cidade(id, nome,cepgeral, sigla)
VALUES (1, 'Curitiba',82598, 'CWB');
INSERT INTO cidade(id, nome,cepgeral, sigla)
VALUES (2, 'Natal',65974, 'XSW');
insert into cidade (id, nome, cepgeral, ddd)
values(3, 'Salvador', 78654, 045);
insert into cidade (nome, cepgeral, ddd)
values('Rio de Janeiro', 78434, 022);
INSERT INTO cidade (nome, ddd)
VALUES ('Porto Alegre', '051'),('Cuiabá', '044');

CREATE TABLE cliente (
    id INT primary key auto_increment,
    nome VARCHAR(100),
    idcidade INT,
    CONSTRAINT fkclienteCidade -- nome da restrição(identificar regra)
        FOREIGN KEY (idcidade)
        REFERENCES cidade(id) -- cria relacionamento entre tabelas(chave estrangeira)
        -- cliente deve ter uma cidade que exista na tabela cidade
);

INSERT INTO cliente(nome, idcidade) VALUES ('Joao', 1);
INSERT INTO cliente(nome, idcidade) VALUES ('Joao', 10); -- erro proposital,cidade não existe
INSERT INTO cliente(nome, idcidade) VALUES ('Alex', 2);
INSERT INTO cliente(nome, idcidade) VALUES ('Cristian', 3);
insert into cliente(nome, idcidade) values ('Maria', 4), ('Ricardo', 5);

CREATE TABLE aluno(
    id INT PRIMARY KEY, -- não repete valor, não é NULL e identica cada linha da tabela
    nome VARCHAR(130) NOT NULL, -- campo obrigatório
    genero CHAR(01),
    estadoCivil CHAR(01) CHECK (estadoCivil IN ('S','C','V')), -- limita valores permitidos
    renda DECIMAL(10,2) DEFAULT 0 -- nenhum valor informado, será 0.
);

INSERT INTO aluno (id, nome, genero, estadoCivil, renda)
VALUES (1, 'Maria', 'F', 'C', 8000.99);
INSERT INTO aluno VALUES (2, 'Ana', 'F', 'C', 10000);
INSERT INTO cliente (nome, idcidade) VALUES ('Alex', 2), ('Maria', 3)
