create database carschool
use carschool



--For Signup and logins--
Create Table Admin(username varchar(50) unique,email nvarchar(50) primary key,phone nvarchar(30),password nvarchar(30));

insert into Admin 
values('Anmol','Anmol@gmail.com','0333123456','Anmol'),('faliha','falihabatool@gmail.com','0333123456','faliha*123')






--Trainer & Student--
Create Table Trainer(ID int Primary key identity(1,1),f_name nvarchar(50),l_name nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,ph_no nvarchar(30),password nvarchar(30),gender nvarchar(10),dob date,ca_ID int Foreign key REFERENCES Car(C_ID),St_ID int Foreign key REFERENCES scooty(S_ID));
Create Table Student(ID int Primary key identity(1,1),f_name varchar(50),l_name varchar(50),username varchar(50) unique,email nvarchar(50) unique,ph_no nvarchar(30),password nvarchar(30),gender varchar(10),dob date,ca_ID int Foreign key REFERENCES Car(C_ID),St_ID int Foreign key REFERENCES scooty(S_ID));







-- Car Scooty table-- 
Create Table Car(C_ID int Primary key,Model nvarchar(50),Number nvarchar(50),Company nvarchar(50),fee int,car_ID int Foreign key REFERENCES statuss(cr_ID) ); select *from Car
Create Table scooty(S_ID int Primary key,Model nvarchar(50),Number nvarchar(50),Company nvarchar(50),fee1 int check(fee1<=5000),sct_ID int Foreign key REFERENCES statuss(cr_ID) ); select *from scooty



select *from Car



--====================================================--
Create Table statuss(cr_ID int primary key ,Status1 nvarchar(50));
Create Table pay(P_ID int PRIMARY KEY identity(1,1),Total int,pa_ID int Foreign key REFERENCES Student(ID));








--Alter  check apply Car Column fee--
ALTER TABLE Car ADD CONSTRAINT fee check(fee<=10000);     select*from Trainer










--Insert Data Into Trainer-- 
insert into Trainer values('Anmol','Shahbaz','anmol123','Anmol@gmail.com','0333123456','Anmol','Female','01/05/2001',1,1)
insert into Trainer values('Faliha','Batool','faliha12','faliha@gmail.com','031245435','faliha','Female','01/06/2000',1,2)
insert into Trainer values('Muhammad','Ali','ali123','Ali@gmail.com','0332903223','alipass','Male','03/08/2006',3,5)
insert into Trainer values('Faizan','Munsaf','Faizan','faizan@gmail.com','0332291001','pass','Male','05/05/2002',2,1)
insert into Trainer values('Freed','Mureed','freed123','freed@gmail.com','033391281981','freepass','Female','06/05/2000',4,6)
insert into Trainer values('Muneeb','Ali','muneeb123','muneeb@gmail.com','033312','Anmol','mujeeb','08/05/2001',7,8)
insert into Trainer values('Fahad','Bhatti','fahadl123','fahad@gmail.com','0333123456','fahadpass','Female','09/05/2004',9,10)










--Insert Data Into Students-- 
insert into Student values('Anmol','Shahbaz','anmol123','Anmol@gmail.com','0333123456','Anmol','Female','01/05/2001',1,1)
insert into Student values('Faliha','Batool','faliha12','faliha@gmail.com','031245435','faliha','Female','01/06/2000',1,2)
insert into Student values('Muhammad','Ali','ali123','Ali@gmail.com','0332903223','alipass','Male','03/08/2006',3,5)
insert into Student values('Faizan','Munsaf','Faizan','faizan@gmail.com','0332291001','pass','Male','05/05/2002',2,1)
insert into Student values('Freed','Mureed','freed123','freed@gmail.com','033391281981','freepass','Female','06/05/2000',4,6)
insert into Student values('Muneeb','Ali','muneeb123','muneeb@gmail.com','033312','Anmol','mujeeb','08/05/2001',7,8)
insert into Student values('Fahad','Bhatti','fahadl123','fahad@gmail.com','0333123456','fahadpass','Female','09/05/2004',9,10)
select * from Student











--Insert Data Into Car--
insert into Car values(1,'2021','lex201','Suzuki',8000,1);
insert into Car values(2,'2020','lmn2010','Cultus',5000,2);
insert into Car values(3,'2019','axz021','Mehran',4000,1);
insert into Car values(4,'2019','sdk3923','Corae',6000,2);
insert into Car values(5,'2018','lpes221','Suzuki',3000,1);
insert into Car values(6,'2020','ajk2012','Cultus',7000,2);
insert into Car values(7,'2022','kkm1023','Mehran',9000,1);
insert into Car values(8,'2018','dsk345','Corae',10000,1);
insert into Car values(9,'2019','lln0011','Suzuki',2000,2);
insert into Car values(10,'2022','oopw1234','Cultus',5000,1);


select *from Car







--Truncate--
truncate table Car









--Drop--
drop table scooty,Car










--Insert Data Into Scooty--
insert into scooty values(1,'2021','lex201','Yamaha',2000,1);
insert into scooty values(2,'2020','lmn2010','Suzuki',3000,2);
insert into scooty values(3,'2019','axz021','Honda',4000,1);
insert into scooty values(4,'2019','sdk3923','Ravi',5000,2);
insert into scooty values(5,'2018','lpes221','Yamaha',3000,1);
insert into scooty values(6,'2020','ajk2012','Suzuki',4000,2);
insert into scooty values(7,'2022','kkm1023','Honda',5000,1);
insert into scooty values(8,'2018','dsk345','Ravi',3000,2);
insert into scooty values(9,'2019','lln0011','Yamaha',1000,1);
insert into scooty values(10,'2022','oopw1234','Suzuki',2000,2);


select *from scooty




--Insert Data Into Status--
insert into statuss values(1,'Available');
insert into statuss values(2,'Booked');





--====================================================================----
select *from Admin,Trainer,Student,Car,scooty,statuss
--====================================================================----









--==================================--
/*Apply Views*/ 
--==================================--
create view vw_adminforcar 
as
select T.ID ,T.f_name as Tfname,T.l_name as Tlname,T.username as Tusername,T.email as Temail,T.ph_no as Tphone,T.gender as TGender,T.dob as TDateofbirth,
S.f_name as Sfname,S.l_name as SLname,S.username as Susername,S.email as Semail,S.ph_no as Sphone,S.gender as SGender,S.dob as SDateofbirth,
C.Model as CarModel,C.Number as CarNumber,C.Company as CarCompany,C.fee as Carfee,
E.Status1 as Status_
from Trainer as T
full outer join Car as C
on T.ID=C.C_ID
full outer join Student as S 
on S.ID=C.C_ID 
inner join statuss as E
on E.cr_ID=C.car_ID;

--==================Check View Implementation Car Admin=====================----
select *from vw_adminforcar; 









---======================================Scooty View Creator========================---------
create view vw_adminforscooty 
as
select T.ID ,T.f_name as Tfname,T.l_name as Tlname,T.username as Tusername,T.email as Temail,T.ph_no as Tphone,T.gender as TGender,T.dob as TDateofbirth,
S.f_name as Sfname,S.l_name as SLname,S.username as Susername,S.email as Semail,S.ph_no as Sphone,S.gender as SGender,S.dob as SDateofbirth,
SC.Model as ScootyModel,SC.Number as ScootyNumber,SC.Company as ScootyCompany,SC.fee1 as Scootyfee,
E.Status1 as Status_
from Trainer as T
full outer join Scooty as SC
on T.ID=SC.S_ID
full outer join Student as S 
on S.ID=SC.S_ID 
inner join statuss as E
on E.cr_ID=SC.sct_ID;
--===================---
select *from vw_adminforscooty; 
--==========================================================================================================================================--------
select*from Student
--=========================================================================--






/*Data Insert In Pay ID*/
insert into pay values(5200,1);
insert into pay values(7200,2);
insert into pay values(8200,3);
insert into pay values(9200,4);
insert into pay values(8300,5);








/*=============================
Aggregate Function Apply Here
==============================*/
create view  Finalyearpay
as     
select	sum(Total) as Total_pay from pay
--===================================--
SELECT *from Finalyearpay
SELECT *from pay








--==============================================================================================================---
--Scalar Function-- --User-define--
--============================================================================================================--
create function totalfee(@num as int)
returns int
as
begin
 return (@num+2000+500)
end
--=====================================================================================================----
select dbo.totalfee(800);

--========================================================================================================---------
ALTER TABLE Trainer                      
ADD Stat_id int Foreign key REFERENCES statuss(cr_ID);
ALTER TABLE Student
ADD Sta_id int Foreign key REFERENCES statuss(cr_ID);
ALTER TABLE Student
ADD Train_Id int Foreign key REFERENCES Trainer(ID);



select *from Trainer
select *from Student

/*============================================
Update data 
=============================================*/
UPDATE Trainer
SET Stat_id = 1
WHERE ID=8; SELECT *FROM Trainer
UPDATE Student
SET Train_Id = 8
WHERE ID=6;  SELECT *FROM Student
UPDATE Student
SET Sta_id = 8
WHERE ID=6;  SELECT *FROM Student










/*=======================================
view for trainer
=======================================*/
create view vw_trainer
as
select T.ID,T.username as TrainerName,St.Status1,S.username as StudentName from Trainer as T
inner join Student as S
on S.Train_Id=T.ID
inner join statuss as St
on St.cr_ID=T.Stat_id
---=============================---
--Lets Check--
--============================--
select * from vw_trainer








/*=======================================
view for Student
=======================================*/
create view vw_studentcar
as
Select T.username as Trainername,C.Model as CarModel,C.Number as CarNumber,C.Company as CarCompany,C.fee as Carfee,ST.Status1 as CarStatus from Trainer as T
full outer join Car as C
on T.ca_ID=C.C_ID
inner join statuss as ST
on C.car_ID=ST.cr_ID 
--==============================================================------
create view vw_studentscooty
as
Select  T.username as Trainername,s.Model as ScootyModel,s.Number as ScootyNumber,s.Company as ScootyCompany,s.fee1 as Scootyfee,ST.Status1 as ScootyStatus from Trainer as T
full outer join scooty as s
on T.ca_ID=s.S_ID
inner join statuss as ST
on s.sct_id=ST.cr_ID 


/*===========================================================
The End
============================================================*/