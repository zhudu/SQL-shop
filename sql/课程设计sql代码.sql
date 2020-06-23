USE 购物商城
exec sp_addtype @typename='telephone',@phystype='varchar(11)',@nulltype='not null';

--用户表--------------------------------------------------------------------------------------
create table Client(
	Cli_no telephone not null primary key,	--顾客编码
	Cli_name nvarchar(8) not null,			--姓名
	Cli_sex nchar(1) not null,				--性别
	Cli_id varchar(18) not null,			--身份证号
	Cli_email varchar(20),					--邮箱
	Cli_password varchar(20) not null,		--密码
	Cli_birthday date,						--生日
	constraint CK_Cli_sex check (Cli_sex in ('男','女')),							--检查性别
	constraint CK_Cli_email check(Cli_email is null or (Cli_email like '%@%'))		--检查邮箱
)

--商家表--------------------------------------------------------------------------------------
create table Merchant(
	Mer_no varchar(8) not null primary key,				--商家编号
	Mer_name nvarchar(16) not null,						--店名
	Mer_legal nvarchar(8) not null,						--法人代表
	Mer_address nvarchar(30) not null,					--地址
	Mer_phone telephone not null,						--联系电话
	Mer_email varchar(20),								--邮箱
	Cli_pwd varchar(20) not null,						--密码
	constraint CK_Mer_email check(Mer_email is null or (Mer_email like '%@%'))			--邮箱检查
)

--商品表--------------------------------------------------------------------------------------
create table Goods(
	Goo_no varchar(8) not null primary key,				--商品编码
	Mer_no varchar(8) not null,							--商家编码
	Goo_name nvarchar(16) not null,						--商品名
	Goo_price decimal(8,2) not null,					--价格
	Goo_detail nvarchar(50) null,						--商品介绍
	Store varchar(6) not null,							--仓库编号
	Goo_class varchar(8) not null,						--商品类别
	Goo_img varchar(40) not null,						--商品图片地址
	foreign key(Mer_no) references Merchant(Mer_no)				--引用商家表外键
)

--删除商家，其商品一同下架------------------------------------------------------------------
alter table Goods
	add constraint FK_Mer_no foreign key(Mer_no) references Merchant(Mer_no)
	on delete cascade;


--购物车------------------------------------------------------------------------------------
create table Cart(
	Goo_no varchar(8) not null,				--商品条码
	Cart_num int not null,					--数量
	Cli_no telephone not null,				--顾客编码
	constraint PK_Car primary key (Goo_no,Cli_no)				--主键为商品条码与顾客编码的联合主键
)

--用户注销，购物车表中数据一同清空---------------------------------------------------------
alter table Cart
	add constraint FK_Cart_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--商品下架，购物车表中数据一同清空---------------------------------------------------------
alter table Cart
	add constraint FK_Cart_Goo_no foreign key(Goo_no) references Goods(Goo_no)
	on delete cascade;

--收货地址表--------------------------------------------------------------------------------
create table Addres(
	Add_no varchar(8) not null primary key,				--收货号
	Add_name nvarchar(8) not null,						--收货人
	Add_detail nvarchar(30) not null,					--收货地址
	Add_phone telephone not null,						--联系电话
	Cli_no telephone not null,							--顾客编号
	foreign key(Cli_no) references Client(Cli_no)					--引用顾客表外键
)

--用户注销，收货地址数据一同清空--------------------------------------------------------------
alter table Addres
	add constraint FK_Addres_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--订单----------------------------------------------------------------------------------------
create table Form(
	For_no varchar(10) not null primary key,			--订单号
	Cli_no telephone not null,							--顾客编码
	Goo_no varchar(8) not null,							--商品编号
	For_num int not null,								--数量
	For_time date default getdate(),					--下单时间
	For_pay int default 0,								--支付状态
	Add_no varchar(8),									--收货号
	foreign key(Goo_no) references Goodsbak(Goo_no),				--引用商品表外键
	foreign key(Cli_no) references Client(Cli_no),				--引用用户表外键
	foreign key(Add_no) references Addressbak(Add_no)				--引用地址表外键
)

--用户注销，购物车表中数据一同清空------------------------------------------------------------
alter table Form
	add constraint FK_Form_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--部门表--------------------------------------------------------------------------------------
create table Department(
	Dep_no varchar(4) not null primary key,				--部门号
	Dep_name varchar(30) not null,						--部门名
	Dep_phone telephone not null						--部门电话
)	

--员工表--------------------------------------------------------------------------------------
create table Employees(
	Emp_no varchar(6) not null primary key,			--雇员编号
	Emp_ID varchar(18) not null,					--身份证号
	Emp_name nvarchar(8) not null,					--雇员名
	Emp_sex  nchar(1) not null,						--雇员性别
	Emp_birthday datetime not null,					--生日
	Dep_no varchar(4) null,							--部门编号
	Emp_pwd varchar(20) not null,					--登录密码
	constraint CK_Emp_sex check(Emp_sex in ('男','女')),			--性别检查
	foreign key(Dep_no) references Department(Dep_no)				--引用部门表外键
)

--部门表中的部门编号更新，相应表中的部门编号编号也能自动更新。-------------------------------
alter table Employees
	add constraint FK_Emp_Dep_no foreign key(Dep_no) references Department(Dep_no)
	on update cascade;

--分拣表-------------------------------------------------------------------------------------
create table Sort (
	Sor_no varchar(10) not null primary key,			--分拣号
	Emp_no varchar(6) not null,							--员工号
	For_no varchar(10) not null,						--订单号
	Sor_time datetime not null,							--分拣时间
	Sor_state int ,										--分拣状态
	foreign key(For_no) references Form(For_no),					--引用订单表外键
	foreign key(Emp_no) references Employees(Emp_no)				--引用员工表外键
)

--订单取消，分拣信息一同删除-----------------------------------------------------------------
alter table Sort
	add constraint FK_Sort_For_no foreign key(For_no) references Form(For_no)
	on delete cascade;


--配送---------------------------------------------------------------------------------------
create table Delivery(
	Del_no varchar(10) not null primary key,			--配送号
	Sor_no varchar(10) not null,						--分拣号
	Emp_no varchar(6) not null,							--员工编号
	Add_no varchar(8) not null,							--收货号
	Del_gotime datetime not null,						--配送时间
	Del_gettime datetime not null,						--签收时间
	Del_voucher int not null,							--签收状态
	Del_status int not null,							--配送状态
	foreign key(Sor_no) references Sort(Sor_no),				--引用分拣表外键
	foreign key(Add_no) references Addressbak(Add_no),				--引用收货表外键
	foreign key(Emp_no) references Employees(Emp_no),			--引用员工表外键
)	

--订单取消，配送信息一同删除-------------------------------------------------------------------
alter table Delivery
	add constraint FK_Del_Sor_no foreign key(Sor_no) references Sort(Sor_no)
	on delete cascade;

---------------基本数据---------------
--部门表
insert into Department  values( '1101', '配送部','13754979541')
insert into Department  values( '1102', '分拣部','13678456756')
insert into Department values('1111','管理员','13646086499')
----------------------------------------------------

--1.地址备份（防止用户删除地址信息，员工查无地址信息）插入地址的编号唯一性检查设立于前端
select * into AddressBak from Addres
where 1=2
go
create trigger tri_address
on addres after insert
as
begin
	declare
	@Add_no varchar(8),										--地址编号
	@Add_name nvarchar(8),										--收件人
	@Add_detail nchar(30),									--地址信息
	@Add_phone varchar(11),									--收件号码
	@Cli_no telephone										--用户编号
	select @Add_no = Add_no, @Add_name = Add_name,@Add_detail = Add_detail, @Add_phone = Add_phone,@Cli_no=Cli_no 
	from inserted											--从插入表中获取该信息
	insert into AddressBak (Add_no,Add_name,Add_detail,Add_phone,Cli_no) values(@Add_no,@Add_name,@Add_detail,@Add_phone,@Cli_no)
end
go

------测试数据-----------------------------------------------------------------------
drop trigger tri_address
--插入地址数据，查看备份表是否会出现对应数据
insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','蓝琴','女','168413199808170054','1984987564@163.com','373555','1998-08-17')
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','蓝琴','福建省厦门市集美大学','12527245577','12527245577')
delete from Addres where Add_no='65748752'
delete from AddressBak where Add_no='65748752'

select * from Addres
select * from AddressBak


-----2删除用户，相应信息一同删除---测试数据------
insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','蓝琴','女','168413199808170054','1984987564@163.com','373555','1998-08-17')
delete from Client where Cli_no='12527245577'
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','蓝琴','福建省厦门市集美大学','12527245577','12527245577')
insert into Merchant(Mer_no ,Mer_name,Mer_legal,Mer_address,Mer_phone,Mer_email) values('22412785','广丰源数码专营店','李丰源','福建福州','18762057961','3783783@qq.com')
insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img) values('CZ889488','22412785','小米手环4','69.00','小米手环4nfc4代5全屏电子测心率蓝牙智能支付手环男女士情侣运动手表','235896','手表','../img/picture/026.jpg')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Cart(Goo_no,Cart_num,Cli_no) values('CZ889488','1','12527245577')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201899','161658200001235791','孟浩','男','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201897','161658200001225791','孟二','男','2000-01-22','1101','123456')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values('BUY4368668','9525876642','201897','65748752','2020-01-03 00:00:00.000','2020-01-08 00:00:00.000','0','1')

select * from Client
select * from Addres
select * from Cart
select * from Form
select * from Sort
select * from Delivery


--2.自动生成订单时间--------------------------------由于前端插入数据不会插入时间，故而采用触发器的方式将时间更新为当前时间
go
create trigger tri_insert_form
on Form after insert
as
	declare
	@For_no varchar(10)

	select @For_no = For_no from inserted
	update Form set For_time = getdate() where For_no = @For_no
go

--3.生成订单删除购物车信息----------------------------------------------------
go
create trigger tri_Form
on Form after insert
as 
begin 
	declare 
	@Good_no varchar(8),
	@Cli_no char(11)
	select @Good_no = Goo_no, @Cli_no = Cli_no from inserted
	delete from Cart where Cli_no = @Cli_no and Goo_no = @Good_no
end

---------测试数据-------

insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','蓝琴','女','168413199808170054','1984987564@163.com','373555','1998-08-17')
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','蓝琴','福建省厦门市集美大学','12527245577','12527245577')

insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Cart(Goo_no,Cart_num,Cli_no) values('CZ889488','1','12527245577')
delete from Cart where Goo_no='CZ889488'
delete from Form where Goo_no='CZ889488'
select * from Cart
select * from Form

--4.分配分拣员。订单生成时，自动分配当前工作量最小的分拣员--------------------------------------------------------------------------------
drop trigger tri_Sort
go

create trigger tri_Sort
on Form after insert
as
begin
	declare 
	@emp_no varchar(6),
	@for_no varchar(10),
	@Sor_no varchar(10)
	--随机产生分拣号
	select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
	if(@Sor_no in (select Sor_no from Sort))
	begin
		select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
	end
	
	--获取当前订单的订单号
	select @for_no = For_no from inserted



	--查找出当前工作量最小的分拣员
	create table temp       --新建一个表存放工作量最小员工的信息
	(	
		Emp_no varchar(6),
		total int
	)
	declare @tep_Emp_no char(6), @total int
	select top 1 @tep_Emp_no=e.Emp_no,@total=count( s.Sor_no) from Employees e left join Sort s on e.Emp_no=s.Emp_no
						where e.Dep_no = '1102'
						group by e.Emp_no
						order by count(s.Sor_no) 

	insert into temp(Emp_no,total) values(@tep_Emp_no,@total)

	--工作量最小员工的员工号
	select @emp_no=Emp_no from temp 
	--删除中间表    
	drop table temp

	insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values(@Sor_no,@emp_no,@for_no,getdate(),0)   --默认设置分拣状态为0，未分拣
end
go

-----测试数据---------

insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
delete from Form where For_no='8082870722'
delete from Sort where Sor_no='5073419640'
select * from Form
select * from Sort
select * from Delivery


--商品上架时，将上架商品存入Goodsbak，即时后期下架了，亦可查询到该商品------------------------------------------------------------------------------------------------
select * into Goodsbak from Goods
where 1=2
go
create trigger tri_insert_Goods
on Goods after insert
as
begin
	declare
	@Goo_no varchar(8),
	@Mer_no varchar(8),
	@Goo_name nvarchar(16),
	@Goo_price decimal(8,2),
	@Goo_detail nvarchar(50),
	@Store varchar(6),
	@Goo_class varchar(8),
	@Goo_img varchar(40)
	select @Goo_no=Goo_no,@Mer_no=Mer_no,@Goo_name=Goo_name,@Goo_price=Goo_price,@Goo_detail=Goo_detail,@Store=Store,@Goo_class=Goo_class,@Goo_img =Goo_img
	from inserted

	if(not exists(select * from Goodsbak where Goo_no=@Goo_no))
	begin
	insert into Goodsbak(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class,Goo_img) 
	values(@Goo_no,@Mer_no,@Goo_name,@Goo_price,@Goo_detail,@Store,@Goo_class,@Goo_img)
	end
end
go

--------测试数据--------------------

insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img) values('CZ889488','22412785','小米手环4','69.00','小米手环4nfc4代5全屏电子测心率蓝牙智能支付手环男女士情侣运动手表','235896','手表','../img/picture/026.jpg')
delete from Goods where Goo_no='CZ889488'
delete from Goodsbak where Goo_no='CZ889488'
select * from Goods
select * from Goodsbak

--分配配送员，判断分拣员是否分拣完毕，若分拣完毕自动分配当前工作量最小的配送员----------------------------------------------------------
drop trigger tri_Del
go

create trigger tri_Del
on Sort after update
as
begin
	declare 
	@emp_no varchar(6),
	@Sor_no varchar(10),
	@Del_no varchar(10),
	@Add_no varchar(8),
	@Sor_statu int
	select @Sor_statu = Sor_state from inserted
	if(@Sor_statu = 1)     --判断是否分拣完毕
	begin
		--随机产生配送号
		select @Del_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
		if(@Del_no in (select Del_no from Delivery))
		begin
			select @Del_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
		end

		--分拣该快递的分拣号
		select @Sor_no = Sor_no from inserted

		--获取该订单的客户地址编号
		declare @For_no varchar(10)
		select @For_no = For_no from Sort where Sor_no = @Sor_no 

		select @Add_no = Add_no from Form 
		where For_no = @For_no 

		create table temp       --新建一个表存放工作量最小员工的信息
		(	
			Emp_no varchar(6),
			total int
		)
		declare @tep_Emp_no char(6), @total int
		select top 1 @tep_Emp_no=e.Emp_no,@total=count( d.Sor_no) from Employees e left join Delivery d on e.Emp_no=d.Emp_no
						where e.Dep_no = '1101' 
						group by e.Emp_no
						order by count( d.Sor_no)  

		insert into temp(Emp_no,total) values(@tep_Emp_no,@total)

		--工作量最小员工的员工号
		select @emp_no=Emp_no from temp 
		--删除中间表    
		drop table temp

		--添加到配送表中，并且配送状态未0表示未配送，签收快照为0表示未签收
		insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values(@Del_no,@Sor_no,@emp_no,@Add_no,GETDATE(),null,0,0)
	end

end
go

------测试数据---------
insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img)
values('CZ889488','22412785','小米手环4','69.00','小米手环4nfc4代5全屏电子测心率蓝牙智能支付手环男女士情侣运动手表','235896','手表','../img/picture/026.jpg')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
select * from Sort
update Sort set Sor_state=1 where Sor_no='3032194071'
update Sort set Sor_state=0 where Sor_no='3032194071'
select * from Delivery
select * from Form


------存储过程实现员工离职并重新分配该员工的工作----------------------------------------------------------------
go
drop proc proc_newWork
go

create proc proc_newWork (@Emp_no varchar(6))
as
begin
	declare @Dep_no varchar(4)
	--查询该员工的部门
	select @Dep_no = Dep_no from Employees where Emp_no = @Emp_no
	
	declare 
	@for_no varchar(10),    --订单号
	@old_Sor_no varchar(10),--旧的分拣号
	@Sor_no varchar(10),    --分拣号
	@Sor_state int,         --分拣状态
	@new_emp_no varchar(6), --
	@Del_no varchar(10),    --配送号
	@Del_voucher int,		--签收状态
	@Del_status int,		--配送状态
	@Add_no varchar(8),     --地址
	@n int       --循环变量
	declare @tep_Emp_no char(6), @total int  --中间表
	--判断离职的员工是属于哪个部门
	if(@Dep_no = '1102')  
	begin
		--查找出删除的分拣员的分拣任务总数
		select @n = count(Sor_no) from Sort where Emp_no = @Emp_no 
		
		while @n>0
		begin
			--获取离职的分拣员的其中一条分拣信息的分拣号和订单号
			select top 1 @for_no = For_no ,@old_Sor_no = Sor_no,@Sor_state = Sor_state from Sort  where Emp_no = @Emp_no  
			
			--------查找出当前工作量最小的分拣员
			create table temp       --新建一个表存放工作量最小员工的信息
			(	
				Emp_no varchar(6),
				total int
			)
			select top 1 @tep_Emp_no=e.Emp_no,@total=count( s.Sor_no) from Employees e left join Sort s on e.Emp_no=s.Emp_no
						where e.Dep_no = '1102' and  e.Emp_no != @Emp_no
						group by e.Emp_no
						order by count(s.Sor_no) 

			insert into temp(Emp_no,total) values(@tep_Emp_no,@total)
			--工作量最小员工的员工号
			select @new_emp_no=Emp_no from temp 
			--删除中间表    
			drop table temp

			--重新生成分拣号
			select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
			if(@Sor_no in (select Sor_no from Sort))
			begin
				select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
			end

			--重新分配未完成的分拣任务给其他分拣员
			
			insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values(@Sor_no,@new_emp_no,@for_no,getdate(),@Sor_state)

			--由于更新了分拣员，因此更新配送表，找出分拣号对应的配送单
			if(@old_Sor_no in (select Sor_no from Delivery))
			begin
				select @Del_no = Del_no from Delivery where Sor_no = @old_Sor_no
				update Delivery set Sor_no = @Sor_no where Del_no = @Del_no
			end

			--删除已离职分拣员的分拣信息
			delete from Sort where  Sor_no = @old_Sor_no

			set @n = @n -1
		end

		--重新分配工作以后，将该离职员工从员工表中删除
		delete from Employees where Emp_no = @Emp_no
		end

		else if(@Dep_no = '1101')
		begin
		--查找出删除的配送员员的配送任务总数
		select @n = count(Del_no) from Delivery where Emp_no = @Emp_no 
		
		while @n>0
		begin
			--获取离职的配送员的其中一条分拣信息的配送号、分拣号、签收状态、配送状态、地址
			select top 1 @Del_no = Del_no ,@Sor_no = Sor_no,@Add_no = Add_no,@Del_voucher = Del_voucher ,@Del_status = Del_status from Delivery  where Emp_no = @Emp_no   

			--查找当前工作量最小的配送员
			create table temp       --新建一个表存放工作量最小员工的信息
			(	
				Emp_no varchar(6),
				total int
			)
			
			select top 1 @tep_Emp_no=e.Emp_no,@total=count( d.Sor_no) from Employees e left join Delivery d on e.Emp_no=d.Emp_no
						where e.Dep_no = '1101' and  e.Emp_no != @Emp_no
						group by e.Emp_no
						order by count( d.Sor_no)  

			insert into temp(Emp_no,total) values(@tep_Emp_no,@total)
			--工作量最小员工的员工号
			select @new_emp_no=Emp_no from temp 
			--删除中间表    
			drop table temp
			--重新分配未完成的配送任务给其他配送员
			update Delivery set Emp_no = @new_emp_no where Del_no = @Del_no
			set @n = @n -1
		end

		--重新分配配送工作以后，将该离职员工从员工表中删除
		delete from Employees where Emp_no = @Emp_no
	end

	--如果不是配送员也不是分拣员，直接从员工表中删除
	else
	begin
		delete from Employees where Emp_no = @Emp_no
	end
end
go


------------测试数据--------------------------


select * from Employees
select * from Sort
select * from Delivery

insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201899','161658200001235791','孟浩','男','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201897','161658200001225791','孟二','男','2000-01-22','1101','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201879','161658200001235791','孟浩2','男','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201877','161658200001225791','孟二2','男','2000-01-22','1101','123456')

insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values('BUY4368668','9525876642','201897','65748752','2020-01-03 00:00:00.000','2020-01-08 00:00:00.000','0','1')


insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876643','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876644','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876645','201899','8082870722','2020-01-02 00:00:00.000','1')

exec proc_newWork '201899'


--12.配送到达时，自动生成送达时间
create trigger tri_insert_Del
on Delivery after update
as
	declare
	@Del_no varchar(10),
	@Del_stutas int
	select @Del_no = Del_no,@Del_stutas = Del_status from inserted
	if(@Del_stutas = 2)
	begin
		update Delivery set Del_gettime = getdate() where Del_no = @Del_no
	end
go


--------------------------------------------------------分界线---------------------------------------------------------------





--5.修改分拣状态，0为还没有分拣完毕，1为分拣完成
go
create proc proc_form_ststu (@Sor_no varchar(10))
as
	update Sort set Sor_state = 1 where Sor_no = @Sor_no
go

--6.修改配送状态，0为未配送，1为正在配送，2为已送达
create proc proc_Del_ststu (@Del_no varchar(10),@Del_status int)
as
	update Delivery set Del_status = @Del_status where Del_no = @Del_no
go

--7.修改签收状态，0为签收，1为已签收
create proc proc_Del_voucher (@Del_no varchar(10))
as
	update Delivery set Del_voucher = 1 where Del_no = @Del_no
go

------------------用户需求部分

--存储过程验证用户是否注册过
create proc proc_Cli (@Cli_no char(11), @req int out)
as
	if(@Cli_no in (select Cli_no from Client))
		begin
			set @req = 1   --req为1表示该用户已经注册过了
		end
	else
		begin
			set @req = 0   --0表示未注册
		end

go


--忘记密码，通过用户名和身份证来
create proc proc_forgetPsw(@Cli_no char(11), @Cli_id varchar(18), @new_psw varchar(20), @asnwer int out)
as	
	set @asnwer = 1   --answer等于1表示可以存在该用户，并且可以重置密码
	if((@Cli_no in (select Cli_no from Client)) and (@Cli_id in (select @Cli_id from Client)) )
	begin 
		update Client set Cli_password = @new_psw where Cli_no = @Cli_no
	end
	else
	begin
		set @asnwer = 0  --answer等于0表示该用户不存在，或者用户名和身份证不匹配，不能重置密码
	end
go


--修改密码，通过对比旧密码是否正确，来判断是否可以修改密码
create proc proc_resetPsw(@Cli_no char(11),@old_psw varchar(20), @new_psw varchar(20), @asnwer int out)
as
	if((@Cli_no in (select Cli_no from Client)) and (@old_psw in (select Cli_password from Client)))
	begin 
		update Client set Cli_password = @new_psw where Cli_no = @Cli_no
		set @asnwer = 1   --修改密码成功
	end
	else
	begin
		set @asnwer = 0   --旧密码错误，无法修改密码
	end
go


--查询用户信息
create proc proc_Cli_query(@Cli_no char(11))
as
	select * from Client where Cli_no = @Cli_no
go

--更新用户信息
create proc proc_Cli_update(@Cli_no char(11),@Cli_name varchar(8),@Cli_email varchar(20))
as
	update Client set Cli_name = @Cli_name,Cli_email = @Cli_email
	where Cli_no = @Cli_no
go

--查询某用户购物车中的商品详细信息
create proc proc_Good_quert(@Cli_no char(11))
as
	declare
	@Goo_no varchar(8)
	select @Goo_no = Goo_no from Cart where Cli_no = @Cli_no

	select c.Goo_no 用户,c.Cart_num 购买数量,g.Goo_name 商品名,g.Goo_path 图片路径,g.Goo_detail 商品详细,g.Goo_price 商品单价 from Cart c, Goods g
	where g.Goo_no = @Goo_no and Cli_no = @Cli_no
go

--查询用户所有的地址
create proc proc_Cli_Add (@Cli_no char(11))
as
	select *from Addres where Cli_no = @Cli_no
go

--查询用户的所有订单
create proc proc_For_qiery (@Cli_no char(11))
as
	select *from Form where Cli_no = @Cli_no
go



--添加购物车
create proc proc_Cart_add(@Cli_no char(11),@Goo_no varchar(8),@Cart_num int)
as
	insert into Cart(Goo_no,Cart_num) values(@Cli_no,@Goo_no,@Cart_num)
go


--增加收货地址
create proc proc_Add(@Cli_no char(11),@)
as
	declare 
	@Add_no varchar(8)
	--随机产生配送号
	select @Add_no=cast(floor((rand()*(100000000-10000000)+10000000)) as bigint)  

go

---------------------------商品部分需求

--根据商品类别检索商品
create proc proc_goodClass_query(@Goo_class varchar(8))
as 
	select Goo_price, Goo_path,Goo_name from Goods
	where Goo_class = @Goo_class 
go



--根据商品类别检索商品
create proc proc_good_query(@Goo_no varchar(8))
as 
	select * from Goods where Goo_no = @Goo_no
go


----------------------------员工部分

--根据员工工号和密码查询是否有该员工
create proc proc_Emp_Ver(@Emp_no varchar(6), @Emp_pwd varchar(20),@answer int)
as
	
	if((@Emp_no in (select Emp_no from Employees)) and (@Emp_pwd in (select Emp_pwd from Employees)) )
	begin 
		set @answer = 1   --answer等于1表示该员工账号密码正确
	end
	else
	begin
		set @answer = 0  --answer等于0表示该与员工不存在
	end
go


--员工注册账号
create proc proc_Emp_register(@Emp_no varchar(6),@Emp_pwd varchar(20),@Emp_ID varchar(18),@Emp_name nvarchar(8),@Emp_sex nchar(1),@Emp_birthday datetime,@Dep_no varchar(4))
as
	insert into Employees(Emp_no, Emp_pwd, Emp_ID, Emp_name, Emp_sex, Emp_birthday, Dep_no)
	values(@Emp_no, @Emp_pwd, @Emp_ID, @Emp_name, @Emp_sex, @Emp_birthday, @Dep_no)
go

--员工忘记密码，通过员工编号和身份证来
create proc proc_Emp_forgetPsw(@Emp_no char(6), @Emp_ID varchar(18), @new_psw varchar(20), @answer int out)
as	
	set @answer = 1   --answer等于1表示可以存在该员工，并且可以重置密码
	if((@Emp_no in (select Emp_no from Employees)) and (@Emp_ID in (select Emp_ID from Employees)) )
	begin 
		update Employees set Emp_pwd = @new_psw where Emp_no = @Emp_no
	end
	else
	begin
		set @answer = 0  --answer等于0表示该员工不存在，或者员工编号和身份证不匹配，不能重置密码
	end
go



--查询员工姓名工号和部门号
create proc proc_Emp_query(@Emp_no varchar(6))
as
	select Emp_name,Emp_no,Dep_no from Employees
go



--查询员工分拣任务
create proc proc_Sort_query(@Emp_no varchar(6))
as
	select *from Sort where Emp_no = @Emp_no
go


------管理部
--查询所有用户的信息
create proc proc_allClient_query
as
	select *from Client
go


--查询所有员工的信息
create proc proc_allEmp_query
as
	select *from Employees
go


--查询所有商品的信息
create proc proc_allGoods_query
as
	select *from Goods
go

--查询所有商家的信息
create proc proc_allMer_query
as
	select *from Merchant
go


EXEC dbo.sp_changedbowner N'sql'


