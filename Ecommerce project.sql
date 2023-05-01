# PROJECT ON  E-commerce- Users of a French C2C fashion store
# (C2C means customer to customer. It is a bussiness model whereby customers can trade with each other)


#1) Create Database ecommerce
CREATE DATABASE ecommerce;
USE ecommerce;


#2) The structure of the table-
DESC users_data;


#3) The first 100 rows of the database-
SELECT 
    *
FROM
    users_data
LIMIT 100;


#4) The number of distinct values for field country and language are-
SELECT 
    COUNT(DISTINCT country)  unique_country,
    COUNT(DISTINCT language) unique_language
FROM
    users_data;


#5) Lets check whether the male users are having maximum followers or female users.
SELECT 
    gender, SUM(socialNbFollowers) no_of_socialNbFollowers
FROM
    users_data
GROUP BY gender;
#Female follower=262458
#Male follower=77038
# So Female users have more followers than male users


#6) The total users who uses Profile Picture in their Profile are-
SELECT 
    COUNT(hasProfilePicture) total_count
FROM
    users_data
WHERE
    hasProfilePicture = 'True';
#97018 users uses profile picture in their profile 


#7) The total users who uses application for Ecommerce platform-
SELECT 
    COUNT(hasAnyApp) total_count
FROM
    users_data
WHERE
    hasAnyApp = 'True';
#26174 users uses application for Ecommerce platform


#8) The total users who uses android app for Ecommerce platform-
SELECT 
    COUNT(hasAndroidApp) total_count
FROM
    users_data
WHERE
    hasAndroidApp = 'True';
#4819 users uses android app for Ecommerce platform


#9) The total users who uses IOS app for Ecommerce platform
SELECT 
    COUNT(hasIosApp) total_count
FROM
    users_data
WHERE
    hasIosApp = 'True';
#21527 users uses IOS app for Ecommerce platform


#10) The total number of buyers for each country in descending order of total number of buyers.
SELECT 
    country, COUNT(productsBought) No_of_buyers
FROM
    users_data
WHERE
    productsBought > 0
GROUP BY country
ORDER BY No_of_buyers DESC;


#11) The total number of sellers for each country in ascending order of total number of sellers.
SELECT 
    country, COUNT(productsSold) No_of_sellers
FROM
    users_data
WHERE
    productsSold > 0
GROUP BY country
ORDER BY No_of_sellers;


#12) The name of top 10 countries having maximum products pass rate-
SELECT 
    country, MAX(productsPassRate) Product_pass_rate
FROM
    users_data
GROUP BY country
ORDER BY Product_pass_rate DESC
LIMIT 10;


#13) The number of users on an ecommerce platform for different language choices-
SELECT 
    language, COUNT(language) language_choices
FROM
    users_data
GROUP BY language;


#14) The choice of female users of putting the product in a wishlist or to like socially on an ecommerce platform- 
SELECT 
    'product_wishlisted', gender, COUNT(gender) choices
FROM
    users_data
WHERE
    productsWished > 0 AND gender = 'F' 
UNION SELECT 
    'product_liked', gender, COUNT(gender) choices
FROM
    users_data
WHERE
    socialProductsLiked > 0 AND gender = 'F';
    

#15) The choice of male and female users about being seller or buyer-
SELECT 
    'Buyer', gender, COUNT(productsBought) choices
FROM
    users_data
WHERE
    productsBought > 0 GROUP BY gender 
UNION SELECT 
    'Seller', gender, COUNT(productsSold) choices
FROM
    users_data
WHERE
    productsSold > 0 GROUP BY gender;
# The no of male buyers are 1471
# The no of male sellers are 486
# The no of female buyers are 3948
# The no of female sellers are 1550
    

#16)  The country having maximum number of buyers-
SELECT 
    country, COUNT(productsBought) no_of_buyers
FROM
    users_data
WHERE
    productsBought > 0
GROUP BY country
ORDER BY no_of_buyers DESC
LIMIT 1;
#France has the maximum no of buyers.


#17)  The country having maximum number of sellers-
SELECT 
    country, COUNT(productsSold) no_of_sellers
FROM
    users_data
WHERE
    productsSold > 0
GROUP BY country
ORDER BY no_of_sellers DESC
LIMIT 1;
#France has the maximum no of sellers.


#18) The name of 10 countries having zero number of sellers-
SELECT 
    country
FROM
    users_data
GROUP BY country
HAVING country != ALL (SELECT 
        country
    FROM
        users_data
    WHERE
        productssold != 0)
LIMIT 10;


#19) The record of top 110 users who have used ecommerce platform recently
SELECT 
    *
FROM
    users_data
ORDER BY daysSinceLastLogin ASC
LIMIT 110;


#20)  The number of female users those who have not logged in since last 100 days.
SELECT 
    COUNT(gender) Number_of_female_users
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin > 100;
# The number of female users who have not logged in since last 100 days are 70189


#21) The number of female users of each country at ecommerce platform
SELECT 
    country, COUNT(gender) Number_of_female_users
FROM
    users_data
WHERE
    gender = 'F'
GROUP BY country;


#22) The number of male users of each country at ecommerce platform.
SELECT 
    country, COUNT(gender) Number_of_male_users
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;


#23) The average number of products sold and bought on ecommerce platform by male users for each country-
SELECT 
    country,
    AVG(productsSold) Average_of_products_sold,
    AVG(productsBought) Average_of_products_bought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;


#Insight:

#1) Users from different countries are using this website.
#2) Women are responsible for majority of transactions on the platform
#3) Female users have more followers than male users.
#4) Top 10 countries having maximum products pass rate
#5) France has the maximum no of buyers and sellers.
#6) Around 80% of users have not logged in recently indicating a low overall engagement on the platform.
 