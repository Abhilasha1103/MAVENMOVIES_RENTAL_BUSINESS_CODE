-- DATA ANALYSIS PROJECT FOR RENTAL MOVIES BUSINESS
-- THE STEPS INVOLVED ARE EDA, UNDERSTANDING THR SCHEMA AND ANSWERING THE AD-HOC QUESTIONS
-- BUSINESS QUESTIONS LIKE EXPANDING MOVIES COLLECTION AND FETCHING EMAIL IDS FOR MARKETING ARE INCLUDED
-- HELPING COMPANY KEEP A TRACK OF INVENTORY AND HELP MANAGE IT.

USE MAVENMOVIES;

-- EXPLORATORY DATA ANALYSIS --

-- UNDERSTANDING THE SCHEMA --

SELECT * FROM RENTAL;

SELECT * FROM INVENTORY;

SELECT * FROM CUSTOMER;

SELECT * FROM FILM;

-- You need to provide customer firstname, lastname and email id to the marketing team --

SELECT first_name,last_name,email
FROM CUSTOMER;

-- How many movies are with rental rate of $0.99? --

SELECT COUNT(*) AS CHEAPEST_RENTALS
FROM film 
WHERE rental_rate = 0.99;

-- We want to see rental rate and how many movies are in each rental category --

SELECT rental_rate,count(*) as total_numb_of_movies
FROM film
group by rental_rate;

-- Which rating has the most films?

SELECT RATING,count(*) AS RATING_CATEGORY_COUNT
FROM film
group by RATING
ORDER BY RATING_CATEGORY_COUNT DESC;

-- Which rating is most prevalant in each store? 

SELECT INV.STORE_ID, F.RATING,count(*) AS TOTAL_FILMS
FROM INVENTORY AS INV LEFT JOIN
FILM AS F
ON INV.FILM_ID = F.FILM_ID
GROUP BY INV.STORE_ID, F.RATING
ORDER BY INV.STORE_ID,TOTAL_FILMS DESC;

-- List of films by Film Name, Category, Language 

SELECT F.TITLE,C.NAME AS CATEGORY_MOVIES,LANG.NAME AS MOVIE_LANGUAGE
FROM FILM AS F LEFT JOIN FILM_CATEGORY AS FC
ON F.FILM_ID = FC.FILM_ID LEFT JOIN CATEGORY AS C 
ON FC.CATEGORY_ID = C.CATEGORY_ID LEFT JOIN LANGUAGE AS LANG
ON F.LANGUAGE_ID = LANG.LANGUAGE_ID;

-- How many times each movie has been rented out?

SELECT F.TITLE,COUNT(*) AS POPULARITY 
FROM RENTAL AS R LEFT JOIN INVENTORY AS INV
ON R.INVENTORY_ID = INV.INVENTORY_ID LEFT JOIN FILM AS F 
ON INV.FILM_ID = F.FILM_ID
group by F.TITLE 
ORDER BY POPULARITY DESC;

-- REVENUE PER FILM (TOP 10 GROSSERS)

SELECT F.TITLE,SUM(P.AMOUNT) AS REVENUE 
FROM RENTAL AS R LEFT JOIN PAYMENT AS P
ON R.RENTAL_ID = P.RENTAL_ID LEFT JOIN INVENTORY AS INV
ON R.INVENTORY_ID = INV.INVENTORY_ID LEFT JOIN FILM AS F
ON INV.FILM_ID = F.FILM_ID
GROUP BY F.TITLE
ORDER BY REVENUE DESC
LIMIT 10;


-- Most Spending Customer so that we can send him/her rewards or debate points

SELECT C.CUSTOMER_ID,SUM(AMOUNT) AS SPENDING, C.FIRST_NAME, C.LAST_NAME
FROM PAYMENT AS P LEFT JOIN CUSTOMER AS C
ON P.CUSTOMER_ID = C.CUSTOMER_ID
group by C.CUSTOMER_ID
ORDER BY SPENDING DESC 
LIMIT 1;

-- Which Store has historically brought the most revenue?

SELECT S.STORE_ID,sum(P.AMOUNT) AS STORE_REVENUE
FROM PAYMENT AS P LEFT JOIN STAFF AS S 
ON P.STAFF_ID = S.STAFF_ID
GROUP BY S.STORE_ID;

-- How many rentals we have for each month

SELECT EXTRACT(YEAR FROM RENTAL_DATE),EXTRACT(MONTH FROM RENTAL_DATE) AS MONTH_,COUNT(RENTAL_ID) AS NUMBER_OF_RENTALS
FROM RENTAL
GROUP BY EXTRACT(YEAR FROM RENTAL_DATE),EXTRACT(MONTH FROM RENTAL_DATE);

-- Reward users who have rented at least 30 times (with details of customers)

SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL
FROM CUSTOMER
WHERE CUSTOMER_ID IN (SELECT C.CUSTOMER_ID
FROM (select CUSTOMER_ID,COUNT(RENTAL_ID) AS NUMBER_OF_TRANS
FROM RENTAL
GROUP BY CUSTOMER_ID
HAVING NUMBER_OF_TRANS > 30) AS C);

SELECT C.*
FROM (SELECT CUSTOMER_ID,COUNT(RENTAL_ID) AS NUMBER_OF_TRANS
FROM RENTAL
group by CUSTOMER_ID
HAVING NUMBER_OF_TRANS > 30) AS LC INNER JOIN CUSTOMER AS C
ON LC.CUSTOMER_ID = C.CUSTOMER_ID;


-- Could you pull all payments from our first 100 customers (based on customer ID)

SELECT *
FROM PAYMENT
WHERE CUSTOMER_ID BETWEEN 1 AND 100;

-- Now I’d love to see just payments over $5 for those same customers, since January 1, 2006

SELECT *
FROM PAYMENT
WHERE (CUSTOMER_ID BETWEEN 1 AND 100) AND AMOUNT > 5 AND PAYMENT_DATE > "2006-01-01";


-- Now, could you please write a query to pull all payments from those specific customers, along
-- with payments over $5, from any customer?

SELECT  *
FROM PAYMENT
WHERE AMOUNT > 5 AND CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM PAYMENT
    where (CUSTOMER_ID BETWEEN 1 AND 100) AND AMOUNT > 5 AND PAYMENT_DATE > "2006-01-01");
    
    
-- We need to understand the special features in our films. Could you pull a list of films which
-- include a Behind the Scenes special feature?

SELECT TITLE,SPECIAL_FEATURES
FROM FILM
WHERE SPECIAL_FEATURES LIKE "%Behind the Scenes%";

-- unique movie ratings and number of movies

SELECT RATING,COUNT(FILM_ID) AS NUMBER_OF_FILMS
FROM FILM
GROUP BY RATING
ORDER BY NUMBER_OF_FILMS DESC;


-- Could you please pull a count of titles sliced by rental duration?

SELECT RENTAL_DURATION,COUNT(FILM_ID) AS NUMBER_OF_FILMS
FROM  FILM
GROUP BY RENTAL_DURATION;

-- RATING, COUNT_MOVIES,LENGTH OF MOVIES AND COMPARE WITH RENTAL DURATION

SELECT RATING,
     COUNT(FILM_ID) AS COUNT_OF_FILMS,
     MIN(LENGTH) AS SHORTEST_FILM,
     MAX(LENGTH) AS LONGEST_FILM,
     AVG(LENGTH) AS AVERAGE_FILM_LENGTH,
     AVG(RENTAL_DURATION) AS AVERAGE_RENTAL_DURATION
FROM FILM
GROUP BY RATING
ORDER BY AVERAGE_FILM_LENGTH;


-- I’m wondering if we charge more for a rental when the replacement cost is higher.
-- Can you help me pull a count of films, along with the average, min, and max rental rate,
-- grouped by replacement cost?

SELECT REPLACEMENT_COST,
     COUNT(FILM_ID) AS NUMBER_OF_FILMS,
     MIN(RENTAL_RATE) AS CHEAPEST_RENTAL,
     MAX(RENTAL_RATE) AS EXPENSIVE_RENTAL,
     AVG(RENTAL_RATE) AS AVERAGE_RENTAL
FROM FILM
GROUP BY REPLACEMENT_COST
ORDER BY REPLACEMENT_COST;


-- “I’d like to talk to customers that have not rented much from us to understand if there is something
-- we could be doing better. Could you pull a list of customer_ids with less than 15 rentals all-time?”

SELECT CUSTOMER_ID,COUNT(*) AS TOTAL_RENTAL
FROM RENTAL
GROUP BY CUSTOMER_ID
HAVING TOTAL_RENTAL < 15;

-- “I’d like to see if our longest films also tend to be our most expensive rentals.
-- Could you pull me a list of all film titles along with their lengths and rental rates, and sort them
-- from longest to shortest?”

SELECT TITLE,LENGTH,RENTAL_RATE
FROM FILM
ORDER BY LENGTH DESC
LIMIT 20;


-- CATEGORIZE MOVIES AS PER LENGTH

SELECT TITLE,length,
    CASE
       WHEN LENGTH < 60 THEN 'UNDER 1 HR'
       WHEN LENGTH BETWEEN 60 AND 90 THEN '1 TO 1.5 HRS'
       WHEN LENGTH > 90 THEN 'OVER 1.5 HRS'
       ELSE 'ERROR'
       END AS LENGTH_BUCKET
FROM FILM;


-- CATEGORIZING MOVIES TO RECOMMEND VARIOUS AGE GROUPS AND DEMOGRAPHIC

SELECT DISTINCT TITLE,
     CASE
        WHEN RENTAL_DURATION <= 4 THEN 'RENTAL TOO SHORT'
        WHEN RENTAL_RATE >= 3.99 THEN 'TOO EXPENSIVE'
        WHEN RATING IN ('NC-17','R') THEN 'TOO ADULT'
        WHEN LENGTH NOT BETWEEN 60 AND 90 THEN 'TOO SHORT OR TOO LONG'
        WHEN DESCRIPTION LIKE '%SHARK%' THEN 'NO_NO_HAS_SHARKS'
        ELSE 'GREAT_RECOMMENDATION_FOR_CHILDREN'
        END AS FIT_FOR_RECOMMENDATION
FROM FILM;


-- “I’d like to know which store each customer goes to, and whether or
-- not they are active. Could you pull a list of first and last names of all customers, and
-- label them as either ‘store 1 active’, ‘store 1 inactive’, ‘store 2 active’, or ‘store 2 inactive’?”

SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,
     CASE
         WHEN STORE_ID = 1 AND ACTIVE = 1 THEN 'STORE 1 ACTIVE'
         WHEN STORE_ID = 1 AND ACTIVE = 0 THEN 'STORE 1 INACTIVE'
         WHEN STORE_ID = 2 AND ACTIVE =  1 THEN 'STORE 2 ACTIVE'
         WHEN STORE_ID = 2 AND ACTIVE = 0 THEN 'STORE 2 INACTIVE'
         ELSE 'ERROR'
END AS STORE_AND_STATUS
FROM CUSTOMER;


-- “Can you pull for me a list of each film we have in inventory?
-- I would like to see the film’s title, description, and the store_id value
-- associated with each item, and its inventory_id. Thanks!”

SELECT F.TITLE, F.DESCRIPTION, INV.STORE_ID, INV.INVENTORY_ID , F.FILM_ID
FROM FILM AS F INNER JOIN INVENTORY AS INV
ON F.FILM_ID = INV.FILM_ID;


-- Actor first_name, last_name and number of movies

SELECT AC.ACTOR_ID, AC.FIRST_NAME, AC.LAST_NAME, COUNT(FA.FILM_ID) AS NUMBER_OF_MOVIES
FROM ACTOR AS AC LEFT JOIN FILM_ACTOR AS FA
ON AC.ACTOR_ID = FA.ACTOR_ID
GROUP BY AC.ACTOR_ID
ORDER BY NUMBER_OF_MOVIES DESC;


-- “One of our investors is interested in the films we carry and how many actors are listed for each
-- film title. Can you pull a list of all titles, and figure out how many actors are
-- associated with each title?”

SELECT F.TITLE, COUNT(ACTOR_ID) AS NUMBER_OF_ACTORS
FROM FILM AS F LEFT JOIN FILM_ACTOR AS FA
ON F.FILM_ID = FA.FILM_ID 
GROUP BY F.TITLE
ORDER BY NUMBER_OF_ACTORS DESC;


-- “We will be hosting a meeting with all of our staff and advisors soon. Could you pull one list of all staff
-- and advisor names, and include a column noting whether they are a staff member or advisor? Thanks!”

(SELECT FIRST_NAME, LAST_NAME, "STAFF" AS DESIGNATION 
FROM STAFF
UNION
SELECT FIRST_NAME, LAST_NAME, "ADVISOR" AS DESIGNATION
FROM ADVISOR)

