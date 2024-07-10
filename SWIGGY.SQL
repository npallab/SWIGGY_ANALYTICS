CREATE  OR REPLACE TABLE Restaurants (
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

--Find the restaurant with the highest average price.

SELECT RESTAURANTNAME,AVGPRICE from SQL_PROJECT.PUBLIC.RESTAURANTS LIMIT 5;

--Find the total number of restaurants in each city.

SELECT COUNT(RESTAURANTNAME) AS RESTROCOUNT,CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY;

--Find the restaurant with the lowest average rating.

SELECT RESTAURANTNAME,AVGRATINGS FROM SQL_PROJECT.PUBLIC.RESTAURANTS ORDER BY AVGRATINGS ASC;

--List all restaurants in a specific city (e.g., 'San Francisco')

SELECT RESTAURANTNAME,CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS WHERE CITY='Bangalore';

--Calculate the average delivery time for all restaurants.

SELECT RESTAURANTNAME, AVG(DELIVERYTIME)as AVGTIME,FROM SQL_PROJECT.PUBLIC.RESTAURANTS 
GROUP BY RESTAURANTNAME
ORDER BY AVGTIME DESC;

--Find the total number of ratings for restaurants in each area
SELECT SUM(TOTALRATINGS) AS TOTALRATING,CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY;

--Find the average price of restaurants for each food type.
SELECT FOODTYPE,ROUND(AVG(AVGPRICE),2) as AVG_PRICE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY FOODTYPE
ORDER BY AVG_PRICE DESC;

--Find the highest average rating for restaurants in each city.
SELECT MAX(AVGRATINGS) AS MAXRATING,CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY;

--Find the total number of restaurants that offer a specific food type (e.g., 'Italian')
SELECT  COUNT(RESTAURANTNAME) FROM SQL_PROJECT.PUBLIC.RESTAURANTS 
WHERE FOODTYPE LIKE 'Indian%'

--Find restaurants with an average rating above 4.5.

SELECT RESTAURANTNAME,AVGRATINGS FROM SQL_PROJECT.PUBLIC.RESTAURANTS
WHERE AVGRATINGS >=4.5;

--Find restaurants with delivery times less than 30 minutes.

SELECT RESTAURANTNAME, DELIVERYTIME, CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS 
WHERE DELIVERYTIME <30
ORDER BY DELIVERYTIME DESC;

--Find restaurants with an average price between 100 and 200.

SELECT RESTAURANTNAME,AVGPRICE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
WHERE AVGPRICE BETWEEN 100 AND 200;

--Find restaurants located in 'Kolkata' area with a total rating of more than 1000.
SELECT RESTAURANTNAME,CITY,TOTALRATINGS FROM SQL_PROJECT.PUBLIC.RESTAURANTS
WHERE TOTALRATINGS>=1000 AND CITY='Kolkata'

--List restaurants with the word 'Grill' in their name.
SELECT * FROM SQL_PROJECT.PUBLIC.RESTAURANTS WHERE RESTAURANTNAME LIKE '%Grill%'

--Find the top 5 highest-rated restaurants in each city.

SELECT* FROM(SELECT City, RestaurantName, AvgRatings, DENSE_RANK() OVER (PARTITION BY City ORDER BY AvgRatings DESC) AS rn FROM Restaurants)
WHERE RN <=5;

--Calculate the percentage of total ratings each restaurant has contributed

SELECT R.RESTAURANTNAME,R.TOTALRATINGS, C.SUMRATING,(R.TOTALRATINGS/C.SUMRATING)*100 FROM SQL_PROJECT.PUBLIC.RESTAURANTS AS R CROSS JOIN (SELECT SUM(TOTALRATINGS) AS SUMRATING FROM SQL_PROJECT.PUBLIC.RESTAURANTS) AS C;

--Find the average delivery time for restaurants grouped by food type.
SELECT AVG(DELIVERYTIME),FOODTYPE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY FOODTYPE

--Find the total number of restaurants in each city with an average rating greater than 4.0
SELECT COUNT(CITY), CITY FROM(SELECT * from SQL_PROJECT.PUBLIC.RESTAURANTS WHERE AVGRATINGS>4)
GROUP BY CITY;

--Find the restaurant with the maximum and minimum average price in each area.
SELECT MAX(AVGPRICE),MIN(AVGPRICE),CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY;

--Find the names of restaurants that have an average price higher than the average price of all restaurants in the same city

SELECT RESTAURANTNAME, AVGPRICE FROM(SELECT *,AVG(AVGPRICE) OVER() AS AVG_PRICE FROM SQL_PROJECT.PUBLIC.RESTAURANTS) WHERE AVGPRICE>AVG_PRICE;

--Find the names of restaurants that have an average price higher than the average price of all restaurants in the same city

WITH AVG_CALC AS 
(
SELECT CITY,AVGPRICE, RESTAURANTNAME,AVG(AVGPRICE) OVER(PARTITION BY CITY) AS OVERALL_AVG FROM SQL_PROJECT.PUBLIC.RESTAURANTS
)
SELECT R.CITY,R.RESTAURANTNAME,R.AVGPRICE ,AVG_CALC.OVERALL_AVG from SQL_PROJECT.PUBLIC.RESTAURANTS as R JOIN AVG_CALC ON R.AVGPRICE>AVG_CALC.OVERALL_AVG

--List the cities where the number of restaurants is more than the average number of restaurants across all cities
SELECT COUNT(*) as COUNT_RESTRO,CITY FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY
HAVING COUNT_RESTRO > (SELECT COUNT(*)/COUNT(DISTINCT CITY) from SQL_PROJECT.PUBLIC.RESTAURANTS)

--Find the restaurants that have the same average rating as any restaurant in 'Bangalore'

SELECT RESTAURANTNAME, AVGRATINGS FROM SQL_PROJECT.PUBLIC.RESTAURANTS
WHERE AVGRATINGS IN ( SELECT AVGRATINGS FROM SQL_PROJECT.PUBLIC.RESTAURANTS WHERE CITY='Bangalore')

--Calculate the average and total ratings for restaurants grouped by city and food type.
SELECT  AVG(TOTALRATINGS),SUM(TOTALRATINGS),CITY,FOODTYPE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY CITY,FOODTYPE;

--Find the maximum and minimum delivery time for each food type.
SELECT  MAX(DELIVERYTIME),MIN(DELIVERYTIME),FOODTYPE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY FOODTYPE;

--List the average price and average ratings for restaurants in each area sorted by average price in descending order.

SELECT AVG(AVGPRICE) as  Average_price,AVG(AVGRATINGS) as Avg_rating, AREA FROM SQL_PROJECT.PUBLIC.RESTAURANTS
GROUP BY AREA
ORDER BY Average_price DESC;

--Find restaurants with an average price greater than the average price of all restaurants.
SELECT RESTAURANTNAME,AVGPRICE FROM SQL_PROJECT.PUBLIC.RESTAURANTS
WHERE AVGPRICE > (SELECT AVG(AVGPRICE) FROM SQL_PROJECT.PUBLIC.RESTAURANTS)

--Find restaurants where the name contains the word 'Bistro' and the average rating is above 4.0.

SELECT * FROM SQL_PROJECT.PUBLIC.RESTAURANTS WHERE RESTAURANTNAME LIKE '%Bistro%' AND AVGRATINGS > 4.0

--List all restaurants that do not offer delivery and have an average rating above 3.5.

SELECT * FROM SQL_PROJECT.PUBLIC.RESTAURANTS WHERE DELIVERYTIME IS NULL AND AVGRATINGS > 3.5


--Find the top 3 most popular food types based on total ratings.
SELECT * FROM
(SELECT FOODTYPE,TOTALRATINGS,DENSE_RANK() OVER(ORDER BY TOTALRATINGS) AS RANK FROM SQL_PROJECT.PUBLIC.RESTAURANTS)
WHERE RANK <=3;

--Find the total number of restaurants in each city that have an average rating higher than the city's overall average rating.
SELECT CITY,COUNT(*) AS COUNT_RESTRO_FIN FROM(
SELECT * FROM(
SELECT CITY,AVGRATINGS,AVG(AVGRATINGS) OVER() AS AVG_TOTAL FROM SQL_PROJECT.PUBLIC.RESTAURANTS )
WHERE AVGRATINGS>AVG_TOTAL )
GROUP BY CITY;