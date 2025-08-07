-- 11. Which members have Issued Books that belongs to E&TC department of SIT.
(SELECT s.sname, m.memid,i.Issueid FROM Ilibrary a,Student s, Issue i, member m,department d 
WHERE d.deptname = 'E&TC' and  a.lname = 'SITLib'
and d.lid = m.lid and i.memid = m.memid
and s.memid = i.memid)
UNION 
(SELECT s.stname, m.memid,i.Issueid 
FROM Staff s, Ilibrary a,Issue i, member m,department d 
WHERE d.deptname = 'E&TC' and a.lname = 'SITLib' 
and d.lid = m.lid and i.memid = m.memid
and s.memid = i.memid);

-- 12. List the Books of SIT library
SELECT i.lname,bid,bname,price 
FROM Books b,Ilibrary i 
WHERE b.lid=i.lid and lname='SITLib';

-- 13. Which Books are written by “ Ken Coel”
SELECT b.bname, b.bid 
FROM Books b, Author a, writes w
WHERE a.aname = 'Ken Coel' and a.aid = w.aid and b.bid = w.bid;

-- 14. Find the Staff members who’s salaries are less than atleast one Employee
SELECT * 
FROM Staff 
WHERE Salary < any(
	SELECT Salary 
	FROM Employee);

SELECT *
FROM Staff 
WHERE Salary < ANY (
    SELECT Salary 
    FROM Employee
);


-- 15. Find the Books who’s price is greater than atleast one book in the library.
SELECT bname,price 
FROM Books 
WHERE price>some(SELECT price FROM Books);

-- 16. Find the Employees who’s salary is greater than all the Staff.
SELECT * 
FROM Employee 
WHERE salary > all(
	SELECT salary 
	FROM Staff);

 -- 16. Find the Employees who’s salary is greater than all the Employees of Civil department
SELECT * 
FROM Employee 
WHERE salary > all(
	SELECT salary 
	FROM Employee e, department d 
	WHERE d.lid = e.lid and deptname  = 'CS');

-- 17. Find such Purchases who’s total cost is greater than all the Purchases which are done by “SIT library”
SELECT prid,total_cost,quantity,date 
FROM Purchase 
WHERE total_cost > all(
	SELECT total_cost 
	FROM Purchase p, Ilibrary i 
	WHERE i.lid = p.lid and i.lname = 'SITLib');

-- 18. Find name of such SIU library which is located in Pune and has Ilibraryrary named as “SIOM library”(solve using exists)
SELECT lid,lname,area 
FROM Ilibrary 
WHERE city = 'Pune' and exists (
	SELECT lid 
	FROM Ilibrary 
	WHERE lname = 'SIOMLib');

--  19. Find such Staff members who’s name starts with “S” and do not work for “CS” department. (solve using not exists)
SELECT stname,stid,deptname 
FROM Staff s,department d 
WHERE stname like 's%' and d.deptid = s.deptid and not exists(
	SELECT * 
	FROM department 
	WHERE deptname = 'CS');

-- 20. Which Books are Issued by Student Meera?
SELECT bid,bname 
FROM Books 
WHERE bid in (
SELECT bid FROM Issue WHERE memid in (
	SELECT memid 
	FROM Student 
	WHERE sname = 'Meera'));

SELECT bid,bname 
FROM Books 
WHERE bid in (
SELECT bid FROM Issue WHERE memid in (
	SELECT memid 
	FROM Student 
	WHERE sname = 'Shivani'));

-- 21. FROM which seller did SIT library Purchases Books of “Technical publications”?
SELECT slname 'Seller name', city FROM seller WHERE sid in (SELECT sid 	FROM sells s WHERE s.pid = (SELECT p.pid 	FROM Publisher p WHERE p.pname ='Prentice Hall')) and (SELECT slid FROM Ilibrary WHERE lname="SITLib");
 
-- 22. Which Books are Issued by Staff of SSAC Structure department?
SELECT * FROM Books WHERE bid in (SELECT bid FROM Issue i WHERE i.memid in (SELECT memid FROM Staff s WHERE s.deptid in (SELECT deptid FROM department WHERE deptname='Structure')));

-- 23. Which sellers reside in the same city in which SIT library resides?
SELECT slname FROM seller 
WHERE city in (SELECT city 
FROM Ilibrary WHERE lname="SITLib");

SELECT slname FROM seller 
WHERE city in (SELECT city 
FROM Ilibrary WHERE lname="SCHCLib");


-- 24. Find out the Publishers whose Books are provided by the seller “pragati Books store” to SSBS library.
SELECT pname FROM Publisher 
WHERE pid in (SELECT pid 
FROM sells s WHERE s.sid in (
SELECT sid FROM seller 
WHERE slname="Pragati Books store") and 
s.bid in (SELECT bid 
FROM Books WHERE lid in (
SELECT lid FROM Ilibrary 
WHERE lname="SSBSLib")));

-- 25. Which Books are published by “Shivam Kapoor” with the publishing house Prentice Hall publications?
SELECT bname FROM Books WHERE bid in (SELECT bid FROM writes w WHERE w.pid in (
SELECT pid FROM Publisher WHERE pname="Prentice Hall") and w.aid in (SELECT aid 
FROM Author WHERE aname="Shivam Kapoor"));

SELECT bname FROM Books WHERE bid in (SELECT bid FROM writes w WHERE w.pid in (
SELECT pid FROM Publisher WHERE pname="Wiley") and w.aid in (SELECT aid 
FROM Author WHERE aname="Shivam Kapoor"));

-- 26. What are the Purchase details of the SSAC library for the month of March?
SELECT * 
FROM Purchase p 
WHERE monthname(p.date)="December" and p.lid in (
	SELECT lid 
	FROM Ilibrary 
	WHERE lname="SIBMLib");

-- 27. Which institute does the member belong who have Issued book number 453?
SELECT lname FROM siulibrary WHERE slid in (SELECT slid 
FROM Ilibrary WHERE lid in (SELECT lid FROM Issue WHERE bid=2));

-- 28. Increase the price of all the Books by 10%.
UPDATE Books 
SET price=price+price*(0.1);

-- 29. Change the institute name to SSBS of “Biology department”
UPDATE department 
SET institute_name="SSBS" 
WHERE deptname="Biology";

-- 30. Provide 25% Diwali bonus to SIT Employee.
UPDATE Employee 
SET salary = salary +salary*.25;

-- 31. DELETE the Purchase details which are happened in 2016.
DELETE FROM Purchase 
WHERE year(date)=2016;

-- 10. Find out books which are written by “shruti” and published by Mcgraw hill.
SELECT b.bname, b.bid 
FROM Books b, author a, Publisher p, writes w
WHERE a.aname = 'shruti' and p.pname = 'Tata Macgraw hill'
and a.aid = w.aid and b.bid = w.bid and p.pid = w.pid;

-- 32. DELETE such Issues WHERE Books are already returned in 2017.
DELETE FROM Issue 
WHERE year(returndate)=2017;


