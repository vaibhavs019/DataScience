-- 1. Write a PL/SQL function to multiply 2 numbers 
delimiter &&;
create or replace function multiply(num1 int, num2 int)
returns int
begin
return num1* num2;
end&&

delimiter ;
select multiply(10,20) as '10*20';

-- 2. Write a PL/SQL function to find greater of 2 numbers. 
delimiter &&;
create or replace function find_large(num1 int, num2 int)
returns int
begin
if num1> num2 then
	return num1;
else	
	return num2;
end if;
end&&

delimiter ;
select find_large(220,102) as 'larger';

-- 3. Write a PL/SQL function to find total number of books 
-- in SIU Library 
delimiter &&;
create or replace function tot_books(libname varchar(30)) 
returns int
begin
declare count int(10);
select count(n.bid) into count from noofcopies n
where n.bid in (select b.bid from books b where b.lid 
in(select i.lid from ilib i inner join  siulib s 
on i.slid = s.slid and s.lname = libname));
return count;
end&&

delimiter ;
select tot_books('Central Library') as 'No of Books in SIU';

-- 4. Write a PL/SQL function to find average of 4 numbers. 
delimiter &&;
create or replace function avg_dec(num1 decimal(6,2),num2 decimal(6,2),
num3 decimal(6,2),num4 decimal(6,2)) 
returns decimal(6,3)
begin
declare ans decimal(6,2),
set ans = (num1+ num2+num3+num4)/4;
return ans;
end&&

delimiter ;
select average(14.33,23,2.3,34) as 'Average';

-- 5. Write a PL/SQL function to find factorial. 
delimiter &&;
create or replace function factorial(num1 int(3))
returns int
begin
	DECLARE counter INT DEFAULT 1;
	declare answer int default 1;
    WHILE counter <= num1 DO
        set answer = answer * counter;
        SET counter = counter + 1;
        
    END WHILE;
return answer;
end&&

delimiter ;
select factorial(6) as '6!';

-- 6. Write a PL/SQL function to find the name of the library 
-- which has the cheapest books. 
delimiter &&;
create or replace function cheapest_book()
returns varchar(20)
begin
declare bname varchar(20);
select lname into bname from ilib where lid in
 (select lid from books where price in
 (select min(price) from books));
return bname;
end&&

delimiter ;
select cheapest_book() as 'Library name';


-- 7. Write a PL/SQL function to find total no. of books 
-- issued by SIT Staff.
use answers;
delimiter &&;
create or replace function staff_books()
returns int
begin
declare count int;
select count(i.issueid) into count
from issue i natural join staff s 
natural join ilib l
where l.lname = 'SITLib';
return count;
end&&

delimiter ;
select staff_books() as 'Count';