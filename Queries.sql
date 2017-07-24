
--1). List the customer number, the name, the phone number, and the city of customers.
SELECT Custno,Custname,Phone,City FROM DW.dbo.Customer
GO
--2).	List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).
SELECT Custno,Custname,Phone,City FROM DW.dbo.Customer AS C
WHERE State='CO'
GO

--3).List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld).
SELECT * FROM dw.dbo.EVENTREQUEST WHERE ESTCOST >4000 ORDER BY(DATEHELD)
GO
--4).List the event number, the event date (DateHeld),
-- and the estimated audience number with approved STATUS1 and audience greater than
-- 9000 or with pending STATUS1 and audience greater than 7000.
SELECT EVENTNO,DATEHELD,ESTAUDIENCE,STATUS1 FROM EVENTREQUEST
WHERE (STATUS1='Approved' AND ESTAUDIENCE>9000) or (STATUS1='Pending' AND ESTAUDIENCE>7000)
GO

--5).List the event number, event date (DateHeld), customer number and customer name of events 
--placed in January 2013 by customers from Boulder.
SELECT EVENTNO,DATEHELD,Customer.CustNO,Custname FROM EVENTREQUEST,Customer
WHERE DATEHELD LIKE '2013-12%' AND Customer.City='Boulder' 
--WHERE (DATEHELD BETWEEN '2013-12-01' AND '2013-12-31') AND Customer.City='Boulder' 
AND EVENTREQUEST.CUSTNO=Customer.Custno 
GO

SELECT EVENTNO,DATEHELD,Customer.CustNO,Custname FROM EVENTREQUEST JOIN Customer ON EVENTREQUEST.CUSTNO=Customer.Custno 
WHERE DATEHELD LIKE '2013-12%' AND Customer.City='Boulder' 
GO
