DROP DATABASE IF EXISTS my_database;

CREATE DATABASE my_database;

USE my_database;

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente(
id INT NOT NULL AUTO_INCREMENT									/* id auto incrementavel */
,nome VARCHAR(200) NOT NULL 
,cpf CHAR(14) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK (ativo IN ('S', 'N'))
,CONSTRAINT pk_cliente PRIMARY KEY (id)							/* definindo pk cliente */
);

DESCRIBE cliente;

INSERT INTO cliente(id,nome,cpf,ativo) VALUES (NULL,'Gabriel','99999999999999',DEFAULT);
INSERT INTO cliente(id,nome,cpf,ativo) VALUES (NULL,'Gabriel','11111111111111','N');
INSERT INTO cliente(nome,cpf) VALUES ('Jose','88888888888888');
INSERT INTO cliente(nome,cpf, ativo) VALUES ('Jonas','55555555555555', 'N');
SELECT * FROM cliente;

DROP TABLE IF EXISTS conta;

CREATE TABLE conta(
id INT NOT NULL AUTO_INCREMENT
,numero INT NOT NULL UNIQUE
,id_cliente INT NOT NULL
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP					/* pegando horario do sistema */
,CONSTRAINT pk_conta PRIMARY KEY (id)							/* definindo pk conta */					
,CONSTRAINT fk_cliente_conta FOREIGN KEY (id_cliente) REFERENCES cliente(id)				/* definindo fk cliente */
);

INSERT INTO conta (numero,id_cliente) VALUES (110987,2);
INSERT INTO conta VALUES (NULL,0,2,DEFAULT);
INSERT INTO conta VALUES (NULL,1000,3,DEFAULT);
SELECT * FROM conta;

UPDATE conta SET numero = 99 WHERE id=2;										/* alguns updates e deletes sempre usando WHERE */
UPDATE cliente SET ativo = 'N' WHERE nome = 'Jose';
UPDATE cliente SET cpf = '99988877700' WHERE nome = 'Jose';
UPDATE cliente SET cpf = '00000000000' WHERE nome = 'Gabriel' AND ativo = 'N';
SELECT * FROM cliente;
SELECT * FROM conta;

DELETE FROM cliente WHERE id=1;	
DELETE FROM cliente WHERE nome='Jonas';
SELECT cliente.id, cliente.nome, cliente.cpf, cliente.ativo, conta.numero, conta.id_cliente FROM cliente INNER JOIN conta ON conta.id_cliente = cliente.id;

UPDATE cliente SET ativo = 'S' WHERE id=3;
SELECT * FROM cliente,conta WHERE conta.id_cliente = cliente.id;					/* Gabriel possui 2 contas */
