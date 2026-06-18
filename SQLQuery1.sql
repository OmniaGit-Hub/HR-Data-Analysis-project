select *
from Employee_Data;

/* number of rows */

SELECT COUNT(*) AS Total_Employees
FROM Employee_Data;

/* checking null data */

SELECT *
FROM Employee_Data
WHERE Employee_ID IS NULL;

/* checking duplicates data */

SELECT Employee_ID, COUNT(*) AS Duplicate_Count
FROM Employee_Data
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

/* checking outliers values */
SELECT 
MIN(Age) AS Min_Age,
MAX(Age) AS Max_Age
FROM Employee_Data;

SELECT 
MIN(Monthly_Salary) AS Min_Salary,
MAX(Monthly_Salary) AS Max_Salary
FROM Employee_Data;

SELECT 
MIN(Work_Hours_Per_Week) AS Min_Hours,
MAX(Work_Hours_Per_Week) AS Max_Hours
FROM Employee_Data;

SELECT 
MIN(Overtime_Hours) AS Min_Overtime,
MAX(Overtime_Hours) AS Max_Overtime
FROM Employee_Data;

SELECT 
ROUND(Employee_Satisfaction_Score,1) AS Satisfaction_Score
FROM Employee_Data;

/* query 1 */

SELECT 
Gender,
COUNT(*) AS Total_Employees
FROM Employee_Data
GROUP BY Gender;

SELECT 
MIN(Age) AS Min_Age,
MAX(Age) AS Max_Age,
AVG(Age) AS Avg_Age
FROM Employee_Data;

SELECT 
Education_Level,
COUNT(*) AS Employees
FROM Employee_Data
GROUP BY Education_Level
ORDER BY Employees DESC;

/* query 2 */

SELECT 
Job_Title,
COUNT(*) AS Employees
FROM Employee_Data
GROUP BY Job_Title
ORDER BY Employees DESC;


SELECT 
Job_Title,
Round(AVG(Monthly_Salary),2) AS Avg_Salary
FROM Employee_Data
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;


/* query 3*/

SELECT 
MIN(Monthly_Salary) AS Min_Salary,
MAX(Monthly_Salary) AS Max_Salary,
AVG(Monthly_Salary) AS Avg_Salary
FROM Employee_Data;

SELECT 
Department,
Round(AVG(Monthly_Salary),2) AS Avg_Salary
FROM Employee_Data
GROUP BY Department
ORDER BY Avg_Salary DESC;

/* query 4 */

SELECT 
AVG(Performance_Score) AS Avg_Performance
FROM Employee_Data;

SELECT 
Department,
AVG(Performance_Score) AS Avg_Performance
FROM Employee_Data
GROUP BY Department
ORDER BY Avg_Performance DESC;

/* query 5 */

SELECT 
AVG(Training_Hours) AS Avg_Training,
AVG(Performance_Score) AS Avg_Performance
FROM Employee_Data;

/* query 6 */

SELECT 
AVG(Work_Hours_Per_Week) AS Avg_Work_Hours
FROM Employee_Data;

/* quer 7  */

SELECT 
round(AVG(Employee_Satisfaction_Score),2) AS Avg_Satisfaction
FROM Employee_Data;

SELECT 
Department,
round(AVG(Employee_Satisfaction_Score),2) AS Avg_Satisfaction
FROM Employee_Data
GROUP BY Department
ORDER BY Avg_Satisfaction DESC;

/* query 8 */

SELECT 
AVG(Years_At_Company) AS Avg_Experience
FROM Employee_Data;

SELECT 
Department,
AVG(Years_At_Company) AS Avg_Experience
FROM Employee_Data
GROUP BY Department
ORDER BY Avg_Experience DESC;

/* query 9 */

SELECT 
AVG(Projects_Handled) AS Avg_Projects
FROM Employee_Data;

/* query 10 */

SELECT 
AVG(Team_Size) AS Avg_Team_Size
FROM Employee_Data;

/* quer 11 */

SELECT 
SUM(Promotions) AS Total_Promotions
FROM Employee_Data;

SELECT 
Department,
SUM(Promotions) AS Promotions
FROM Employee_Data
GROUP BY Department
ORDER BY Promotions DESC;


/* query 12 */

SELECT 
CAST(Resigned AS VARCHAR(50)) AS Resigned,
COUNT(*) AS Total_Employees
FROM Employee_Data
GROUP BY CAST(Resigned AS VARCHAR(50));

SELECT 
Department,
COUNT(*) AS Resigned_Employees
FROM Employee_Data
WHERE CAST(Resigned AS VARCHAR(10)) = 'True'
GROUP BY Department
ORDER BY Resigned_Employees DESC;

/*new query */

SELECT 
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN CAST(Resigned AS VARCHAR(10)) = 'True' THEN 1 ELSE 0 END) AS Resigned_Employees,
ROUND(
100.0 * SUM(CASE WHEN CAST(Resigned AS VARCHAR(10)) = 'True' THEN 1 ELSE 0 END) / COUNT(*), 
2
) AS Resignation_Rate
FROM Employee_Data
GROUP BY Department
ORDER BY Resignation_Rate DESC;


SELECT TOP 10
Employee_ID,
Department,
Job_Title,
Performance_Score
FROM Employee_Data
ORDER BY Performance_Score DESC;


SELECT 
Employee_ID,
Department,
Overtime_Hours,
Employee_Satisfaction_Score
FROM Employee_Data
WHERE Overtime_Hours > 20
AND Employee_Satisfaction_Score < 3
ORDER BY Overtime_Hours DESC;



SELECT 
Job_Title,
Round(AVG(Monthly_Salary),2) AS Avg_Salary
FROM Employee_Data
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;



/* view */

SELECT * FROM Employee_Data;
GO

CREATE VIEW Department_Analysis AS
SELECT
Department,
COUNT(*) AS Total_Employees
FROM Employee_Data
GROUP BY Department;


GO
CREATE VIEW Job_Analysis AS
SELECT
Job_Title,
COUNT(*) AS Total_Employees,
AVG(Monthly_Salary) AS Avg_Salary,
AVG(Performance_Score) AS Avg_Performance
FROM Employee_Data
GROUP BY Job_Title;


GO 
CREATE VIEW Attrition_Analysis AS
SELECT
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN CAST(Resigned AS VARCHAR(10)) = 'True' THEN 1 ELSE 0 END) AS Resigned_Employees,
ROUND(
100.0 * SUM(CASE WHEN CAST(Resigned AS VARCHAR(10)) = 'True' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS Resignation_Rate
FROM Employee_Data
GROUP BY Department;
