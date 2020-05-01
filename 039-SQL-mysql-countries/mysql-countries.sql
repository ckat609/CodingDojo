SELECT countries.name, languages.language, languages.percentage FROM countries JOIN languages ON countries.id = languages.country_id WHERE language = "Slovene" ORDER BY languages.percentage DESC;

SELECT countries.name, COUNT(cities.name) from countries JOIN cities ON countries.id = cities.country_id GROUP BY countries.name ORDER BY COUNT(cities.name) DESC;

SELECT cities.name, cities.population FROM countries JOIN cities ON countries.id = cities.country_id WHERE countries.name = 'Mexico' AND cities.population > 500000 ORDER BY cities.population DESC;

SELECT c.name, l.language, l.percentage from countries AS c JOIN languages AS l ON c.id = l.country_id WHERE l.percentage > 89 ORDER BY l.percentage DESC;

SELECT name FROM countries WHERE surface_area < 501 AND population > 100000;

SELECT name, government_form, capital, life_expectancy FROM countries WHERE government_form = "Constitutional Monarchy" AND capital > 200 AND life_expectancy > 75;

SELECT countries.name, cities.name, cities.district, cities.population from countries JOIN cities ON countries.id = cities.country_id WHERE countries.name = "Argentina" AND cities.district = "Buenos Aires" and cities.population > 500000 ORDER BY cities.population DESC;

SELECT region, COUNT(name) AS num_countries FROM countries GROUP BY region ORDER BY num_countries DESC;