CREATE DATABASE delivery;
USE delivery; 
CREATE TABLE tipoProduto ( 
id INTEGER NOT NULL AUTO_INCREMENT, 
descricao VARCHAR(50) NULL, 
PRIMARY KEY(id) ); 
CREATE TABLE estado ( 
id INTEGER NOT NULL AUTO_INCREMENT, 
descricao VARCHAR(100) NULL, 
sigla CHAR(02) NULL, 
PRIMARY KEY(id) ); 
CREATE TABLE statusPedido ( 
id INTEGER NOT NULL AUTO_INCREMENT, 
descricao VARCHAR(30) NULL, 
PRIMARY KEY(id) ); 
CREATE TABLE usuario ( 
id INTEGER NOT NULL AUTO_INCREMENT, 
email VARCHAR(100) NULL, 
 senha VARCHAR(20) NULL, 
  PRIMARY KEY(id) ); 
 
CREATE TABLE produto ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  tipoProduto_id INTEGER NOT NULL, 
  descricao VARCHAR(100) NULL, 
  valorUnitario DECIMAL NULL, 
  estoque INTEGER NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(tipoProduto_id) REFERENCES tipoProduto(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE cidade ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  estado_id INTEGER NOT NULL, 
  descricao VARCHAR(150) NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(estado_id) REFERENCES estado(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE entregador ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  cidade_id INTEGER NOT NULL, 
  cnh INTEGER NULL, 
  nome VARCHAR(150) NULL, 
  endereco VARCHAR(150) NULL, 
  telefone VARCHAR(30) NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(cidade_id) REFERENCES cidade(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE cliente ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  usuario_id INTEGER NOT NULL, 
  cidade_id INTEGER NOT NULL, 
  nome VARCHAR(150) NULL, 
  dataNascimento DATE NULL, 
  genero CHAR(01) NULL, 
  telefone VARCHAR(30) NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(cidade_id) REFERENCES cidade(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(usuario_id) REFERENCES usuario(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE restaurante ( 
  id INTEGER NOT NULL AUTO_INCREMENT, cidade_id INTEGER NOT NULL, 
  razaoSocial VARCHAR(150) NULL, 
  nomeFantasia VARCHAR(150) NULL, 
  endereco VARCHAR(150) NULL, 
  telefone VARCHAR(30) NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(cidade_id) REFERENCES cidade(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE endereco ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  cliente_id INTEGER NOT NULL, 
  rua VARCHAR(100) NULL, 
  numeroImovel VARCHAR(10) NULL, 
  complemento VARCHAR(30) NULL, 
  bairro VARCHAR(50) NULL, 
  cep INTEGER NULL, 
  pontoReferencia VARCHAR(100) NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(cliente_id) REFERENCES cliente(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE funcionario ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  usuario_id INTEGER NOT NULL, 
  restaurante_id INTEGER NOT NULL, 
  cidade_id INTEGER NOT NULL, 
  nome VARCHAR(150) NULL, 
  endereco VARCHAR(100) NULL, 
  telefone VARCHAR(30) NULL, 
  dataAdmissao DATE NULL, 
  dataNascimento DATE NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(cidade_id) REFERENCES cidade(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(restaurante_id) REFERENCES restaurante(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(usuario_id) REFERENCES usuario(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE pedido ( 
  id INTEGER NOT NULL AUTO_INCREMENT, 
  statusPedido_id INTEGER NOT NULL, 
  restaurante_id INTEGER NOT NULL, 
  endereco_id INTEGER NOT NULL, 
  entregador_id INTEGER NOT NULL, 
  dataPedido DATE NULL, 
  totalPedido DECIMAL NULL, 
 PRIMARY KEY(id), 
  FOREIGN KEY(entregador_id) REFERENCES entregador(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(endereco_id) REFERENCES cliente(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(restaurante_id) REFERENCES restaurante(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(statusPedido_id) REFERENCES statusPedido(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
 
CREATE TABLE pedidoProduto ( 
  id INTEGER ZEROFILL NOT NULL, 
  pedido_id INTEGER NOT NULL, 
  produto_id INTEGER NOT NULL, 
  quantidadeProduto INTEGER NULL, 
  valorUnitario DECIMAL NULL, 
  desconto DECIMAL NULL, 
  PRIMARY KEY(id), 
  FOREIGN KEY(pedido_id) REFERENCES pedido(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY(produto_id) REFERENCES produto(id) 
      ON DELETE NO ACTION ON UPDATE NO ACTION ); 
