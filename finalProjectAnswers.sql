--1. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select UPPER(CONCAT(first_name, " ", last_name)) as `Actor Name`
from actor

--2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
SELECT actor_id, first_name, last_name
from actor
WHERE first_name LIKE "Joe%"

--3. Find all actors whose last name contain the letters GEN
SELECT actor_id, first_name, last_name, last_update
from actor
WHERE last_name LIKE "%GEN%"

--4. Find all actors whose last names contain the letters "LI". This time, order the rows by last name and first name, in that order.
SELECT actor_id, first_name, last_name, last_update
from actor
WHERE last_name LIKE "%LI%"
ORDER BY CONCAT(last_name, " ", first_name)

--5. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China
SELECT country_id, country.country
from country
WHERE country.country IN ("Afghanistan", "Bangladesh", "China")

--6. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(last_name) as "Count"
from actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2

--7. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record, and another to verify the change.

UPDATE actor
SET first_name = "HARPO" 
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

--8. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name
--of the actor is currently HARPO, change it to GROUCHO. Then write a query to
--verify your change.
UPDATE actor
SET first_name = "GROUCHO" 
WHERE first_name = "HARPO" AND last_name = "WILLIAMS";

--9. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
SELECT first_name, last_name, sum(amount) as Total
from staff
join payment on staff.staff_id = payment.staff_id
WHERE payment.payment_date LIKE "%2005-08%"
GROUP BY first_name

--10. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
SELECT title, Count(actor_id) as "NumberOfActors"
from film
INNER JOIN film_actor
on film.film_id = film_actor.film_id
GROUP BY title

--11. How many copies of the film Hunchback Impossible exist in the inventory system?
select title, COUNT(inventory.film_id) as number_in_inventory
from inventory
join film on inventory.film_id = film.film_id
WHERE title = "Hunchback impossible"

--12. . The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have
--also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT film.title 
from film
WHERE language_id in (SELECT language_id
from language 
WHERE name = "English")
AND
(title LIKE "K%") OR (title LIKE "Q%")

--13.Insert a record to represent Mary Smith renting the movie
--???Academy Dinosaur??? from Mike Hillyer at Store 1 today
insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 1, 1, 1);

--then write a query to capture the exact row you entered into the rental table

SELECT *
from rental
WHERE rental_id = 16050
