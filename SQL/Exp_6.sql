use answers;

-- 1. Students in the Civil department.
select stid, sname, memid,d.deptid,deptname
from student,department d 
where student.deptid = d.deptid
and deptname ='Civil';

-- OR Students in the Biology department
select s.sname,s.stid,s.memid, s.deptid,d.deptname
from student s inner join department d
on s.deptid = d.deptid
and deptname = 'biology';

-- OR Students in the E&TC department
select s.sname,s.stid,s.memid, s.deptid,d.deptname
from student s join department d
on s.deptid = d.deptid
where deptname = 'E&TC';
-- OR
select s.sname,s.stid,s.memid, s.deptid,d.deptname
from student s,department d where s.deptid = d.deptid
and deptname = 'E&TC';

-- 2. Books in SIT library.
select b.bname 'Book title', b.price ' Book price',
l.lname 'Library Name',l.city 'City'
from ilib l natural join books b where l.lname = 'SITLib';
-- OR
select b.bname 'Book title', b.price ' Book price',
l.lname 'Library Name',l.city 'City'
from ilib l inner join books b on l.lid = b.lid 
where l.lname = 'SITLib';
-- OR
select b.bname 'Book title', b.price ' Book price',
l.lname 'Library Name'
from ilib l inner join books b on l.lid = b.lid 
and l.lname = 'SITLib';

-- 3. Books with less than 3 copies in SIT Library.
select count(*) 'Total copies',n.bid 'Book ID',
b.bname ' Title of book', b.price 'Price of book'
from noofcopies n join books b on n.bid = b.bid 
join ilib i on b.lid = i.lid and i.lname='SITLib'
group by b.bid having count(n.bid) < 3;
-- OR
select count(*) 'Total copies',n.bid 'Book ID',
b.bname ' Title of book', b.price 'Price of book'
from noofcopies n natural join books b 
natural join ilib i where i.lname='SITLib'
group by b.bid having count(n.bid) < 3;

-- 4. Sellers in the same city as SIT.
select s.city 'Seller City',s.slname 'Seller name',i.city 'Library city',
i.lname 'Library name',i.area 'Area'
from seller s natural join ilib i
where i.lname = 'SITLib';
-- OR
select s.city 'Seller City',s.slname 'Seller name',i.city 'Library city',
i.lname 'Library name',i.area 'Area'
from seller s inner join ilib i
on s.city = i.city and i.lname = 'SITLib';

-- From now onwards, only single query is given per question 
-- but you can apply natural or inner join wherever applicable

-- 5. Sellers selling books to SIT.
select b.bid, b.bname, s.slname, s.city
from books b natural join sells se 
natural join seller s 
natural join ilib i 
where i.lname = 'SITLib';

-- 6. Books authored by Brian Kernighan, and published by Tata McGraw Hill.
select b.bname, a.aname, p.pname 
from books b natural join writes w natural join author a 
natural join publisher p 
where a.aname = 'Brian Kernighan' and p.pname = 'Tata Macgraw Hill';

-- 7. Books authored by Ken Thompson.
select b.bname, a.aname, b.price,b.bid
from books b natural join writes w natural join author a 
where a.aname = 'Ken Thompson';

-- 8. Books issued by Meera.
-- only book ids and not book name
select s.sname, s.memid, i.bid,i.memid from student s
inner join issue i on s.memid = i.memid
and s.sname = 'Meera';
-- -- OR books issued by all
select b.bname,s.memid, s.sname from books b, student s, issue i
where b.bid = i.bid and s.memid = i.memid;
-- OR
-- books issued by meera with book name
select b.bname,s.memid, s.sname,b.bid 
from books b, student s, issue i
where b.bid = i.bid and s.memid = i.memid
and s.sname='Meera';
-- OR
select b.bname,i.memid, s.sname,i.bid 
from books b inner join issue i
on b.bid = i.bid 
inner join student s
on s.memid = i.memid
where s.sname='Meera';

-- 9. Books issued by SSBS staff.
select s.staid 'Staff id',b.bname 'Title of book',
s.stname as 'Staff name',l.lname 'Library',i.memid 'Member id'
from books b natural join issue i 
natural join staff s 
natural join ilib l
where l.lname = 'SSBSLib';

-- 10. Publisher that provides books to SSLA through Shiksha.
select p.pname 'Publisher', s.slname 'Seller',ss.bid 'Bookd id',
b.bname 'Title',i.lname 'Library'
from publisher p natural join sells ss
natural join seller s
natural join ilib i
natural join books b 
where i.lname = 'SSLALib' and s.slname = 'Shiksha';
-- OR
-- 10. Publisher that provides books to SSBS through Kohinoor or Shiksha.
select p.pname 'Publisher', s.slname 'Seller',
ss.bid 'Bookd id',i.lname 'Library'
from publisher p natural join sells ss
natural join seller s natural join ilib i
where i.lname = 'SSBSLib' and s.slname in('Kohinoor', 'Shiksha')
order by s.slname;

-- 11. Institutes whose staff and students have issued book with bid 4.
select d.institute_name as 'Institute name',
uni.sname as 'Name', b.bname as 'Title of Book' 
from books b join issue i on b.bid = i.bid join
(select sname,memid,deptid from student union select stname,memid,deptid from staff) uni 
on uni.memid = i.memid 
join department d on uni.deptid = d.deptid 
join ilib ins on ins.lid = d.lid where b.bid = 4;

-- 12. Sellers selling to libraries in the same city.

-- 13. Authors with books costing more than rs 500.
select b.bname, a.aname, b.price from 
books b join writes w on b.bid = w.bid 
join author a on w.aid = a.aid and b.price > 500;

