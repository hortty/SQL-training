DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE banco;


DROP TABLE IF EXISTS providers;
CREATE TABLE providers(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
);
DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
);
DROP TABLE IF EXISTS products;
CREATE TABLE products(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,id_providers INT NOT NULL
,id_categories INT NOT NULL
,CONSTRAINT pk_products PRIMARY KEY(id)
,CONSTRAINT fk_providers FOREIGN KEY (id_providers) REFERENCES providers(id)
,CONSTRAINT fk_categories FOREIGN KEY (id_categories) REFERENCES categories(id)
);

INSERT INTO providers VALUES(NULL,'A');
INSERT INTO categories VALUES(6,'old stock');
INSERT INTO products VALUES(NULL,'two door',1,6);
INSERT INTO providers VALUES(NULL,'B');
INSERT INTO categories VALUES(4,'stock');
INSERT INTO products VALUES(NULL,'door',2,4);
INSERT INTO providers VALUES(NULL,'C');
INSERT INTO categories VALUES(3,'old');
INSERT INTO products VALUES(NULL,'two',3,3);

SELECT products.nome, providers.nome FROM products 
INNER JOIN providers ON products.id_providers = providers.id 
INNER JOIN categories ON products.id_categories = categories.id AND products.id_categories=4;

SELECT * FROM products;
SELECT * FROM providers;
SELECT * FROM categories;
