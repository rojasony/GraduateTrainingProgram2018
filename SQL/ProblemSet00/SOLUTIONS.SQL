ProblemSet00, july 25 2018
-- Submission by roja.pilli@accenture.com 

1).Select the Employee with the top three salaries
  SELECT NAME,SALARY FROM EMPLOYEE A WHERE 3>=(SELECT COUNT(DISTINCT SALARY) FROM EMPLOYEE B WHERE B.SALARY>=A.SALARY)ORDER BY A.SALARY;
  ANS: "ADAM WAYNE"	"94324"
        "PAUL VINCENT"	"94791"
       "TARA CUMMINGS"	"99475"

2).Select the Employee with the least salary
select name from employee where salary=(select min(salary) from employee);
 ans :"JOHN HELLEN"
 
 3).Select the Employee who does not have a manager in the department table
    select name from employee  where managerid not in(select e.e_id from employee e inner join dept d on e.name=d.depmanger);
    ans: "BRUCE WILLS"
         "TIM ARCHER"
          "ADAM JUSTIN"
          "NATASHA STEVENS"
          "ROBERT SWIFT"

4).Select the Employee who is also a Manager
   select  distinct e.name from employee e inner join employee d on e.e_id =d.managerid;
   ans: "BRUCE WILLS"
        "TIM ARCHER"
         "ADAM JUSTIN"
         "NATASHA STEVENS"
         "ROBERT SWIFT"

5)Select the Empolyee who is a Manager and has least salary
   select e.name,min(salary) from employee e inner join dept d on e.dep_id=d.dep_id where e.name=d.depmanger;
   ans: "ROBERT SWIFT"	"27700"

6)Select the total number of Employees in Communications departments
   select e.name from employee e inner join dept d on e.dep_id=d.dep_id where d.depname='COMMUNICATIONS';
   ans :"TOM HANKS"
        "ADAM JUSTIN"
        "STUART WILLIAM"
        "HAROLLD STEVENS"
        "STEVE MICHELOS"
        "ROBIN WAYNE"
 
 7)Select the Employee in Finance Department who has the top salary
  select e.name,MAX(salary) from employee e inner join dept d on e.dep_id=d.dep_id where d.depname='FINANCE';
  ans:"ADAM WAYNE"	"94324"
  
  8)Select the Employee in product depatment who has the least salary
  select e.name,min(salary) from employee e inner join dept d on e.dep_id=d.dep_id where d.depname='PRODUCT';
  ans:  "NICK MARTIN"	"50174"

9)Select the count of Empolyees in Health with maximum salary
  select COUNT(*),MAX(salary) from employee e inner join dept d on e.dep_id=d.dep_id where d.depname='HEALTH';
  ans:  "6"	"94791"
  
 10)Select the Employees who report to Natasha Stevens
    select name from employee where MANAGERID=(select e_id from employee where name='NATASHA STEVENS');
    ANS:  "ADAM WAYNE"
          "JOSEPH ANGELIN"
 
 11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department
    select COUNT(*),d.depname,d.depmanger from employee e inner join dept d on e.dep_id=d.dep_id where d.depname='HEALTH';
    ans: "6"	"HEALTH"	"TIM ARCHER"
 
 12)Display the Department id,Employee ids and Manager ids for the Communications department
    select d.dep_id,e.e_id,d.depmanger from employee e inner join dept d on e.dep_id=d.dep_id  where d.depname='COMMUNICATIONS';
    ans: "D02"	"A198"	"ADAM JUSTIN"
        "D02"	"A187"	"ADAM JUSTIN"
        "D02"	"A121"	"ADAM JUSTIN"
        "D02"	"A194"	"ADAM JUSTIN"
        "D02"	"A133"	"ADAM JUSTIN"
        "D02"	"A116"	"ADAM JUSTIN"
 
 13)Select the Average Expenses for Each dept with Dept id and Dept name
     select e.dep_id,d.depname, avg(salary) from employee e inner join dept d on e.dep_id=d.dep_id group by d.depname;
     ans: "D02"	"COMMUNICATIONS" "48271.3333333333"
          "D05"	"FINANCE"	 "56660.3333333333"
          "D01"	"HEALTH"	 "54527.6666666667"
          "D04"	"INSURANCE"	 "51913.3333333333"
          "D03"	"PRODUCT"	 "58517.5"

 
 14)Select the total expense for the department finance
    select d.depname,SUM(salary) from employee e inner join dept d on e.dep_id=d.dep_id WHERE depname='FINANCE';
    ans:  "FINANCE"	"169981"

 15)Select the department which spends the least with Dept id and Dept manager name
    select * from dept d inner join(select min(s),dep_id from (select sum(salary)as s,dep_id from employee group by dep_id))as e on d.dep_id=e.dep_id;
    ans:  "D03"	"PRODUCT"	"BRUCE WILLS"	"117035"	"D03"
  
 16)Select the count of Employees in each department
    select d.depname,count(*) from employee e inner join dept d on e.dep_id=d.dep_id group by depname;
    ans: "COMMUNICATIONS" "6"
         "FINANCE"	     "3"
         "HEALTH"	       "6"
         "INSURANCE"	   "3"
         "PRODUCT"	     "2"

 17)Select the count of Employees in each department having salary <10000
     select d.depname,count(*),e.salary from employee e inner join dept d on e.dep_id=d.dep_id group by d.depname having     salary<10000;
     ans:  0 rows
     
 18)Select the total number of Employees in Dept id D04
     select count(*) from employee where dep_id='D04';
     ANS: 3
     
 19)Select all department details of the Department with Maximum Employees
    select * from dept d inner join (select max(cnt),dep_id from( select count(e_id) as cnt,dep_id from employee group by dep_id))as t on d.dep_id=t.dep_id ;
    ANS : "D01"	"HEALTH"	"TIM ARCHER"	"6"	"D01"
    
 20)Select the Employees who has Tim Cook as their manager
     select e.name from employee e inner join dept d on e.dep_id=d.dep_id where d.depmanger='TIM COOK'
     ANS: 0 ROWS

