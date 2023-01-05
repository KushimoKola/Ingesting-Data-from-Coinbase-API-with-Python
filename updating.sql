select 
cast(amount as char(10)) || ' was spent or received on ' || curr_date || ' for ' || category as description
from 
my_personal_finance;

----substring(string, start_position[, length]);

SELECT ("Region: " || substr(supplier_id, 1, 1) || ", Location: " || substr(supplier_id, 2)) AS "location" FROM my_business;


-- CREATING NEW COLUMNS
SELECT 
    substr(supplier_id, 1, 1) AS Region,
    substr(supplier_id, 2) AS Location
FROM 
    my_business;

---UPPER/LOWER
select * from my_personal_finance where lower(comments) LIKE '%steve%';

---REPLACE
select distinct replace(curr_date, '-','.') from my_personal_finance;

--DATETIME
/*
The strftime function is very useful for extracting the components of a Date data type.

Extracting Year, Month and Day
*/
select 
    strftime("%Y", curr_date) as year, 
    strftime("%m", curr_date) as month, 
    strftime("%d", curr_date) as day
from 
    my_personal_finance;


--Intervals:
select 
    curr_date, 
    date(curr_date, '7 days') AS week_from_now 
from 
    my_personal_finance;


    --Pivoting with Case Expression:

select strftime("%m", curr_date) as month, count(*) 
from my_personal_finance
where strftime("%m", curr_date) in ('01','02','03')
group by strftime("%m", curr_date)


select 
sum(case when strftime("%m",curr_date) = '01' then 1 else 0 end) as january_count,
sum(case when strftime("%m", curr_date) = '02' then 1 else 0 end) as february_count,
sum(case when strftime("%m", curr_date) = '03' then 1 else 0 end) as march_count
from my_personal_finance;



/*
Retrieve category and average amount (as avg_amount) we've spent on that category, 
but restrict to rows that are expenses ('E') and correspond to transactions in April (month '04') alone, 
and only return categories for whom the sum of the amount is less than 42.
*/

select
    category,
    avg(amount) as avg_amount
from
    my_personal_finance

where 
    expense_or_income = 'E'
and 
    strftime("%m", curr_date) = '04'
group by 
    category
having 
    amount<42


          select 
          strftime("%Y", start_date) as year,
          count(course_name) as count_by_year
          from courses
          where course_category LIKE 'Machine Learning'
          group by strftime("%m",start_date)



                  SELECT
        strftime("%Y", start_date) as year,
        count(course_category) as count_by_year
        FROM COURSES
        WHERE course_category = 'Machine Learning'
        group by 
        strftime("%Y", start_date)