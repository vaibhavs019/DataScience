-- 1. Give library wise book details.
SELECT b.lid, lname, count(b.bid) 
FROM books b, Ilibrary i 
WHERE b.lid = i.lid group by lid;

-- OR

SELECT * 
FROM books order by lid;

-- 2. Give bookwise total copies which are available.
SELECT b.bid, b.bname, count(n.bid) 
FROM books b, no_of_copies n 
WHERE b.bid = n.bid group by n.bid;

-- 3. Which library has total copies more than 5?
SELECT  lname, count(n.bid) 
FROM Ilibrary i, no_of_copies n
WHERE n.blid = i.lid
group by n.blid having count(n.bid) > 100;

-- 4. Give institute wise department details.
SELECT institute_name, deptname  
FROM department 
order by institute_name;

-- 5. Give citywise seller details.
SELECT * 
FROM seller order by city;

-- 6. Give author wise book details that have authored more than 2 books.

SELECT b.bid,b.bname,a.aid,a.aname,w.pid
FROM author a, books b, writes w
WHERE a.aid = w.aid and w.bid = b.bid 
and exists
(SELECT aid 
FROM writes
group by aid having count(aid) > 2)
order by aname;

-- 7. Give book details library wise whose price is less than 1000
SELECT *  
FROM books 
WHERE price < 1000 order by lid;

-- 8. Give department wise staff details.
SELECT * 
FROM department order by deptid;

-- 9. How many books are issued library wise
SELECT lid, count(issueid) 
FROM issue
group by lid order by lid;

-- 10. Give purchase details publisher wise.
SELECT * 
FROM purchase order by pid;

-- 11. Display books in a descending order of their cost.
SELECT * 
FROM books order by price desc;
