Create Table Tbl_Student(
ID int PRIMARY Key IDENTITY (1,1),
FirstName varchar(20),
LastName varchar(20),
Picture varchar(100) 
)

Create Table Tbl_Lesson(
LESSONID int PRIMARY KEY IDENTITY (1,1),
LessonName varchar(20)
)

Create Table Tbl_Notes(
NOTEID int PRIMARY KEY IDENTITY (1,1),
Student int,
Lesson int,
EXAM1 smallint,
EXAM2 smallint,
EXAM3 smallint,
AVERAGE decimal(5,2),
SİTUATİON bit
)