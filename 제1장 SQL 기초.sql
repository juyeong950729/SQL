# 날짜 : 2022/08/22
# 이름 : 조주영
# 내용 : 제1장 SQL 기초

# 실습1-1
create database `UserDB`;
drop database `UserDB`;

# 실습1-2
create table `User1` (
	`uid`	varchar(10),
    `name`	varchar(10),
    `hp`	char(13),
    `age`	int
);

drop table `User1`;

create table `User2`(
		`uid`	varchar(10),
		`name`	varchar(10),
        `hp`	char(13),
		`age`		int
);

drop table `User2`;

# 실습1-3
insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User1` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `User1` values ('A103', '장보고', '010-1234-3333', 32);
insert into `User1` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User1` set
					`uid`='A105',
                    `name`='이순신',
                    `hp`='010-1234-5555';
                    
insert into `User2` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User2` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `User2` values ('A103', '장보고', '010-1234-3333', 32);
insert into `User2` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User2` set
			`uid` = 'A105',
            `name` = '이순신',
            `hp` = '010-1234-5555';


# 실습1-4
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name`='김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >= 30;
select `uid`, `name`, `age` from `User1`;

select * from `User2`;
select * from `User2` where `uid` = 'A101';
select * from `User2` where `name` = '김춘추';
select * from `User2` where `age` < 30;
select * from `User2` where `age` >= 30;
select `uid`, `name`, `age` from `User2`;


# 실습1-5
update `User1` set `hp`='010-1234-4444' where `uid`='A104';
update `User1` set `age` = 51 where `uid` = 'A105';
update `User1` set
					`hp` = '010-1234-1001' ,
					`age` = 27
				where
                    `uid`='A101';
                    
update `User2` set `hp` = '010-1234-4444' where `uid` = 'A104';
update `User2` set `age` = 51 where `uid` = 'A105';
update `User2` set
			`hp` = '010-1234-1001',
            `age` = 27
		  where
            `uid` = 'A101';

# 실습1-6
delete from `User1` where `uid` = 'A101';
delete from `User1` where `uid` = 'A102' and `age` = 25;
delete from `User1` where `age` >= 30;

delete from `User2` where `uid` = 'A101';
delete from `User2` where `uid` = 'A102' and `age` = 25;
delete from `User2` where `age` >= 30;


# 실습1-7
create table `TblUser`(
	`userID`		varchar (10),
    `userName`		varchar (10),
	`userHP`		char (13),
    `userAge`		tinyint,
    `userAddr`		varchar (20)
);

create table `TblProduct` (
	`prdCode`		int,
    `prdName`		varchar (10),
    `prdPrice`		int,
    `prdAmount`		int,
    `prdCompany`	varchar (10),
    `prdMakeDate`	date
);


# 실습1-8
insert into `TblUser` values ('p101', '김유신', '010-1234-1001', 25, '서울시 중구');
insert into `TblUser` values ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
insert into `TblUser` (`userID`, `userName`, `userAge`, `userAddr`) values ('p103', '장보고', 31, '경기도 광주군');
insert into `TblUser` (`userID`, `userName`, `userAddr`) values ('p104', '강감찬', '경남 창원시');
insert into `TblUser` (`userID`, `userName`, `userHP`, `userAge`) values ('p105', '이순신', '010-1234-1005', 50);

insert into `TblProduct` values (1, '냉장고', 800, 10, 'LG', '2022-01-06');
insert into `TblProduct` values (2, '노트북', 1200, 20, '삼성', '2022-01-06');
insert into `TblProduct` values (3, 'TV', 1400, 6, 'LG', '2022-01-06');
insert into `TblProduct` values (4, '세탁기', 1000, 8, 'LG', '2022-01-06');
insert into `TblProduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`) values (5, '컴퓨터', 1100, 0);
insert into `TblProduct` values (6, '휴대폰', 900, 102, '삼성', '2022-01-06');

# 실습1-9

select * from `TblUser`;
select `userName` from `TblUser`;
select `userName`, `userHP` from `TblUser`;
select * from `TblUser` where `userID` = 'p102';
select * from `TblUser` where `userID` = 'P104' or `userID` = 'p105';
select * from `TblUser` where `userAddr` = '신라';
select * from `TblUser` where `userAge` > 30;
select * from `TblUser` where `userHP` is null;
update `TblUser` set `userAge` = 42 where `userID` = 'p104';
update `TblUser` set `userAddr` = '경남 김해시' where `userID` = 'p105';
delete from `TblUser` where `userID` = 'P103';

select * from `TblProduct`;
select `prdName` from `TblProduct`;
select `prdName`, `prdPrice` from `TblProduct`;
select * from `TblProduct` where `prdCompany` = 'LG';
select * from `TblProduct` where `prdCompany` = '삼성';
update `TblProduct` set `prdCompany` = '삼성', `prdMakeDate` = '2021-01-01' where `prdCode` = 5;




