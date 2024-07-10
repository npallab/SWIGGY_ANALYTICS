
# Data Analysis of Swiggy's Scrapped Data 

This project focuses on practicing SQL analytics using a sample Restaurants table. The table stores various attributes related to restaurants, such as their location, name, average price, average ratings, and more. The purpose of this project is to provide a comprehensive set of SQL queries to practice and enhance SQL analytics skills.

The Restaurants table has the following structure:




## Table Schema


The Restaurants table has the following structure:


```bash

CREATE OR REPLACE TABLE Restaurants (
    ID INT PRIMARY KEY,
    Area VARCHAR(100),
    City VARCHAR(100),
    RestaurantName VARCHAR(100),
    AvgPrice DECIMAL(10, 2),
    AvgRatings DECIMAL(3, 2),
    TotalRatings INT,
    FoodType VARCHAR(255),
    Address VARCHAR(255),
    DeliveryTime INT
);
```
The following Business Questions have been answered : 
Here is a list of all the questions corresponding to the provided SQL queries:

1. **Find the restaurant with the highest average price.**

2. **Find the total number of restaurants in each city.**

3. **Find the restaurant with the lowest average rating.**

4. **List all restaurants in a specific city (e.g., 'Bangalore').**

5. **Calculate the average delivery time for all restaurants.**

6. **Find the total number of ratings for restaurants in each area.**

7. **Find the average price of restaurants for each food type.**

8. **Find the highest average rating for restaurants in each city.**

9. **Find the total number of restaurants that offer a specific food type (e.g., 'Indian').**

10. **Find restaurants with an average rating above 4.5.**

11. **Find restaurants with delivery times less than 30 minutes.**

12. **Find restaurants with an average price between 100 and 200.**

13. **Find restaurants located in 'Kolkata' area with a total rating of more than 1000.**

14. **List restaurants with the word 'Grill' in their name.**

15. **Find the top 5 highest-rated restaurants in each city.**

16. **Calculate the percentage of total ratings each restaurant has contributed.**

17. **Find the average delivery time for restaurants grouped by food type.**

18. **Find the total number of restaurants in each city with an average rating greater than 4.0.**

19. **Find the restaurant with the maximum and minimum average price in each area.**

20. **Find the names of restaurants that have an average price higher than the average price of all restaurants in the same city.**

21. **Find the names of restaurants that have an average price higher than the average price of all restaurants in the same city (alternative query).**

22. **List the cities where the number of restaurants is more than the average number of restaurants across all cities.**

23. **Find the restaurants that have the same average rating as any restaurant in 'Bangalore'.**

24. **Calculate the average and total ratings for restaurants grouped by city and food type.**

25. **Find the maximum and minimum delivery time for each food type.**

26. **List the average price and average ratings for restaurants in each area sorted by average price in descending order.**

27. **Find restaurants with an average price greater than the average price of all restaurants.**

28. **Find restaurants where the name contains the word 'Bistro' and the average rating is above 4.0.**

29. **List all restaurants that do not offer delivery and have an average rating above 3.5.**

30. **Find the top 3 most popular food types based on total ratings.**

31. **Find the total number of restaurants in each city that have an average rating higher than the city's overall average rating.**

These questions and queries can be used to practice and improve SQL analytics skills by working with the provided `Restaurants` table schema.



## Authors

- [@npallab](https://www.github.com/npallab)


## 🚀 About Me
I am a Risk Analytics Professional with : Certififcation in Machine Learning from IIT Roorkee, Certified Scrum Master, Black Belt in Six Six Sigma, PMP Trained. I have worked with Amazon in the past and currently working as a Senior Analyst in Payment Risk team in Airbnb.


## 🔗 Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/pallabnath/)


## 🛠 Skills
SQL,Python,C/C++,Machine Learning, Data Analytics, Project Management, Consulting, Risk Management


## Tech Stack

**Data Warehouse** Snowflake

**language** MYSQL

**Data Source** Kaggle

