/* 
2606 - Categorias
*/

SELECT products.id, products.name FROM products
INNER JOIN categories ON products.id_categories = categories.id AND categories.name LIKE 'super%';