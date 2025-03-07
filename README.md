# MAVENMOVIES_RENTAL_BUSINESS_DA

#### Data analysis of movies CD/DVD rental (transactions) and inventory

# Maven Movies Data Analysis: Enhancing Insights for a Rental Business

## Project Overview:

#### This project analyzes a movie rental business's database to provide actionable insights for improving operations, marketing strategies, and inventory management. The dataset is hosted in the MAVENMOVIES database, and SQL was extensively used for exploratory data analysis (EDA), schema understanding, and answering business-critical ad-hoc queries.

## Project Objectives:

### Customer Insights:

#### Identify customer details (names, emails) for targeted marketing campaigns. Analyze customer rental patterns to improve customer engagement.

### Movie Inventory Analysis:

#### Explore the rental inventory and classify movies based on rental rates and availability. Provide recommendations for expanding the movie collection based on popularity and rental rates. Revenue Optimization:

Analyze rental rates to identify trends and the profitability of various pricing categories. Determine the most rented movie categories and ratings to maximize revenue.

### Operational Efficiency:

#### Help track and manage movie inventory effectively. Highlight gaps in the inventory and optimize stock levels.

## Tools & Library Used

![image](https://github.com/user-attachments/assets/dc671d71-6054-412f-b5a0-2c8500ad5c48)

## Project Result

[Click here to get full code](https://github.com/Abhilasha1103/MAVENMOVIES_RENTAL_BUSINESS_CODE/blob/main/MAVENMOVIES_RENTAL_BUSINESS_CODE.sql)


## Query Task

#### 1. "How can we extract the first name, last name, and email address of all customers to prepare a comprehensive contact list for the marketing team?"

![image](https://github.com/user-attachments/assets/0799f43f-b700-4283-94d6-96c2a7c57675)


#### 2. "What is the total number of movies in the inventory that are available for rent at the lowest rental rate of $0.99?"

![image](https://github.com/user-attachments/assets/9a660017-55ed-4213-939a-80d173d4831d)


#### 3. "How can we categorize all movies based on their rental rates and determine the count of movies in each category?"

![image](https://github.com/user-attachments/assets/1051c8d9-63e5-43de-8fdb-52f87bdab628)


#### 4. "Which movie rating (e.g., PG, PG-13, R) has the highest number of titles in the inventory, and how can this information help optimize inventory management?"

![image](https://github.com/user-attachments/assets/50ba5998-c184-441b-9aba-42a6774ed1d4)


#### 5. "What is the total count of PG-rated movies that have been rented, and what does this indicate about customer preferences?"

![prevalent store rating](https://github.com/user-attachments/assets/f6f00c3d-6930-4918-85e7-a980e3061567)



#### 6. "Can you provide a list of films categorized by their genre, along with their language and film name?"

![image](https://github.com/user-attachments/assets/5ca9b5de-55bf-46b4-80ee-ad10b2e00ec6)


#### 7. "Can you provide a list of movies and the number of times each has been rented out?"

![image](https://github.com/user-attachments/assets/9e2c67bb-e4f7-4599-bcda-eb2f543af714)


#### 8. "What are the top 10 highest-grossing films, and how much revenue has each generated?"

![image](https://github.com/user-attachments/assets/3cd30e34-bf1a-40b6-b95a-d38cabf189f9)


#### 9. "Can we identify the store with the highest historical revenue, and how does it compare to others in the same region?"

![image](https://github.com/user-attachments/assets/a77eac87-16ed-47b8-9982-f3484c7db254)


#### 10. "How many movie rentals did we have in total each month over the past year?"

![image](https://github.com/user-attachments/assets/cb4a3e99-3258-4946-87b7-adb60c7c5e0a)


#### 11. "How do we determine the rewards for users who have rented 30 or more times, and what details about their preferences should we consider?"

![image](https://github.com/user-attachments/assets/8b7261c4-611b-4b89-bc8f-f3d36f20a4e0)


#### 12. "Could you pull all payments from our first 100 customers (Based on customers id)"

![image](https://github.com/user-attachments/assets/1060bb91-2dcf-4cd3-966d-5981a01ed9d2)


#### 13. Now I’d love to see just payments over $5 for those same customers, since January 1, 2006"

![image](https://github.com/user-attachments/assets/c7889a32-488a-460d-9426-14dae31e3147)


#### 14. Now, could you please write a query to pull all payments from those specific customers, along with payments over $5, from any customer?"

![image](https://github.com/user-attachments/assets/31fc2d2c-6d0e-452b-b185-5fd1ba81f688)


#### 15. "We need to understand the special features in our films. Could you pull a list of films which include a Behind the Scenes special feature?"

![image](https://github.com/user-attachments/assets/a75ee615-6708-4398-93e1-0982e736db7a)


#### 16. "Which customer qualifies as the top spender, and what rewards or points should we offer them?"

![image](https://github.com/user-attachments/assets/ee0b4313-13ad-4ad6-af04-f9ed308f21ab)

#### 17. "Could you please pull a count of titles sliced by rental duration?"

![image](https://github.com/user-attachments/assets/ed62ea94-40ea-4488-bda3-a70ff539fe30)

#### 18. "How do movie ratings and lengths correlate with rental demand (number of movies rented) across various rental periods?"

![image](https://github.com/user-attachments/assets/961a37d9-8cbb-4849-b1c9-91b28a9a0164)

#### 19. "I’m wondering if we charge more for a rental when the replacement cost is higher. Can you help me pull a count of films, along with the average, min, and max rental rate, grouped by replacement cost?"

![image](https://github.com/user-attachments/assets/e85f74a5-3217-4789-819a-76333abd45b2)

#### 20. "Which movies should be recommended to individuals based on specific demographics like cultural background or interests?"

![image](https://github.com/user-attachments/assets/82e78585-28cf-490a-8d3d-31790fb2a62c)

#### 21. “I’d like to know which store each customer goes to, and whether or not they are active. Could you pull a list of first and last names of all customers, and label them as either ‘store 1 active’, ‘store 1 inactive’, ‘store 2 active’, or ‘store 2 inactive’?”

![image](https://github.com/user-attachments/assets/b643abb2-f1e0-49b1-85ae-4eb5f9665629)

#### 22. “Can you pull for me a list of each film we have in inventory? I would like to see the film’s title, description, and the store_id value associated with each item, and its inventory_id. Thanks!”

![image](https://github.com/user-attachments/assets/2d89828e-5753-4940-a6e2-89d79d9a548b)

#### 23. "Can you list the movies that [FIRST_NAME] [LAST_NAME] has been part of, and how many are there in total?"

![image](https://github.com/user-attachments/assets/fa37e814-7808-4a72-bc09-53b253c7f1c7)

#### 24. One of our investors is interested in the films we carry and how many actors are listed for each film title. Can you pull a list of all titles, and figure out how many actors are associated with each title?”

![image](https://github.com/user-attachments/assets/7c3bf1fd-6683-4473-8017-4c3638860bae)

#### 25. “Customers often ask which films their favorite actors appear in. It would be great to have a list of all actors, with each title that they appear in. Could you please pull that for me?”

![image](https://github.com/user-attachments/assets/3533f364-ffff-4a71-aa9b-f1773c544467)

#### 26. “The Manager from Store 2 is working on expanding our film collection there. Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?”

![image](https://github.com/user-attachments/assets/407f6f1a-58ef-4f89-b1b6-e83e9483a27e)

#### 27. We will be hosting a meeting with all of our staff and advisors soon. Could you pull one list of all staff and advisor names, and include a column noting whether they are a staff member or advisor? Thanks!”

![image](https://github.com/user-attachments/assets/82c7a0a3-9d1d-4cac-9d61-0b4c82e86d5b)

















