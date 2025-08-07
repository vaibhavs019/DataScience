CREATE or REPLACE VIEW price_view as
SELECT i.lname, b.bname, b.price, b.bid 
FROM Books b
Natural Join Ilibrary i
WHERE b.price < 1000 
and i.lname = 'SITLib';

SELECT * 
FROM price_view;


