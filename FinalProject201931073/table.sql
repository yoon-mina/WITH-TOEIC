use Master;

-- 로그인 --
create Table studyMember (
	UserID varchar(30) primary key,
	Password varchar(30) not null,
	Name     varchar(30) not null,
	Phone    varchar(30)
)
Select * from studyMember;
Insert into studyMember Values ('hello', '1111', '이유진', '010-23341-9853');
Insert into studyMember Values ('jjh', 'jj11', '정재현', '010-1998-0212');
Insert into studyMember Values ('jjung', 'jj123', '김정우', '010-1998-0219');
Insert into studyMember Values ('kdy', 'dydy', '김도영', '010-1996-0202');
Insert into studyMember Values ('lhc', '1234', '이해찬', '010-9021-0800');
Insert into studyMember Values ('njm', 'nana', '나재민', '010-22000-0813');
Insert into studyMember Values ('ymn', '1111', '윤미나', '010-1111-3333');
Insert into studyMember Values ('yyy', '1111', '이도현', '010-2933-4421');

-- 자유게시판 --
Create Table oneNote (
	nID		int  IDENTITY(1,1) not null,
	userID	nvarchar(20),
	name		nvarchar(20),
	content   nvarchar(max),
	nDate 	datetime  default(getDate( ))
)
insert into oneNote(userID, name, content) Values ('ymn', '윤미나', '토익 노베로 몇점 나오셨나요 다들 ㅜ');
insert into oneNote(userID, name, content) Values ('lhc', '이해찬', '안녕하세요!');
insert into oneNote(userID, name, content) Values ('kdy', '김도영', '전 노베로 400 떴던 것 같아요!');
insert into oneNote(userID, name, content) Values ('lhc', '이해찬', '다음주에 토익 시험 너무 떨리네요 ㅜㅜ');
insert into oneNote(userID, name, content) Values ('kdy', '김도영', '안녕하세용');
insert into oneNote(userID, name, content) Values ('jjh', '정재현', '안녕하세요!!');
insert into oneNote(userID, name, content) Values ('njm', '나재민', '800 넘기는게 목표입니다...');

select * from oneNote;

-- 문제 풀이 -- 
CREATE TABLE  Question (
	imgID	int  IDENTITY(1,1)  primary key,
	userID  nvarchar(30) ,   -- 로그인 기능 결합 시 필요
	name	nvarchar(50)  Default('작성자'),
	pwd	nvarchar(50)  Default(' '),
	title	nvarchar(50)  not NULL,
	body	nvarchar(max) ,
	fName	nvarchar(100) ,
	hit		int Default(0),
	pDate	datetime Default(getdate())
)
Select * from Question;

-- 파일 공유(자료실) --
CREATE TABLE shareBoard (
	seq   int IDENTITY(1,1) primary key,
	userID nvarchar(30),
	name  nvarchar(50) NOT NULL,
	pwd   nvarchar(50) NOT NULL,
	title    nvarchar(150) NOT NULL,
	body   nvarchar(max),
	ref_id    int default(0),
	inner_id  int default(0),
	depth    int default(0),
	hit       int default(0),
	deleted  char(1) default('N'),
	wDate   datetime,
	fName   nvarchar(50),
	fSize     int default(0),
	hitDown int default(0)
)
select * from shareBoard;

-- 일정 관리 -- 
Create Table mySchedule (
	seq   int  Identity(1,1) Primary Key,
	userID nvarchar(30) not null,
	sDate  date not null,
	sTime  nvarchar(12) not null,
	toDo   nvarchar(max) not null,
	hasDone  char(1) Default('N')
)
Select * from mySchedule;