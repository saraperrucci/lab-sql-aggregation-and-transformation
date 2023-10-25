USE sakila;

-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT * FROM film;
SELECT MAX(length)  AS 'max_duration' FROM sakila.film;
SELECT MIN(length)  AS 'min_duration' FROM sakila.film;

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
SELECT * FROM film;
SELECT CONCAT(FLOOR(length/60),':',LPAD(MOD(length,60),2,'0')) AS 'movie_duration' FROM sakila.film;

-- 2.1 Calculate the number of days that the company has been operating.
SELECT * FROM rental 
ORDER BY rental_date ASC;

SELECT DATEDIFF('2006-02-14', '2005-05-24');

SELECT * FROM rental;
SELECT *, date_format(CONVERT(left(rental_date,10),date), '%M') 
AS 'month' 
FROM sakila.rental
LIMIT 20;

SELECT *, date_format(CONVERT(left(rental_date,10),date), '%D') 
AS 'day' 
FROM sakila.rental
LIMIT 20;

-- 2.3 BONUS
SELECT *,
       CASE
           WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
           ELSE 'workday'
       END AS DAY_TYPE
FROM sakila.rental;

-- 3
SELECT title, rental_duration 
FROM sakila.film;

SELECT IFNULL(rental_duration, 'Not Available') AS rental_duration, title
FROM sakila.film
ORDER BY title ASC;

-- CHALLENGE 2
-- 1.1 
SELECT * FROM sakila.film;

SELECT COUNT(*) AS total_films
FROM sakila.film;

SELECT COUNT(DISTINCT film_id) 
FROM sakila.film;

-- 1.2
SELECT DISTINCT rating 
FROM sakila.film;
SELECT COUNT(rating) as count, rating
FROM film
GROUP BY rating;

-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films.
SELECT DISTINCT rating 
FROM sakila.film;
SELECT COUNT(rating) as count, rating
FROM film
GROUP BY rating
ORDER BY count ASC;

-- 2.1
SELECT * FROM sakila.film;

SELECT rating, 
       ROUND(AVG(length), 2) AS mean_duration
FROM sakila.film
GROUP BY rating
ORDER BY mean_duration DESC;

-- 2.2
SELECT rating, 
       ROUND(AVG(length), 2) AS mean_duration
FROM sakila.film
GROUP BY rating
HAVING mean_duration > 120;

-- 3
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;