# 날짜 : 2022/08/31
# 이름 : 조주영
# 내용 : SQL 연습문제 3


# 실습 3-1
create database `java2_College`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on `java2_college`.* to 'java2_admin3'@'%';
flush privileges;

drop database `java2_College`;


# 실습 3-2
create table `Student` (
	`StdNo`			varchar(8) not null primary key,
    `StdName`		varchar(20) not null,
    `StdHp`			varchar(13) not null unique,
    `StdYear`		int not null,
    `StdAddress`	varchar(100) default null
);

create table `Lecture` (
	`LecNo`			int not null primary key,
    `LecName`		varchar(20) not null,
    `LecCredit`		int not null,	
    `LecTime`	    int not null,
    `LecClass`		varchar(10) default null
);

create table `Register` (
	`RegStdNo`		varchar(8) not null,
    `RegLecNo`		int not null,
    `RegMidScore`	int default null,
    `RegFinalScore` int default null,
    `RegTotalScore` int default null,
    `RegGrade`		char(1)
);

drop table `Register`;


# 실습 3-3
insert into `Student` (`StdNo`,`StdName`,`StdHp`,`StdYear`) values (20201016,'김유신','010-1234-1001',3);
insert into `Student` values (20201126,'김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `Student` values (20210216,'장보고','010-1234-1003',2,'전라남도 완도시');
insert into `Student` values (20210326,'강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `Student` values (20220416,'이순신','010-1234-1005',1,'부산시 부산진구');
insert into `Student` values (20220521,'송상현','010-1234-1006',1,'부산시 동래구');

insert into `Lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `Lecture` values (167,'운영체제론',3,25,'본605');
insert into `Lecture` values (234,'중급 영문법',3,20,'본201');
insert into `Lecture` values (239,'세법개론',3,40,'본204');
insert into `Lecture` values (248,'빅데이터 개론',3,20,'본601');
insert into `Lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본602');
insert into `Lecture` values (349,'사회복지 마케팅',2,50,'본301');

insert into `Register` (`RegStdNo`,`RegLecNo`) values (20201126,234);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20201016,248);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20201016,253);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20201126,239);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20210216,349);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20210326,349);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20201016,167);
insert into `Register` (`RegStdNo`,`RegLecNo`) values (20220416,349);

# 실습 3-4
select * from `Lecture`;

# 실습 3-5
select * from `Student`;

# 실습 3-6
select * from `Register`;

# 실습 3-7
select * from `Student` where `StdYear` = 3;

# 실습 3-8
select * from `Lecture` where `LecCredit` = 2;

# 실습 3-9
update `Register` set `RegMidScore` = 36, `RegFinalScore` = 42 where `RegStdNo` = 20201126 and `RegLecNo` = 234;
update `Register` set `RegMidScore` = 24, `RegFinalScore` = 62 where `RegStdNo` = 20201016 and `RegLecNo` = 248;
update `Register` set `RegMidScore` = 28, `RegFinalScore` = 40 where `RegStdNo` = 20201016 and `RegLecNo` = 253;
update `Register` set `RegMidScore` = 37, `RegFinalScore` = 57 where `RegStdNo` = 20201126 and `RegLecNo` = 239;
update `Register` set `RegMidScore` = 28, `RegFinalScore` = 68 where `RegStdNo` = 20210216 and `RegLecNo` = 349;
update `Register` set `RegMidScore` = 16, `RegFinalScore` = 65 where `RegStdNo` = 20210326 and `RegLecNo` = 349;
update `Register` set `RegMidScore` = 18, `RegFinalScore` = 38 where `RegStdNo` = 20201016 and `RegLecNo` = 167;
update `Register` set `RegMidScore` = 25, `RegFinalScore` = 58 where `RegStdNo` = 20220416 and `RegLecNo` = 349;
select * from `Register`;

# 실습 3-10
update `Register` set
	`RegTotalScore` = `RegMidScore` + `RegFinalScore`,
    `RegGrade` = if (`RegTotalScore` >= 90, 'A',
				 if (`RegTotalScore` >= 80, 'B',
                 if (`RegTotalScore` >= 70, 'C',
                 if (`RegTotalScore` >= 60, 'D', 'F'))));
select * from `Register`;

# 실습 3-11
select * from `Register` order by `RegTotalScore` desc;

# 실습 3-12
select * from `Register` 
where `RegLecNo` = 349 order by `RegTotalScore` desc;

# 실습 3-13
select * from `Lecture` where `Lectime` >= 30;

# 실습 3-14
select `LecName`, `LecClass` from `Lecture`;

# 실습 3-15
select `StdNo`, `StdName` from `Student`;

# 실습 3-16
select * from `Student` where `StdAddress` is null;

# 실습 3-17
select * from `Student` where `StdAddress` like '부산시%';

# 실습 3-18
select * from `Student` as a
left join `Register` as b
on a.StdNo = b.RegStdNo;

# 실습 3-19
select
`StdNo`, `StdName`, `RegLecNo`, `RegMidScore`,
`RegFinalScore`, `RegTotalScore`, `RegGrade`
from `Student` as a, `Register` as b
where a.StdNo = b.RegStdNo;

# 실습 3-20
select distinct `StdName`, `StdNo`, `RegLecNo`
from `Student` as a
join `Register` as b
on StdNo = RegStdNo where RegLecNo = 349;

# 실습 3-21
select
`StdNo`, `StdName`,
count(`StdNo`) as `수강신청 건수`,
sum(`RegTotalScore`) as `종합점수`,
sum(`RegTotalScore`) / count(`StdNo`) as `평균`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
group by `StdName`;

# 실습 3-22
select * from `Register` as a
join `Lecture` as b;

# 실습 3-23
select
`RegStdNo`, `RegLecNo`, `LecName`,
`RegMidScore`, `RegFinalScore`, `RegTotalScore`, `RegGrade`
from `Register` as a
join `Lecture` as b
on a.RegLecNo = b.LecNo;

# 실습 3-24
select
count(*) as `사회복지 마케팅 수강 신청 건수`,
avg(`RegTotalScore`) as `사회복지 마케팅 평균`
from `Register` as a
join `Lecture` as b
on a.RegLecNo = b.LecNo where `RegLecNo` = 349;

# 실습 3-25
select `RegStdNo`, `LecName`
from `Register` as a
join `Lecture` as b
on a.RegLecNo = b.LecNo where `RegGrade` = 'A';

# 실습 3-26
select * from `Student` as a
join `Register` as b
join `Lecture` as c;

# 실습 3-27
select
`StdNo`, `StdName`, `LecNo`, `LecName`,
`RegMidScore`, `RegFinalScore`, `RegTotalScore`, `RegGrade`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
join `Lecture` as c
on b.RegLecNo = c.LecNo;

# 실습 3-28
select
`StdNo`, `StdName`, `LecName`, `RegTotalScore`, `RegGrade`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
join `Lecture` as c
on b.RegLecNo = c.LecNo where `RegGrade` = 'F';

# 실습 3-29
select
`StdNo`, `stdName`,
sum(`LecCredit`) as `이수학점`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
join `Lecture` as c
on b.RegLecNo = c.LecNo
where `RegGrade` in ('A','B','C','D')
group by `StdName`;

select
`StdNo`, `stdName`,
sum(`LecCredit`) as `이수학점`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
join `Lecture` as c
on b.RegLecNo = c.LecNo
where `RegTotalScore` >= 60
group by `StdNo`;

# 실습 3-30
select
`StdNo`, `StdName`,
group_concat(`LecName`) as `신청 과목`,
group_concat(if(`RegTotalScore` >= 60, `LecName`, null)) as `이수과목`
from `Student` as a
join `Register` as b
on a.StdNo = b.RegStdNo
join `Lecture` as c
on b.RegLecNo = c.LecNo
group by `StdNo`;

