--Data
select * from [HR Data]
--Total employees
select sum(Employee_count) as Total_employees from [HR Data] 
--Attrition count
select count(Attrition)  as Attrition_count from [HR Data]
where Attrition='Yes'
--Attrition rate
select round((count(attrition) *1.0/(select sum(employee_count) from [HR Data]))*100,2) as Attrition_rate
from [HR Data]
where attrition='Yes'
--Active employees
select (sum(Employee_count) -( select count(Attrition)  as Attrition_count from [HR Data]
where Attrition='Yes')) as Active_employees  from [HR Data]
--Average age 
select (avg(age)) as Average_age from [HR Data]
--Department wise attrition
Select department,count(Attrition) as count
from [HR Data] 
where attrition='Yes'
group by Department 
Order by count(Attrition) desc
--Employee Band
with Age_band as
(select
	case 
		when age between 0 and 25 then 'Under 25' 
		when age between 25 and 34 then '25 - 34'
		when age between 35 and 44 then '35 - 44'
		when age between 45 and 54 then '45 - 54'
		else 'Over 55'
end as ageband,attrition,gender 
from [HR Data]
where Attrition='Yes')
select ageband, count(attrition) as attrtion_count
from age_band
where attrition = 'Yes' 
group by ageband
order by 
	case
		when ageband='Under 25' then 1
		when ageband='25 - 34' then 2
		when ageband='35 - 44' then 3
		when ageband='45 - 54' then 4
		else 5
		end
--Attrition count based on education field
select Education_Field, count(attrition) as  Attrition_count
from [HR Data]
group by Education_Field
order by count(attrition) desc

