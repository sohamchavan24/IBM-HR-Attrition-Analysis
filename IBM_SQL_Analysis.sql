use dbibm;
select * from employees;
alter table employees rename column ï»¿Age to Age;
select * from employees limit 10;

#Checking null values
select * from employees
where age is null or monthlyincome is null;

#check unique values
select distinct department from employees;
select distinct jobrole from employees;
select distinct attrition from employees;

#attrition count
select attrition, count(*) 
from employees 
group by attrition;

#attrition rate
select round(sum(case when attrition='yes' then 1 else 0 end)*100.0/count(*),2) as attrition_rate
from employees;
## This shows the overall percentage of employees leaving the company.


#department-wise attrition
select department, count(*) as total from employees
where attrition='yes'
group by department
order by total desc;
## Some departments have higher employee attrition.

#job-wisse attrition
select jobrole, count(*) as total from employees
where attrition='yes'
group by jobrole
order by total desc;
## Certain job roles show higher attrition, indicating role-specific issues.

#salary-wise attrition
select attrition, avg(monthlyincome) as avg_salary from employees
group by attrition;
## Employees with lower salaries are more likely to leave, so pay could be a major reason.

#overtime impact on attrition
select overtime, count(*) as total from employees
where attrition='yes'
group by overtime;
## Employees who work overtime tend to leave more, which means workload might be too high.

#experience-wise attrition
select yearsatcompany, count(*) as total from employees
where attrition='yes'
group by yearsatcompany
order by yearsatcompany;
## Employees tend to leave more in their early years at the company, indicating early-stage dissatisfaction.

#work-life balance and attrition
select worklifebalance, count(*) as total from employees
where attrition='yes'
group by worklifebalance
order by worklifebalance;
## Poor work-life balance leads to higher attrition, meaning employees want a better balance between work and personal life.

#last prommotion and attrition
select yearssincelastpromotion, count(*) as total from employees
where attrition='yes'
group by yearssincelastpromotion
order by yearssincelastpromotion;
## Employees who haven’t been promoted for a long time are more likely to leave, indicating lack of growth opportunities.



-- =====================
-- Key Business Insights
-- =====================

-- Employees who work overtime tend to leave more, indicating workload issues.
-- Lower salary employees are more likely to leave.
-- Many employees leave in the early years of joining.
-- Lack of promotions increases employee attrition.
-- Poor work-life balance leads to higher employee turnover.
-- Certain departments and job roles have higher attrition.
