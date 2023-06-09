-- Q1 - How many rows are in the names table?

SELECT COUNT(*)
FROM names;

-- Answer - 1,957,046 rows

-- Q2 - How many total registered people appear in the dataset?

SELECT SUM(num_registered)
FROM names;

-- Answer - 351,653,025 total people

-- Q3 - Which name had the most appearances in a single year in the dataset?

SELECT *
FROM names
ORDER BY num_registered DESC;

-- Answer - The most appearances by a single name in a single year is Linda in 1947 with 99,689 appearances.

-- Q4 - What range of years are included?

SELECT DISTINCT(year)
FROM names;

-- Answer - 1880-2018

-- Q5 - What year has the largest number of registrations?

SELECT DISTINCT(year), SUM(num_registered) AS registered_by_year
FROM names
GROUP BY DISTINCT(year)
ORDER BY registered_by_year DESC;

-- Answer - The year 1957 had the most registrations with 4,200,022

-- Q6 - How many different (distinct) names are contained in the dataset?

SELECT COUNT(DISTINCT(name))
FROM names;

-- Answer - There are 98,400 distinct names.

-- Q7 - Are there more males or more females registered?

SELECT gender, SUM(num_registered)
FROM names
GROUP BY gender;

-- Answer - There are 177,573,793 males and 174,079,232 females, making there more males registered.

-- Q8 - What are the most popular male and female names overall (i.e., the most total registrations)?

SELECT name, gender, SUM(num_registered)
FROM names
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC;

-- Answer - The most popular male name is James, while the most popular female name is Mary.

-- Q9 - What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

SELECT name, gender, year, SUM(num_registered)
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY name, gender, year
ORDER BY SUM(num_registered) DESC;

-- Answer - Jacob and Emily are the most popular boy and girl names between 2000 and 2009.

-- Q10 - Which year had the most variety in names (i.e. had the most distinct names)?

SELECT COUNT(DISTINCT(name)) AS distinct_names, year
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT(name)) DESC;

-- Answer - The year with the most distinct names was 2009 with 32,518.

-- Q11 - What is the most popular name for a girl that starts with the letter X?

SELECT DISTINCT(name), gender, SUM(num_registered) 
FROM names
WHERE name LIKE 'X%'
AND gender = 'F'
GROUP BY DISTINCT(name), gender
ORDER BY SUM(num_registered) DESC;

-- Answer - The most popular female named beginning with X is Ximena.

-- Q12 - How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

SELECT COUNT(DISTINCT(name))
FROM names
WHERE name LIKE 'Q%'
AND name NOT LIKE 'Qu%';

-- Answer - There are 46 names that start with 'Q' but are not followed by a 'u'.