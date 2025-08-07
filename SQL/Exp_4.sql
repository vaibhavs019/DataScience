-- 1. Find the cheapest book of SIBM library.
SELECT min(price) 
FROM books 
WHERE lid in(SELECT lid 
FROM Ilibrary 
WHERE lname = 'SIBMLib');

-- 2. Which library has the costliest book?
SELECT lname 
FROM Ilibrary 
WHERE lid in (SELECT lid 
FROM books 
WHERE price in (SELECT max(price) 
FROM books));

-- 3. How many students 
FROM SIT issued the book?
SELECT count(memid) 
FROM issue 
WHERE memid in 
(SELECT memid 
FROM student 
WHERE deptid in (SELECT deptid 
FROM department 
WHERE institute_name="SIT"));

-- 4. What is the average cost of books in SITM library?
SELECT avg(price) 
FROM books 
WHERE lid in(SELECT lid 
FROM Ilibrary 
WHERE lname = 'SITMNLib');

-- 5. What is the total cost of purchase made by SIT between Jan to June (SSBS in the month of January - query updated cause of empty set)?
SELECT sum(total_cost) 
FROM purchase 
WHERE month(date) between 1 and 6 and lid in(SELECT lid 
FROM Ilibrary 
WHERE lname = 'SITLib');

SELECT sum(total_cost) 
FROM purchase 
WHERE month(date) between 1 and lid in(SELECT lid 
FROM Ilibrary 
WHERE lname = 'SITLib');

-- 6. How many books are written by “Shruti”
SELECT count(bid) 
FROM writes 
WHERE aid in (SELECT aid 
FROM author 
WHERE aname ='Shruti');

-- 7. What is the costliest book published by “Pragati Book Store”
SELECT max(price) 
FROM books 
WHERE bid in (SELECT bid 
FROM purchase 
WHERE pid in
( SELECT pid 
FROM publisher 
WHERE pname = 'Pragati book store'));

-- OR

SELECT max(price) 
FROM books 
WHERE bid in (SELECT bid 
FROM writes 
WHERE pid in 
(SELECT pid 
FROM publisher 
WHERE pname='Pragati Book store'));

-- 8. How many total copies of books do SIT has?
SELECT count(*) 
FROM no_of_copies 
WHERE bid in (SELECT bid 
FROM books 
WHERE lid in (SELECT lid 
FROM Ilibrary 
WHERE lname='SITLib'));

-- 9. What is the average cost of books written by Shivam Kapoor?
SELECT avg(price) 
FROM books 
WHERE bid in (SELECT bid 
FROM writes 
WHERE aid in (SELECT aid 
FROM author 
WHERE aname= 'Shivam Kapoor'));

SELECT avg(price) 
FROM books 
WHERE bid in (SELECT bid 
FROM writes 
WHERE aid in (SELECT aid 
FROM author 
WHERE aname= 'Mr Kumar'));


-- 10. How many books are sold by seller living in Pune?
SELECT count(bid) 
FROM books 
WHERE bid in (SELECT bid 
FROM sells 
WHERE sid in (SELECT sid 
FROM seller 
WHERE city='Pune'));

SELECT count(bid) 
FROM books 
WHERE bid in (SELECT bid 
FROM sells 
WHERE sid in (SELECT sid 
FROM seller 
WHERE city='Nagpur'));

-- 11. Print the student name in capital who belongs to SSBS
SELECT upper(sname) 
FROM student 
WHERE memid in (SELECT memid 
FROM member 
WHERE lid in (SELECT lid 
FROM Ilibrary 
WHERE lname='SSBSLib'));

-- 12. Add two months to the issue date of book written by “Shivam Kapoor”
SELECT issuedate, date_add(issuedate, interval 60 day) 'After 2 months' 
FROM issue 
WHERE bid in 
(SELECT bid 
FROM writes 
WHERE aid in (SELECT aid 
FROM author 
WHERE aname = 'Shivam Kapoor'));

SELECT issuedate, date_add(issuedate, interval 60 day) 'After 2 months' 
FROM issue 
WHERE bid in 
(SELECT bid 
FROM writes 
WHERE aid in (SELECT aid 
FROM author 
WHERE aname = 'Ameya'));

-- 13. What was the last day of the month when Satish issued the book?
SELECT last_day(issuedate) 
FROM issue 
WHERE 
memid in (SELECT memid 
FROM student 
WHERE sname='Satish') or 
memid in (SELECT memid 
FROM staff 
WHERE stname='Satish');

SELECT last_day(issuedate) 
FROM issue 
WHERE 
memid in (SELECT memid 
FROM student 
WHERE sname='Satish') or 
memid in (SELECT memid 
FROM staff 
WHERE stname='Ayush');

-- 14. How many books are issued 
FROM January to march 2010 and 2020?
SELECT count(bid) 
FROM issue 
WHERE month(issuedate) between 1 and  3 and (year(issuedate) between 2016 and 2016);

-- 15. How many books have copies less than 5 available in the SIBM library?\
-- considering mistakes in dataset, you will get different output for
-- following querie. Both queries are correct but output is different.

SELECT bname,books.bid,books.lid 
FROM books,Ilibrary 
WHERE
books.lid = Ilibrary.lid and Ilibrary.lname = 'SIBMLib' and 
bid in 
(SELECT bid  
FROM no_of_copies
group by bid
having count(bid) < 5);

-- OR

SELECT bname,bid,lid 
FROM books 
WHERE bid in
(SELECT bid 
FROM noofcopies 

WHERE blid=(SELECT lid 
FROM Ilibrary 
WHERE lname = 'SIBMLIB')
 group by bid having count(bid) < 5);