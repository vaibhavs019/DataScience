CREATE TABLE SIULibrary (Slid INT PRIMARY KEY, 
    Lname VARCHAR(255) NOT NULL, 
    Location VARCHAR(255) NOT NULL, 
    No_of_branches INT);

CREATE TABLE Ilibrary (Lid INT PRIMARY KEY, 
    Lname VARCHAR(255) NOT NULL, 
    City VARCHAR(255) NOT NULL, 
    Area VARCHAR(255) NOT NULL, 
    Slid INT, 
    FOREIGN KEY (Slid) REFERENCES SIULibrary(Slid));

CREATE TABLE Author (Aid INT PRIMARY KEY, 
    Aname VARCHAR(255) NOT NULL, 
    Email VARCHAR(255), 
    Phoneno VARCHAR(15));

CREATE TABLE Publisher (Pid INT PRIMARY KEY, 
    Pname VARCHAR(255) NOT NULL);

CREATE TABLE Seller (Sid INT PRIMARY KEY, 
    Slname VARCHAR(255) NOT NULL, 
    City VARCHAR(255) NOT NULL);

CREATE TABLE Employee (Eid INT PRIMARY KEY, 
    Empname VARCHAR(255) NOT NULL, 
    Email VARCHAR(255), 
    Salary DECIMAL(10, 2), 
    lid INT, 
    FOREIGN KEY (lid) REFERENCES Ilibrary(Lid));

CREATE TABLE Author_specialization (Spec_id INT PRIMARY KEY, 
    Aid INT, 
    Spec_name VARCHAR(255) NOT NULL, 
    FOREIGN KEY (Aid) REFERENCES Author(Aid));

CREATE TABLE Member (Memid INT PRIMARY KEY, 
    Lid INT, 
    FOREIGN KEY (Lid) REFERENCES Ilibrary(Lid));

CREATE TABLE Department (Deptid INT PRIMARY KEY, 
    Deptname VARCHAR(255) NOT NULL, 
    Institute_name VARCHAR(255) NOT NULL, 
    Lid INT, 
    FOREIGN KEY (Lid) REFERENCES Ilibrary(Lid));

CREATE TABLE Student (Stuid INT PRIMARY KEY, 
    Sname VARCHAR(255) NOT NULL, 
    Email VARCHAR(255), 
    Memid INT, 
    Deptid INT, 
    FOREIGN KEY (Deptid) REFERENCES Department(Deptid));

CREATE TABLE Staff (Stid INT PRIMARY KEY, 
    Stname VARCHAR(255) NOT NULL, 
    Email VARCHAR(255), 
    Deptid INT, 
    Memid INT, 
    FOREIGN KEY (Deptid) REFERENCES Department(Deptid));

CREATE TABLE Books (Bid INT PRIMARY KEY, 
    Bname VARCHAR(255) NOT NULL, 
    Price DECIMAL(10, 2) NOT NULL, 
    Lid INT, 
    FOREIGN KEY (Lid) REFERENCES Ilibrary(Lid));

CREATE TABLE No_of_copies (Bnid INT PRIMARY KEY, 
    Bid INT, 
    Blid INT, 
    FOREIGN KEY (Bid) REFERENCES Books(Bid), 
    FOREIGN KEY (Blid) REFERENCES Ilibrary(Lid));

CREATE TABLE Writes (Bid INT, 
    Aid INT, 
    Pid INT, 
    PRIMARY KEY (Bid, Aid), 
    FOREIGN KEY (Bid) REFERENCES Books(Bid), 
    FOREIGN KEY (Aid) REFERENCES Author(Aid));

CREATE TABLE Purchase (prid INT PRIMARY KEY, 
    Lid INT, 
    Sid INT, 
    Pid INT, 
    Bid INT, 
    Quantity INT, 
    Date DATE, 
    Total_cost DECIMAL(10, 2), 
    FOREIGN KEY (Lid) REFERENCES Ilibrary(Lid), 
    FOREIGN KEY (Sid) REFERENCES Seller(Sid), 
    FOREIGN KEY (Pid) REFERENCES Publisher(Pid), 
    FOREIGN KEY (Bid) REFERENCES Books(Bid));

CREATE TABLE Issue (Issueid INT PRIMARY KEY, 
    Memid INT, 
    Bid INT, 
    Bnid INT, 
    Lid INT, 
    Issuedate DATE, 
    Returndate DATE, 
    FOREIGN KEY (Memid) REFERENCES Member(Memid), 
    FOREIGN KEY (Bid) REFERENCES Books(Bid), 
    FOREIGN KEY (Lid) REFERENCES Ilibrary(Lid));

CREATE TABLE Sells (sid INT, 
    bid INT, 
    pid INT, 
    PRIMARY KEY (Sid, Bid), 
    FOREIGN KEY (Sid) REFERENCES Seller(Sid), 
    FOREIGN KEY (Bid) REFERENCES Books(Bid), 
    FOREIGN KEY (Pid) REFERENCES Publisher(Pid));
------------------------------------------------------------------------------------------

Insertaion

INSERT INTO SIULibrary (Slid, Lname, Location, No_of_branches) VALUES 
(1, 'Pune Central Library', 'Pune', 10);

INSERT INTO Ilibrary (Lid, Lname, City, Area, Slid) VALUES
(1, 'SITLib', 'Pune', 'Lavale', 1),
INSERT INTO Ilibrary (Lid, Lname, City, Area, Slid) VALUES
(2, 'SIBMLib', 'Pune', 'Lavale', 1),
INSERT INTO Ilibrary (Lid, Lname, City, Area, Slid) VALUES
(3, 'SSACLib', 'Nagpur', 'Ramnagar', 1),
(4, 'SSLALib', 'Pune', 'Vimannagar', 1),
(5, 'SIBMBLib', 'Bangalore', 'Jaynagar', 1),
(6, 'SITMHLib', 'Hyderabad', 'Banjara Hills', 1),
(7, 'SIOMLib', 'Pune', 'S.B.Road', 1),
(8, 'SITMNLib', 'Noida', 'Golf course area', 1),
(9, 'SSLAHLib', 'Hyderabad', 'Gacchibowli', 1),
(10, 'SSBSLib', 'Pune', 'Tithnagar', 1);

INSERT INTO Books (Bid, Bname, Price, Lid) VALUES
(1, 'Operating System', 1000, 1),
(2, 'Management System', 2500, 2),
(3, 'Supply chain management', 500, 8),
(4, 'Bioinformatics', 780, 10),
(5, 'Tele informatics', 4567, 10),
(6, 'IP and Patents formation', 345, 4),
(7, 'Engineering Graphics', 2456, 1),
(8, 'Customer Management', 3467, 5),
(9, 'Buying Pattern Analysis', 456, 8),
(10, 'Digital Finance', 600, 8),
(11, 'Telecommunication', 1500, 6),
(12, 'Algorithms', 6754, 1),
(13, 'Child Law', 1800, 4),
(14, 'Multimanagers', 2345, 2),
(15, 'MicroEconomics', 267, 5),
(16, 'Electronics', 2341, 1),
(17, 'Structure foundations', 1700, 3),
(18, 'Ecohomes', 1234, 3),
(19, 'Mobile Communication', 456, 6),
(20, 'Labor Laws', 3452, 9),
(21, 'Copyrights', 2789, 9),
(22, 'Research Laws', 1100, 9),
(23, 'DBMS', 700, 1),
(24, 'Computer networks', 3451, 1);

INSERT INTO No_of_copies (Bnid, Bid, Blid) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 2, 1),
(8, 2, 2),
(9, 4, 1),
(10, 4, 2),
(11, 4, 3),
(12, 5, 1),
(13, 5, 2),
(14, 6, 1),
(15, 7, 1),
(16, 8, 1),
(17, 8, 2),
(18, 9, 1),
(19, 10, 1),
(20, 11, 1),
(21, 12, 1),
(22, 12, 2),
(23, 13, 1),
(24, 13, 2),
(25, 14, 1),
(26, 14, 2),
(27, 14, 4),
(28, 15, 1),
(29, 15, 2),
(30, 16, 1),
(31, 16, 2),
(32, 17, 1);

INSERT INTO Author (Aid, Aname, Email, Phoneno) VALUES 
(1, 'Shruti', 'abc@gmail.com', '6447896542'), 
(2, 'Shivam Kapoor','adf@gmail.com', '2345778998'),
(3, 'Ameya', 'ert@gmail.com', '23456789087'),
(4, 'Pooja Pai', 'edr@gmail.com', '32554565678'),
(5, 'Brian Kernighan', 'rtyu@gmail.com', '2143454657'),
(6, 'Ken Thompson', 'errt@gmail.com', '2343454565');


INSERT INTO Writes (Bid, Aid, Pid) VALUES 
(1, 1, 2),
(2, 2, 3),
(3, 5, 2),
(4, 6, 4),
(5, 1, 5),
(6, 1, 2),
(7, 4, 1),
(8, 2, 2),
(9, 5, 5),
(10, 6, 4),
(11, 1, 1),
(12, 4, 2),
(13, 5, 5),
(14, 6, 2),
(15, 3, 1),
(16, 4, 2),
(17, 6, 5),
(18, 2, 4),
(19, 5, 1),
(20, 1, 2),
(21, 3, 5),
(22, 5, 2),
(23, 6, 1),
(24, 3, 3);

INSERT INTO Publisher (Pid, Pname) VALUES 
(1, 'Tata Macgraw hill'), 
(2, 'Pragati book store'), 
(3, 'Prentice Hall'), 
(4, 'OReilly'), 
(5, 'Emerald publishing');

INSERT INTO Seller (Sid, Slname, City) VALUES 
(1, 'Kohinoor', 'Pune'), 
(2, 'Shiksha', 'Pune'), 
(3, 'ABP', 'Noida'), 
(4, 'Technical', 'Hyderabad'), 
(5, 'Timenowta', 'Bangalore'), 
(6, 'Kirti', 'Pune');

INSERT INTO Department (Deptid, Deptname, Institute_name, Lid) VALUES
(1, 'Civil', 'SIT', 1),
(2, 'E&TC', 'SIT', 1),
(3, 'Biology', 'SSBS', 10),
(4, 'Law', 'SSLA', 4),
(5, 'Structure', 'SSAC', 3),
(6, 'Finance management', 'SIBM', 2),
(7, 'Digital Telecommunications', 'SITMH', 6),
(8, 'Clinical Research', 'SSBS', 10);

INSERT INTO Student (Stuid, Sname, Email, Memid, Deptid) VALUES
(1, 'Pooja', 'aswq@gmail.com', 1, 1),
(2, 'Satish', 'azsx@gmail.com', 16, 1),
(3, 'Amar', 'cvnn@gmail.com', 13, 2),
(4, 'Meera', 'lkio@gmail.com', 44, 2),
(5, 'Ravi', 'fghj@gmail.com', 35, 2),
(6, 'Adit', 'cfgb@gmail.com', 26, 3);

INSERT INTO Member (Memid, Lid) VALUES 
(1, 1), 
(16, 1), 
(13, 1), 
(44, 1), 
(35, 1), 
(26, 10), 
(45, 1), 
(23, 10), 
(12, 3), 
(78, 1), 
(49, 4), 
(50, 1);

INSERT INTO Staff (Stid, Stname, Email, Memid, Deptid) VALUES 
(1, 'Satish', 'sddf@gmail.com', 45, 1), 
(2, 'Rachit', 'zxzxc@gmail.com', 23, 3), 
(3, 'Seema', 'lkklk@gmail.com', 12, 5), 
(4, 'Sayali', 'xzcxc@gmail.com', 78, 2), 
(5, 'Aditya', 'cvvcb@gmail.com', 49, 4), 
(6, 'Archit', 'gfdfg@gmail.com', 50, 1);

INSERT INTO Purchase (Prid, Lid, Sid, Pid, Bid, Quantity, Date, Total_cost) VALUES
(1001, 1, 1, 3, 1, 100, '2015-07-12', 70000),
(1002, 2, 3, 4, 2, 1000, '2015-04-10', 80000),
(1003, 1, 4, 2, 5, 45, '2016-08-01', 4500),
(1004, 4, 1, 5, 6, 34, '2016-02-06', 23000),
(1005, 3, 4, 1, 9, 20, '2017-03-15', 1200),
(1006, 1, 2, 4, 10, 89, '2017-04-20', 4500),
(1007, 2, 5, 2, 12, 67, '2018-07-25', 5600),
(1008, 3, 2, 4, 15, 45, '2018-03-27', 50000),
(1009, 4, 3, 1, 16, 340, '2019-02-12', 7800),
(1010, 1, 1, 2, 17, 23, '2020-07-11', 10000);

INSERT INTO Author_specialization (Spec_id, Aid, Spec_name) VALUES 
(101, 1, 'Technical'), 
(201, 1, 'Fiction'), 
(301, 2, 'Non_Fiction'), 
(401, 3, 'Autobiographies'), 
(501, 2, 'Technical'), 
(601, 4, 'Real life stories');

INSERT INTO ISSUE (Issueid, Memid, Bid, Bnid, Lid, Issuedate, Returndate) VALUES
(205, 44, 2, 1, 2, '2020-03-12', '2020-04-12'),
(206, 12, 7, 1, 1, '2020-05-10', NULL),
(207, 78, 4, 3, 10, '2019-03-05', '2019-08-05'),
(208, 13, 10, 1, 8, '2019-04-09', '2019-06-09'),
(209, 35, 12, 2, 1, '2020-10-07', '2020-12-07'),
(210, 45, 2, 2, 2, '2020-04-06', NULL);

INSERT INTO Sells (Sid, bid, Pid) VALUES
(1, 1, 2),
(5, 3, 2),
(3, 2, 3),
(2, 6, 5),
(1, 10, 5),
(4, 14, 1);

INSERT INTO Employee (Eid, Empname, Email, Salary, Lid) VALUES
(111, 'Shilpa', 'sdfdsf@gmail.com', 10000, 1),
(222, 'Shivani', 'sadsf@gmail.com', 20000, 1),
(333, 'Hemani', 'ertet@gmail.com', 500000, 2),
(444, 'Rekha', 'scdsf@gmail.com', 35000, 3),
(555, 'Anil', 'asd@gmail.com', 45000, 5),
(666, 'Suhas', 'fdgfg@gmail.com', 20000, 2);

-------------------------------------------------------------------------------------------

querries:

SELECT * FROM 
Ilibrary 
WHERE City = 'Pune';

SELECT Institute_name 
FROM Department 
WHERE Deptname = 'CS';

SELECT * FROM Books 
WHERE Price BETWEEN 800 AND 12000;

SELECT * 
FROM Employee 
WHERE Salary <= 50000;

SELECT * 
FROM Seller 
WHERE Slname LIKE '%ta';

SELECT * 
FROM Ilibrary 
WHERE Area IS NULL;

SELECT * 
FROM Staff 
WHERE Stname NOT LIKE 'A%';

SELECT * 
FROM Ilibrary
WHERE City = 'Bangalore');

SELECT * 
FROM Student 
WHERE Deptid 
IN (SELECT Deptid 
    FROM Department 
    WHERE Deptname = 'Civil');

DELETE FROM Purchase 
WHERE Year(date) = 2016;