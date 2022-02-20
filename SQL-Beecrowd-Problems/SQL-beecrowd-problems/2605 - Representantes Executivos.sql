/* 
2605 - Representantes Executivos
*/

SELECT products.name, providers.name FROM products 
INNER JOIN providers ON products.id_providers = providers.id 
INNER JOIN categories ON products.id_categories = categories.id AND products.id_categories=6;