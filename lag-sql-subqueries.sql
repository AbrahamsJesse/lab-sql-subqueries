/*Before this starting this lab, you should have learnt about:

- SELECT, FROM, ORDER BY, LIMIT, WHERE, GROUP BY, and HAVING clauses. DISTINCT, AS keywords.
- Built-in SQL functions such as COUNT, MAX, MIN, AVG, ROUND, DATEDIFF, or DATE_FORMAT.
- JOIN to combine data from multiple tables.
- Subqueries*/

## Challenge

/*Write SQL queries to perform the following tasks using the Sakila database:*/
/*1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.*/

select film.film_id, film.title, count(copies.film_id) as number_of_copies
from sakila.film
inner join (
	select film_id
	from sakila.inventory
	where film_id = '439') as copies
on film.film_id = copies.film_id;






/*2. List all films whose length is longer than the average length of all the films in the Sakila database.*/

SELECT title, length
FROM sakila.film
WHERE length > (SELECT AVG(length) FROM sakila.film);


/*3. Use a subquery to display all actors who appear in the film "Alone Trip".*/

select film.title, actors.actor_id, actors.film_id
from sakila.film
left join
	(select *
    from sakila.film_actor) as actors
on film.film_id = actors.film_id
where film.title = 'Alone Trip';
