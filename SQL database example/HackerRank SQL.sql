
						---------------------------------------------------------------------------------------------

/*

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

/*

SELECT CASE             
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE 
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;

						---------------------------------------------------------------------------------------------

/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
/*

select distinct city 
from station 
where (left(city,1) not in ('a','e','i','o','u') 
and 
right(city,1) not in ('a','e','i','o','u'));

						---------------------------------------------------------------------------------------------

/*
Query the Name of any student in STUDENTS who scored higher than Marks.
Order your output by the last three characters of each name.
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
/*

SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3), ID ASC;

						---------------------------------------------------------------------------------------------


/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
 but did not realize her keyboard's  key was broken until after completing the calculation.
 She wants your help finding the difference between her miscalculation (using salaries with any zeros removed),
 and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
/*

SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0','')))
 FROM EMPLOYEES


						---------------------------------------------------------------------------------------------


/*
We define an employee's total earnings to be their monthly (MONTHS * SALARY)  worked,
 and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
 Write a query to find the maximum total earnings for all employees as well as the total number of employees
 who have maximum total earnings. Then print these values as  space-separated integers.
/*

SELECT (MONTHS * SALARY) AS EARNING, COUNT(*)
FROM EMPLOYEE
GROUB BY 1
ORDER BY EARNING DESC LIMIT 1



						---------------------------------------------------------------------------------------------

*/

