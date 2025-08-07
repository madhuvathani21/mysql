create database rio;
use rio;

create table  emp_table( id int,
 first_name varchar(50),
 last_name varchar(50),
 salary int ,
 joining_date varchar(50),
 department varchar(50),
 primary key(id));

 drop table emp_table;
 
-- 1)
 insert into emp_table(id,first_name,last_name,salary,joining_date,department) values
(1, 'Venkatesh', 'S', 100000, '2015-08-28', 'banking'),
(2, 'Ragavi', 'P', 75000, '2015-08-28', 'business'),
(3, 'Gopinath', 'C', 50000, '2016-03-02', 'pharma'),
(4, 'Dinesh', 'G', 50000, '2016-03-02', 'insurance'),
(5, 'Saibabu', 'E', 40000, '2017-07-08', 'software'),
(6, 'Hasan', 'S', 29000, '2017-07-08', 'manufacturing'),
(7, 'Divya', 'P', 33000, '2017-07-08', 'healthcare'),
(8, 'Aravindan', 'R', 40000, '2017-07-08', 'healthcare'),
(9, 'Sathish', 'MD', 45000, '2016-03-02', 'automobile'),
(10, 'Prasanth', 'PKP', 34000, '2016-03-02', 'insurance'),
(11, 'Vijay', 'R', 25684, '2016-03-02', 'business'),
(12, 'Sivakumar', 'K', 54789, '2016-03-02', 'software');

  select*from emp_table;
   select first_name ,last_name 
 from emp_table;
 
 -- 3)
 select first_name as "Employee Name"
 from emp_table;
 
 -- 4)
	select UPPER(first_name) as Uppercase
    from emp_table;
    
    -- 5)
    select LOWER(first_name) as lowercase
    from emp_table;
    
    -- 6) 
    select distinct department from emp_table ;
    
    -- 7)
    select SUBSTRING(first_name, 1, 3) as firstthreechar
    from emp_table;
    
    -- 8)


  -- 9)
  select RTRIM( first_name)  as righttrimed 
  from emp_table;
  
  -- 10)
    select LTRIM( first_name)  as lefttrimed 
  from emp_table;
  
  -- 11)
  select LENGTH(first_name) as lengthofstring
  from emp_table;
  
  -- 12)
  select replace(first_name ,  'a' ,'$') as replaced
  from emp_table;
  
  -- 13)
  select CONCAT( first_name, '_' ,last_name ) as singlecolumn
  from emp_table ;
  
  -- 14)
  select CONCAT(first_name , ' ', last_name ,' ',joining_date) as joining
  from emp_table;
  
  -- 15)
 select *from emp_table 
 order by first_name asc;
 
 -- 16)
  select *from emp_table 
 order by first_name desc;
 
 -- 17)
 select first_name , salary from emp_table  order by first_name asc , salary desc;
 
 -- 18)
 select*from emp_table 
 where id =4;
 
 -- 19) 
 
 select*from emp_table
 where first_name IN ('Dinesh','Divya');
 
  
 
 -- 20)
 select *from emp_table
 where not first_name in ('Dinesh','Diviya');
 
 
 -- 21)
      select *from emp_table
      where first_name like 's%';
      
  -- 22)
        select *from emp_table
      where first_name like 'v%';
      
   -- 23)
        select * from emp_table 
        where first_name like '_n';
 -- 24)
     select *from emp_table
      where first_name like 'j_';
      
      
 -- 25)
   select *from emp_table where salary > 60000;
   
   -- 26)
      select *from emp_table where salary < 80000;
      
    -- 27)
      select *from emp_table where salary  >= 50000 and  salary <= 80000;
   
 -- 28)
     select * from emp_table where first_name in('Venkatesh','ragavi');
 
-- 29) 
select department,SUM(salary) as totaldepartmentsalary from emp_table group by department;

-- 30)
SELECT department, MAX(salary) AS max_salary
FROM emp_table
GROUP BY department
ORDER BY max_salary ASC;

-- 31)
SELECT department, AVG(salary) AS average_salary
FROM emp_table
GROUP BY department
ORDER BY average_salary ASC;

-- 32)
SELECT department, MAX(salary) AS max_salary
FROM emp_table
GROUP BY department
ORDER BY max_salary ASC;

-- 33)
SELECT department, MIN(salary) AS min_salary
FROM emp_table
GROUP BY department
ORDER BY min_salary ASC;

-- 34)
SELECT 
    YEAR(STR_TO_DATE(joining_date, '%Y-%m-%d')) AS join_year,
    MONTH(STR_TO_DATE(joining_date, '%Y-%m-%d')) AS join_month,
    COUNT(*) AS num_employees
FROM emp_table
GROUP BY join_year, join_month
ORDER BY join_year, join_month;

-- 35)
SELECT department, SUM(salary) AS total_salary
FROM emp_table
GROUP BY department
HAVING total_salary > 800000
ORDER BY total_salary DESC;

-- 36)
SELECT e.first_name, r.incen_amount
FROM emp_table e
JOIN emp_ref r ON e.id = r.id;

-- 37)
SELECT e.first_name, r.incen_amount
FROM emp_table e
JOIN emp_ref r ON e.id = r.id
WHERE r.incen_amount > 3000;

-- 38)
SELECT e.first_name, r.incen_amount
FROM emp_table e
LEFT JOIN emp_ref r ON e.id = r.id;

-- 39)
SELECT e.first_name, 
       COALESCE(r.incen_amount, 0) AS incen_amount
FROM emp_table e
LEFT JOIN emp_ref r ON e.id = r.id;

-- 40)
SELECT e.first_name, r.incen_amount
FROM emp_table e
LEFT JOIN emp_ref r ON e.id = r.id
WHERE r.incen_amount IS NOT NULL;

-- 41)
SELECT e.first_name,
       (SELECT MAX(r2.incen_amount)
        FROM emp_ref r2
        WHERE r2.id = e.id) AS max_incen
FROM emp_table e;

-- 42)
SELECT salary
FROM emp_table
ORDER BY salary DESC
LIMIT 2;

-- 43)
SELECT salary
FROM emp_table
ORDER BY salary DESC
LIMIT 3;

-- 44)
SELECT DISTINCT salary
FROM emp_table
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 45)
SELECT DISTINCT salary
FROM emp_table
ORDER BY salary DESC
LIMIT 1 OFFSET 3;

  create table emp_ref(id int ,incen_date varchar(50),incen_amount int(50),primary key(id) 
 , foreign key (id) references emp_table(id));
  drop table emp_ref;
  select*from emp_ref;
insert into emp_ref(id, incen_date, incen_amount) values
(1, '2016-02-01', 5000),
(2, '2016-02-01', 3000),
(3, '2017-02-01', 4000),
(4, '2017-01-01', 4500),
(5, '2017-01-01', 8500);