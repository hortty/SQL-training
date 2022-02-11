/* Database Class */
/* learning process */
DROP DATABASE IF EXISTS aula_banco; 
CREATE DATABASE aula_banco; 
USE aula_banco; 

CREATE TABLE estado( 
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)
);
CREATE TABLE cidade ( 
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

DESCRIBE estado;
INSERT INTO estado VALUES (NULL,'PARANÁ','PR', DEFAULT, DEFAULT);
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5);
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4);
INSERT INTO cidade (nome, estado_id, ativo) VALUES ('ITAJAÍ',4, 'N');

UPDATE estado SET nome = 'PARANA' WHERE id = 1;

UPDATE estado SET nome = 'PARANÁ' WHERE id = 1;

UPDATE estado SET nome = 'Paraná', ativo = 'S', data_cadastro = '2020-10-15' WHERE id = 1;

UPDATE estado SET data_cadastro = CURRENT_TIMESTAMP WHERE id = 1;

UPDATE estado SET nome = 'PARANÁ', data_cadastro = DEFAULT WHERE id = 1;

UPDATE estado SET nome = 'PARANA' WHERE id = 1; 
UPDATE estado SET nome = 'PARANA' WHERE nome = 'PARANÁ'; 
UPDATE estado SET nome = 'PARANA' WHERE sigla = 'PR'; 
UPDATE estado SET ativo = 'N' WHERE id = 3;

UPDATE cidade SET ativo = 'N' WHERE estado_id = 1;

DELETE FROM cidade WHERE id = 1;

DELETE FROM cidade WHERE estado_id = 1;

SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM estado;

UPDATE estado SET nome = 'PARANÁ' WHERE id=1;
SELECT * FROM estado;
UPDATE estado SET nome = 'PARANA' WHERE estado.nome = 'PARANÁ';
UPDATE estado SET ativo = 'S' WHERE id=4;
SELECT id FROM estado WHERE nome = 'PARANA';
UPDATE cidade SET ativo='N' WHERE id=15;
UPDATE cidade SET ativo='N' WHERE id=7;
UPDATE estado SET ativo='N' WHERE id=5;
UPDATE cidade SET
nome = 'MARINGÁ'
 , estado_id = 15
 , ativo = 'N'
 , data_cadastro = '2020-11-15'
WHERE id=97;

SELECT * FROM cidade;
SELECT * FROM cidade WHERE id=7;
DELETE FROM estado WHERE id=57;
DELETE FROM estado WHERE nome='PARANA';
DELETE FROM estado WHERE id=23;
DELETE FROM cidade WHERE cidade.id=23;
DELETE FROM estado WHERE id=23;
UPDATE estado SET sigla='pr' WHERE id=1;
UPDATE estado SET sigla='mt', ativo='S' WHERE nome='MATO GROSSO';
SELECT * FROM estado;
SELECT cidade.id, cidade.nome, cidade.estado_id, estado.nome, estado.id FROM cidade INNER JOIN estado WHERE cidade.estado_id = estado.id;
