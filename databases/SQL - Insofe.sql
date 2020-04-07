CREATE DATABASE IF NOT EXISTS ecology;
SHOW DATABASES;
USE ecology;
--------------------------------------------------------------------------
CREATE TABLE(S):
1. plots
CREATE TABLE `plots` (
  `plot_id` INT NOT NULL AUTO_INCREMENT,
  `plot_type` TEXT NOT NULL,
  PRIMARY KEY (`plot_id`)
);

2. species
CREATE TABLE `species` (
  `species_id` CHAR(2) NOT NULL,
  `genus` TEXT NOT NULL,
  `species` TEXT NOT NULL,
  `taxa` TEXT NOT NULL,
  PRIMARY KEY (`species_id`)
);

3. surveys
CREATE TABLE `surveys` (
  `record_id` INT NOT NULL AUTO_INCREMENT,
  `month` INT NOT NULL,
  `day` INT NOT NULL,
  `year` INT NOT NULL,
  `plot_id` INT NOT NULL,
  `species_id` CHAR(2),
  `sex` CHAR(1),
  `hindfoot_length` INT,
  `weight` INT,
  PRIMARY KEY (`record_id`),
  FOREIGN KEY (plot_id)
    REFERENCES plots(plot_id)
    ON DELETE CASCADE,
  FOREIGN KEY (species_id)
    REFERENCES species(species_id)
    ON DELETE CASCADE
);
--------------------------------------------------------------------------
Verify the tables:
SHOW TABLES;
SELECT * FROM plots;
SELECT * FROM species;
SELECT * FROM surveys;
--------------------------------------------------------------------------
Load Data into table(s)
Plots:
LOAD DATA LOCAL INFILE
'C:/Users/user1/Desktop/del/dbms_sql/ecology/plots.csv'
INTO TABLE plots  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(plot_id,plot_type);

Query OK, 24 rows affected (0.01 sec)
Records: 24  Deleted: 0  Skipped: 0  Warnings: 0

Species:
LOAD DATA LOCAL INFILE  
'C:/Users/user1/Desktop/del/dbms_sql/ecology/species.csv'
INTO TABLE species  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(species_id,genus,species,taxa);

Query OK, 54 rows affected (0.01 sec)
Records: 54  Deleted: 0  Skipped: 0  Warnings: 0

Surveys:
LOAD DATA LOCAL INFILE  
'C:/Users/user1/Desktop/del/dbms_sql/ecology/surveys.csv'
INTO TABLE surveys  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(record_id,month,day,year,plot_id,species_id,sex,hindfoot_length,weight);

Query OK, 34786 rows affected, 8140 warnings (0.81 sec)
Records: 35549  Deleted: 0  Skipped: 763  Warnings: 8140
--------------------------------------------------------------------------
--------------------------------------------------------------------------
FOR MYSQL 8

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/plots.csv' 
INTO TABLE plots 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(plot_id,plot_type);

LOAD DATA INFILE  
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/species.csv'
INTO TABLE species  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(species_id,genus,species,taxa);

LOAD DATA INFILE  
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/surveys.csv'
INTO TABLE surveys  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(record_id,month,day,year,plot_id,species_id,sex,hindfoot_length,weight);
--------------------------------------------------------------------------
--------------------------------------------------------------------------

--------------------------------------------------------------------------
Querying:
BASIC QUERIES:
USE ecology;

1.	Find the total records in each of the tables plots, species and surveys.
SELECT COUNT(*) FROM species;
SELECT COUNT(*) FROM plots;
SELECT COUNT(*) FROM surveys;

2.	Query to select the year from surveys table.
SELECT year FROM surveys;

3.	Query to select the plot_id and plot_type from plots table.
SELECT plot_id, plot_type FROM plots;

4.	Query to select all the columns from species table.
SELECT * FROM species;
--------------------------------------------------------------------------
Unique values:
5.	Unique values of species from species table.
SELECT DISTINCT species FROM species;

6.	Unique values of plot_type from plots table.
SELECT DISTINCT plot_type FROM surveys;

7.  Distinct pairs of year and species_id from surveys table.
SELECT DISTINCT year, species_id
FROM surveys;

8.	Unique values of species_id from species table.
SELECT DISTINCT species_id
FROM species;

--------------------------------------------------------------------------
Calculated values:
9.	Mass of each individual on different dates in kilograms from surveys table.
SELECT year, month, day, weight/1000.0
FROM surveys;

10.	Select plot_id, species_id, sex, weight and mass in kilograms rounded to 2 decimals.
SELECT plot_id, species_id, sex, weight, ROUND(weight / 1000.0, 2)
FROM surveys;

11.	Query to return year, month, day, species_id and weight mgs.
SELECT day, month, year, species_id, weight * 1000
FROM surveys;

--------------------------------------------------------------------------
Filtering:
12.	Return only the data for the species Dipodomys merriami, which has a species code of DM from surveys table.
SELECT *
FROM surveys
WHERE species_id='DM';

13.	Return only the data since year 2000.
SELECT * FROM surveys
WHERE year >= 2000;

14.	Return the data on Dipodomys merriami starting from the year 2000.
SELECT *
FROM surveys
WHERE (year >= 2000) AND (species_id = 'DM');

15.	Return data on any of the Dipodomys species, which have species codes DM, DO and DS.
SELECT *
FROM surveys
WHERE (species_id = 'DM') OR (species_id = 'DO') OR (species_id = 'DS');

16.	Query that returns the day, month, year, species_id, and weight (in kg) for individuals caught on Plot 1 that weigh more than 75 g.
SELECT day, month, year, species_id, weight / 1000.0
FROM surveys
WHERE plot_id = 1
AND weight > 75;

--------------------------------------------------------------------------
Complex queries:
17.	Rewrite the query that query that returns data on any of the Dipodomys species, which have species codes DM, DO and DS from the year 2000 on using IN.
SELECT *
FROM surveys
WHERE (year >= 2000) AND (species_id IN ('DM', 'DO', 'DS'));

18.	Add comments to the above query.
-- Get post 2000 data on Dipodomys' species
-- These are in the surveys table, and we are interested in all columns
SELECT * FROM surveys
-- Sampling year is in the column `year`, and we want to include 2000
WHERE (year >= 2000)
-- Dipodomys' species have the `species_id` DM, DO, and DS
AND (species_id IN ('DM', 'DO', 'DS'));

--------------------------------------------------------------------------
Sorting:
19.	Sort the contents of species table in the alphabetical order of taxa field/column in the Ascending order.
SELECT *
FROM species;

SELECT *
FROM species
ORDER BY taxa ASC;

20.	Above in the descending order.
SELECT *
FROM species
ORDER BY taxa DESC;
21.	Sort the species table in the ascending order of genus and descending order of species columns.
SELECT *
FROM species
ORDER BY genus ASC, species DESC;

22.	Sort the surveys data in the ascending order of hindfoot_length and weight columns.
SELECT hindfoot_length, weight
FROM surveys ORDER BY hindfoot_length ASC, weight ASC;

23.	Query to return year, species_id, and weight in kg from the surveys table, sorted with the largest weights at the top.
SELECT year, species_id, weight / 1000.0
FROM surveys ORDER BY weight DESC;

--------------------------------------------------------------------------
Order of Execution:
24.	Return the results ordering the birds by their species ID, but we only want to see genus and species.
SELECT genus, species
FROM species
WHERE taxa = 'Bird'
ORDER BY species_id ASC;

25.	Using the surveys table write a query to display the three date fields, species_id, and weight in kilograms (rounded to two decimal places), for individuals captured in 1999, ordered alphabetically by the species_id.
SELECT year, month, day, species_id, ROUND(weight / 1000.0, 2)
FROM surveys
WHERE year = 1999
ORDER BY species_id;
--------------------------------------------------------------------------
Aggregation: COUNT and GROUP BY
26.	From the surveys table, find out how many individuals there are. Using the wildcard simply counts the number of records (rows).
SELECT COUNT(*)
FROM surveys;

27.	How much each individual weight from the above?
SELECT COUNT(*), SUM(weight)
FROM surveys;

28.	Output weight in kilograms rounding to 3 decimal places.
SELECT ROUND(SUM(weight)/1000.0, 3)
FROM surveys;

29.	Query that returns: total weight, average weight, and the min and max weights for all animals caught over the duration of the survey. Can you modify it so that it outputs these values only for weights between 5 and 10?
SELECT SUM(weight), AVG(weight), MIN(weight), MAX(weight) FROM surveys
SELECT SUM(weight), AVG(weight), MIN(weight), MAX(weight) FROM surveys WHERE weight > 50 AND weight < 100

30.	How many individuals were counted in each species. We do this using a GROUP BY clause.
SELECT species_id, COUNT(*)
FROM surveys
GROUP BY species_id;

31.	Query that returns how many individuals were counted in each year: (a) in total; (b) per each species?
-- (a) in total
SELECT year, COUNT(*)
FROM surveys
GROUP BY year;


--- (b) per each species
SELECT year, species_id, COUNT(*)
FROM surveys 
GROUP BY year, species_id;

32.	Query that returns average weight of each species in each year.
SELECT year, species_id, ROUND(AVG(weight), 2)
FROM surveys
GROUP BY year, species_id;

33.	Modify the above queries combining them into one?
SELECT year, species_id, ROUND(AVG(weight), 2), count(*)
FROM surveys
GROUP BY year, species_id;

--------------------------------------------------------------------------
The HAVING keyword
34.	Modify the last query to return information about species with a count higher than 10.
SELECT species_id, COUNT(species_id)
FROM surveys
GROUP BY species_id
HAVING COUNT(species_id) > 10;

35.	Modify the above query, and call COUNT(species_id) by another name, like occurrences.
SELECT species_id, COUNT(species_id) AS occurrences
FROM surveys
GROUP BY species_id
HAVING occurrences > 10;

36.	Query to return, from the species table, the number of genus in each taxa, only for the taxa with more than 10 genus.
-- first attempt
SELECT genus, taxa, count(genus) 
FROM species 
GROUP BY taxa 

-- Refine query
SELECT genus, taxa, count(genus) AS n 
FROM species 
GROUP BY taxa 
HAVING n > 10

Ordering aggregated results:
37.	Query to count the number of individuals of each species captured, ordered by the count.
SELECT species_id, COUNT(*)
FROM surveys
GROUP BY species_id
ORDER BY COUNT(species_id);

--------------------------------------------------------------------------
Saving the queries for future use: VIEWS
38.	Query that covers the data gathered during the summer (May - September) of 2000. (Surveys data).
SELECT *
FROM surveys
WHERE year = 2000 AND (month > 4 AND month < 10)

39.	We donâ€™t want to have to type that every time we want to ask a question about that particular subset of data! (Create a View).
CREATE VIEW summer_2000 AS
SELECT *
FROM surveys
WHERE year = 2000 AND (month > 4 AND month < 10)

40.	Now, we will be able to access these results with a much shorter notation.
SELECT *
FROM summer_2000;

41.	Write a query that returns the number of each species caught in each year sorted from most often caught species to the least occurring ones within each year starting from the most recent records.
SELECT species_id, year, COUNT(species_id)
FROM surveys
GROUP BY year, species_id
ORDER BY year DESC, COUNT(species_id) DESC

42.	Save the above query as a view.
CREATE VIEW sp_by_yr_ordered AS
SELECT species_id, year, COUNT(species_id)
FROM surveys
GROUP BY year, species_id
ORDER BY year DESC, COUNT(species_id) DESC

43.	Retrieve data from the above view.
SELECT *
FROM sp_by_yr_ordered;
--------------------------------------------------------------------------
NULL VALUES:
44.	Scroll through the view that was created to gather summer data only. (summer_2000).
SELECT *
FROM summer_2000

45.	Filter to find the missing rows? - Find all records where the species_id is missing:
SELECT *
FROM summer_2000
WHERE species_id IS NULL

46.	Query to find all the records where species_id is NOT null, we would add the NOT keyword to our query.
SELECT *
FROM summer_2000
WHERE species_id IS NOT NULL

47.	Restrict the above view results to the â€œPEâ€ species.
SELECT *
FROM summer_2000
WHERE species_id == 'PE'

48.	Find the average ourselves using the formula SUM(weight)/COUNT(*) â€“
SELECT SUM(weight), COUNT(*), SUM(weight)/COUNT(*)
FROM summer_2000
WHERE species_id == 'PE'

49.	Refine the above query that returns correct value.
SELECT SUM(weight), COUNT(weight), SUM(weight)/COUNT(weight)
FROM summer_2000
WHERE species_id == 'PE'

50.	Query to count all the non-female animals.
SELECT COUNT(*) 
FROM summer_2000
WHERE sex != 'F'

51.	Query to count all the non-male animals.
SELECT COUNT(*) 
FROM summer_2000
WHERE sex != 'M'

52.	Compare those two numbers with the total.
SELECT COUNT(*) 
FROM summer_2000

53.	Refine query to include missing values.
SELECT COUNT(*)
FROM summer_2000
WHERE sex != 'M' OR sex IS NULL



--------------------------------------------------------------------------
Store aggregated result and use in querying:
54.	Find the average hindfoot_length of all the â€˜PEâ€™ species.
SET @average = (SELECT AVG(hindfoot_length) FROM surveys WHERE species_id = 'PE');
SELECT COUNT(*) FROM surveys WHERE hindfoot_length <= @average;
--------------------------------------------------------------------------
Joins on ecology data:
55.	Join the data with the same species codes. (species and surveys data).
SELECT *
FROM surveys
JOIN species
ON surveys.species_id = species.species_id;

56.	Join the data with the same species codes with using. (species and surveys data).
SELECT *
FROM surveys
JOIN species
USING (species_id);

57.	Retrieve information on when individuals of each species were captured, but instead of their species ID we wanted their actual species names.
SELECT surveys.year, surveys.month, surveys.day, species.genus, species.species
FROM surveys
JOIN species
ON surveys.species_id = species.species_id;

58.	Query that returns the genus, the species, and the weight of every individual captured at the site.
SELECT species.genus, species.species_id, surveys.weight
FROM surveys
JOIN species 
ON surveys.species_id = species.species_id;

59.	Retrieve average mass of the individuals on each different type of treatment.
SELECT plots.plot_type, AVG(surveys.weight)
FROM surveys
JOIN plots
ON surveys.plot_id = plots.plot_id
GROUP BY plots.plot_type;

60.	Query that returns the number of genus of the animals caught in each plot in descending order.
SELECT surveys.plot_id, species.genus, COUNT(*)
FROM surveys
JOIN species ON surveys.species_id = species.species_id
GROUP BY species.genus, surveys.plot_id
ORDER BY surveys.plot_id, COUNT(*) DESC

61.	Query that finds the average weight of each rodent species (i.e., only include species with Rodent in the taxa field).
SELECT species.species_id, surveys.weight
FROM species
JOIN surveys ON species.species_id == surveys.species_id
WHERE species.taxa = 'Rodent'
GROUP BY species.species_id

--------------------------------------------------------------------------
Functions
62.	Represent un-known gender values with â€˜Uâ€™ instead of NULL.
SELECT species_id, sex, IFNULL(sex, 'U') AS non_null_sex
FROM surveys;

63.	Query that returns 30 instead of NULL for values in the hindfoot_length column.
SELECT species_id, hindfoot_length , IFNULL(hindfoot_length, 30) AS non_null_hfl
FROM surveys;

64.	Query that calculates the average hind-foot length of each species, assuming that unknown lengths are 30 (as above).
SELECT species_id, AVG(IFNULL(hindfoot_length, 30)), AVG(hindfoot_length)
FROM surveys
GROUP BY species_id

65.	For example, when joining the species and surveys tables earlier, some results were excluded because the species_id was NULL. We can use IFNULL to include them again, re-writing the NULL to a valid joining value.
SELECT surveys.year, surveys.month, surveys.day, species.genus, species.species
FROM surveys
JOIN species
ON surveys.species_id = IFNULL(species.species_id, 'AB');

66.	Query that returns the number of genus of the animals caught in each plot, using IFNULL to assume that unknown species are all of the genus â€œRodentâ€.
SELECT COUNT(plot_id), plot_id
FROM surveys
JOIN species
ON surveys.species_id = species.species_id
WHERE species.genus != 'Rodent'
GROUP BY surveys.plot_id;

67.	Query to â€œnull outâ€ plot 7:
SELECT species_id, plot_id, NULLIF(plot_id, 7) AS partial_plot_id
FROM surveys;

68.	Query that returns genus names, sorted from longest genus name down to shortest.
SELECT genus, LENGTH(GENUS) AS genus_length 
FROM species
ORDER BY genus_length DESC;
--------------------------------------------------------------------------
Aliases:
69.	We can alias both table names.
SELECT surv.year, surv.month, surv.day, sp.genus, sp.species
FROM surveys AS surv
JOIN species AS sp
ON surv.species_id = sp.species_id;

70.	Alias the column names.
SELECT surv.year AS yr, surv.month AS mo, surv.day AS day, sp.genus AS gen, sp.species AS sp
FROM surveys AS surv
JOIN species AS sp
ON surv.species_id = sp.species_id;

The AS isnâ€™t technically required,
71.	We could do without as,
SELECT surv.year yr
FROM surveys surv;

But using AS is much clearer so it is good style to include it.
--------------------------------------------------------------------------
72.	How many plots from each type are there?
SELECT plot_type, count(*) AS num_plots  
FROM plots  
GROUP BY plot_type  
ORDER BY num_plots DESC;

73.	How many specimens are of each sex are there for each year?
SELECT year, sex, count(*) AS num_animal 
FROM surveys 
WHERE sex IS NOT null 
GROUP BY sex, year;

74.	How many specimens of each species were captured in each type of plot?
SELECT species_id, plot_type, count(*) 
FROM surveys 
JOIN plots 
ON surveys.plot_id=plots.plot_id 
WHERE species_id IS NOT null 
GROUP BY species_id, plot_type;

75.	What is the average weight of each taxa?
SELECT taxa, AVG(weight) 
FROM surveys 
JOIN species 
ON species.species_id=surveys.species_id 
GROUP BY taxa;

76.	What is the percentage of each species in each taxa?
SELECT taxa, 100.0*count(*)/(SELECT count(*) FROM surveys) 
FROM surveys 
JOIN species 
ON surveys.species_id=species.species_id 
GROUP BY taxa;

77.	What are the minimum, maximum and average weight for each species of Rodent?
SELECT surveys.species_id, MIN(weight) as min_weight, MAX(weight) as max_weight, AVG(weight) as mean_weight 
FROM surveys 
JOIN species ON surveys.species_id=species.species_id 
WHERE taxa = 'Rodent' 
GROUP BY surveys.species_id;

78.	What is the average hindfoot length for male and female rodent of each species? Is there a Male / Female difference?
SELECT surveys.species_id, sex, AVG(hindfoot_length) as mean_foot_length  
FROM surveys 
JOIN species ON surveys.species_id=species.species_id 
WHERE taxa = 'Rodent' AND sex IS NOT NULL 
GROUP BY surveys.species_id, sex;

79.	What is the average weight of each rodent species over the course of the years? Is there any noticeable trend for any of the species?
SELECT surveys.species_id, year, AVG(weight) as mean_weight 
FROM surveys 
JOIN species ON surveys.species_id=species.species_id 
WHERE taxa = 'Rodent' 
GROUP BY surveys.species_id, year;

80.	What is the count of species id for each group for the species whose weight is more than their
group's average weight.
SELECT record_id, species_id, weight 
FROM surveys  
WHERE weight > 
   (SELECT AVG(weight) 
    FROM surveys 
    WHERE species_id = species_id);

SELECT species_id, COUNT(*) 
FROM surveys  
WHERE weight > 
   (SELECT AVG(weight) 
    FROM surveys 
    WHERE species_id = species_id)
GROUP BY species_id;