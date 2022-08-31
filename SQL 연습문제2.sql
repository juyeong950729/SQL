
# 날짜 : 2022/08/30
# 이름 : 조주영
# 내용 : SQL 연습문제 2


# 실습 2-1
create database `java2_bank`;
create user 'java2_admin2'@'%' identified by '1234';
grant all privileges on `java2_bank`.* to 'java2_admin2'@'%';
flush privileges;


# 실습 2-2

create table `Bank_Customer` (
	`C_No`		 varchar(14) primary key
				 not null default '주민번호',
    `C_Name`	 varchar(20) not null,
    `C_Dist`	 int not null,
    `C_Phone`	 varchar(20) not null unique,
    `C_Addr`	 varchar(100) default null
);

drop table `Bank_Transaction`;

create table `Bank_Account` (
	`A_No`		  varchar(11) primary key
				  not null default '000-00-0000',
    `A_Item_Dist` varchar(2) not null,
    `A_Item_Name` varchar(20) not null,
    `A_C_No`      varchar(14) not null,
    `A_Balance`   int not null default 0,
    `A_Open_Date` date not null
);

create table `Bank_Transaction` (
	`T_No`			int auto_increment primary key,
    `T_A_No`		varchar(11) not null,
    `T_Dist`		int not null,
    `T_Amount`		int not null,
    `T_datetime`	datetime not null default now()
);



# 실습 2-3
insert into `Bank_Customer` values ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
insert into `Bank_Customer` values ('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구');
insert into `Bank_Customer` values ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
insert into `Bank_Customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
insert into `Bank_Customer` values ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
insert into `Bank_Customer` values ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
insert into `Bank_Customer` values ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
insert into `Bank_Customer` values ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
insert into `Bank_Customer` values ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `Bank_Account` values ('101-11-1001','S1','자유저축예금','730423-1000001',420000,'2005-07-21');
insert into `Bank_Account` values ('101-11-1003','S1','자유저축예금','870830-1000004',53000,'2007-02-17');
insert into `Bank_Account` values ('101-11-2001','S1','자유저축예금','220-82-52237',23000000,'2003-04-14');
insert into `Bank_Account` values ('101-11-2002','S1','자유저축예금','361-22-42687',4201000,'2008-12-30');
insert into `Bank_Account` values ('101-11-2003','S1','자유저축예금','102-22-51094',8325010,'2010-06-07');
insert into `Bank_Account` values ('101-12-1002','S2','정기적립예금','830513-2000003',1020000,'2011-05-13');
insert into `Bank_Account` values ('101-13-1005','S3','주택청약예금','941127-1000006',720800,'2012-10-15');
insert into `Bank_Account` values ('101-21-1004','L1','고객신용대출','910912-2000005',1200500,'2009-08-25');
insert into `Bank_Account` values ('101-22-1006','L2','예금담보대출','730423-1000001',25000,'2013-12-11');
insert into `Bank_Account` values ('101-23-1007','L3','주택담보대출','750210-1000002',2700000,'2020-09-23');

insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-1001',1,50000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-1003',2,120000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-2001',2,300000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-12-1002',1,1000000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-1001',3,0);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-13-1005',1,200000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-1001',1,450000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-2002',2,32000);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-2003',3,0);
insert into `Bank_Transaction` (`T_A_No`,`T_Dist`,`T_Amount`) values ('101-11-1003',1,75000);

# 실습 2-4
select*from `Bank_Account`;

# 실습 2-5
select*from `Bank_Customer`;

# 실습 2-6
select*from `bank_transaction`;

# 실습 2-7
select `C_Name`, `C_No` from `Bank_Customer`;

# 실습 2-8
select `A_Item_Dist`, `A_Item_Name` from `Bank_Account`;

# 실습 2-9
select distinct `A_Item_Dist`, `A_Item_Name` from `Bank_Account`;

# 실습 2-10
select * from `Bank_Account` where `A_Item_Name` = '자유저축예금'
	and `A_Balance` >= 1000000 ;

# 실습 2-11
select * from `bank_customer` where `C_Addr` like '경기도 %';

# 실습 2-12
select * from `Bank_Customer` where `C_No` like '___-__-_____';
select * from `Bank_Customer` where `C_Dist` = 2;

# 실습 2-13
select * from `Bank_Transaction` where `T_Dist` = 1;

# 실습 2-14
select * from `Bank_Transaction` where `T_Dist` = 2
	order by `T_Amount` desc;

# 실습 2-15
select sum(`T_Amount`) as `입금총합`, avg(`T_Amount`) as `입금평균`
	from `Bank_Transaction` where `T_Dist` = 1;

# 실습 2-16
select max(`T_Amount`) as `큰 금액`, min(`T_Amount`) as `작은 금액`
	from `Bank_Transaction` where `T_Dist` = 2;

# 실습 2-17
select * from `Bank_Account` where `A_Item_Name` = '자유저축예금'
	order by `A_Balance` desc;

# 실습 2-18
select * from `Bank_Account` where `A_Item_Name` = '자유저축예금'
	order by `A_Balance` desc limit 1;

# 실습 2-19
select * from `Bank_Transaction` where `T_Dist` <>3
	order by `T_Dist`, `T_Amount` desc;

# 실습 2-20
select
	count(case when `T_Dist`=1 then 1 end) as `입금 건수`,
	count(case when `T_Dist`=2 then 1 end) as `출금 건수`,
	count(case when `T_Dist`=3 then 1 end) as `조회 건수`
	from `Bank_Transaction`;
select
	count(if(`T_Dist`=1, 1, null)) as `입금 건수`,
	count(if(`T_Dist`=2, 1, null)) as `출금 건수`,
	count(if(`T_Dist`=3, 1, null)) as `조회 건수`
	from `Bank_Transaction`;

# 실습 2-21
select `T_Dist`,
	case
	when `T_Dist` = 1 then '입금'
    when `T_Dist` = 2 then '출금'
    when `T_Dist` = 3 then '조회'
    end as `Type`,
    `T_A_No`, `T_Amount`
from `Bank_Transaction`;

# 실습 2-22
select `T_Dist`, count(`T_No`)
	from `Bank_Transaction` group by `T_Dist`;

# 실습 2-23
select `T_A_No`, `T_Dist`, sum(`T_Amount`) from `Bank_Transaction`
	where `T_Dist` = 1 group by `T_A_No`;


# 실습 2-24
select `T_A_No`, `T_Dist`, sum(`T_Amount`) as `합계`
	from `Bank_Transaction`
	where `T_Dist` = 1 group by `T_A_No` having `합계` >= 100000 ;


# 실습 2-25
select * from `Bank_Account` as a
join `Bank_Customer` as b
on a.A_C_No = b.C_No; 

# 실습 2-26
select
	a.`A_No` as `계좌번호`,
    a.`A_Item_Name` as `계좌이름`,
    b.`C_No` as `주민번호(사업자번호)`,
    b.`C_Name` as `고객명`,
    a.`A_Balance` as `현재잔액` 
	from `Bank_Account` as a
	join `Bank_Customer` as b
	on a.A_C_No = b.C_No ;

# 실습 2-27
select * from `Bank_Transaction` as a
	join `Bank_Account` as b
	on a.T_A_No = b.A_No;

# 실습 2-28
select
	`T_No` as `거래번호`,
    `T_A_No` as `계좌번호`,
    `A_C_No` as `고객번호(주민번호)`,
    `T_Dist` as `거래구분`,
    `T_Amount` as `거래금액`,
    `T_Datetime` as `거래일자`
from `bank_account` as a
join `bank_transaction` as b
on a.A_No = b.T_A_No;

# 실습 2-29
select
	`T_No`, `A_No`, `C_No`, `T_Dist`,
    `A_Item_Name`, `C_Name`, `T_Amount`, `T_Datetime`
from `Bank_Transaction` as a
join `Bank_Account` as b 
on a.T_A_No = b.A_No 
join `Bank_Customer` as c
on b.A_C_No = c.C_No
where `T_Dist` = 1
order by `T_Amount` desc;

# 실습 2-30
select
	`T_No`, `A_No`, `C_No`,
    `T_Dist`, `A_Item_Name`,
    `C_Name`, count(`T_No`) as `거래건수`
from `Bank_Transaction` as a
join `Bank_Account` as b 
on a.T_A_No = b.A_No 
join `Bank_Customer` as c
on b.A_C_No = c.C_No
where `T_Dist` in(1,2) and `C_Dist` = 1
group by `C_Name`
order by `T_Dist` asc, `거래건수` desc;


