SELECT * FROM mydb.corona_virus_ds;
SHOW COLUMNS FROM mydb.corona_virus_ds;
select * from mydb.corona_virus_ds where Longitude IS NULL;
SELECT 
	SUM(CASE WHEN 'Country/Region' IS NULL THEN 1 ELSE 0 END) AS Missing_Country_Region,
    SUM(CASE WHEN Province IS NULL THEN 1 ELSE 0 END) AS Missing_Province,
    SUM(CASE WHEN Latitude IS NULL THEN 1 ELSE 0 END) AS Missing_Latitude,
    SUM(CASE WHEN Longitude IS NULL THEN 1 ELSE 0 END) AS Missing_Longitude,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Confirmed IS NULL THEN 1 ELSE 0 END) AS Missing_Confirmed,
    SUM(CASE WHEN Deaths IS NULL THEN 1 ELSE 0 END) AS Missing_Deaths,
    SUM(CASE WHEN Recovered IS NULL THEN 1 ELSE 0 END) AS Missing_Recovered
FROM 
    mydb.corona_virus_ds;
SELECT 
    SUM(CASE WHEN Province IS NULL THEN 1 ELSE 0 END) AS Null_Province,
    SUM(CASE WHEN `Country/Region` IS NULL THEN 1 ELSE 0 END) AS Null_Country_Region,
    SUM(CASE WHEN Latitude IS NULL THEN 1 ELSE 0 END) AS Null_Latitude,
    SUM(CASE WHEN Longitude IS NULL THEN 1 ELSE 0 END) AS Null_Longitude,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Null_Date,
    SUM(CASE WHEN Confirmed IS NULL THEN 1 ELSE 0 END) AS Null_Confirmed,
    SUM(CASE WHEN Deaths IS NULL THEN 1 ELSE 0 END) AS Null_Deaths,
    SUM(CASE WHEN Recovered IS NULL THEN 1 ELSE 0 END) AS Null_Recovered
FROM 
    mydb.corona_virus_ds;
DESCRIBE mydb.corona_virus_ds;
ALTER TABLE mydb.corona_virus_ds
MODIFY COLUMN Date DATE;

SELECT 
    min(Date) AS start_date,
    max(Date) AS end_date
FROM 
    mydb.corona_virus_ds;
SELECT 
    (SELECT COUNT(DISTINCT MONTH(Date)) FROM mydb.corona_virus_ds WHERE YEAR(Date) = 2020) +
    (SELECT COUNT(DISTINCT MONTH(Date)) FROM mydb.corona_virus_ds WHERE YEAR(Date) = 2021) AS Total_Unique_Months;
    SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    round(avg(Confirmed),0) AS Average_Confirmed,
    round(AVG(Deaths) ,0)AS Average_Deaths,
    round(AVG(Recovered),0) AS Average_Recovered
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date);
  
 SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    round(max(Confirmed),0) AS max_Confirmed,
    round(max(Deaths) ,0)AS max_Deaths,
    round(max(Recovered),0) AS max_Recovered
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date);
select 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    round(min(Confirmed),0) AS max_Confirmed,
    round(min(Deaths) ,0)AS max_Deaths,
    round(min(Recovered),0) AS max_Recovered
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date);
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Confirmed) AS Total_Confirmed,
    SUM(Deaths) AS Total_Deaths,
    SUM(Recovered) AS Total_Recovered
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date);
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Confirmed) AS Total_Confirmed,
    SUM(Deaths) AS Total_Deaths,
    ROUND(AVG(Confirmed), 2) AS Average_Confirmed,
    ROUND(VARIANCE(Confirmed), 2) AS Variance_Confirmed,
    ROUND(STDDEV(Confirmed), 2) AS Stdev_Confirmed
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    Year, Month;
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Confirmed) AS Total_Confirmed,
    SUM(Recovered) AS Total_Recovered,
    ROUND(AVG(Confirmed), 2) AS Average_Confirmed,
    ROUND(VARIANCE(Confirmed), 2) AS Variance_Confirmed,
    ROUND(STDDEV(Confirmed), 2) AS Stdev_Confirmed
FROM 
    mydb.corona_virus_ds
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    Year, Month;

SELECT 
    `Country/Region` AS Country,
    sum(Confirmed) AS Sum_of_Confirmed
FROM 
    mydb.corona_virus_ds
GROUP BY 
    `Country/Region`
ORDER BY 
    Sum_of_Confirmed DESC;
SELECT 
    `Country/Region` AS Country,
    sum(Confirmed) AS Sum_of_Confirmed
FROM 
    mydb.corona_virus_ds
GROUP BY 
    `Country/Region`
ORDER BY 
    Sum_of_Confirmed DESC
LIMIT 1;
SELECT 
    `Country/Region` AS Country,
    sum(Deaths) AS Sum_of_Deaths
FROM 
    mydb.corona_virus_ds
GROUP BY 
    `Country/Region`
ORDER BY 
    Sum_of_Deaths DESC
LIMIT 1;
SELECT 
    `Country/Region` AS Country,
    sum(Recovered) AS Sum_of_Recovered
FROM 
    mydb.corona_virus_ds
GROUP BY 
    `Country/Region`
ORDER BY 
    Sum_of_Recovered DESC
LIMIT 5;
















