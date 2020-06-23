USE �����̳�
exec sp_addtype @typename='telephone',@phystype='varchar(11)',@nulltype='not null';

--�û���--------------------------------------------------------------------------------------
create table Client(
	Cli_no telephone not null primary key,	--�˿ͱ���
	Cli_name nvarchar(8) not null,			--����
	Cli_sex nchar(1) not null,				--�Ա�
	Cli_id varchar(18) not null,			--���֤��
	Cli_email varchar(20),					--����
	Cli_password varchar(20) not null,		--����
	Cli_birthday date,						--����
	constraint CK_Cli_sex check (Cli_sex in ('��','Ů')),							--����Ա�
	constraint CK_Cli_email check(Cli_email is null or (Cli_email like '%@%'))		--�������
)

--�̼ұ�--------------------------------------------------------------------------------------
create table Merchant(
	Mer_no varchar(8) not null primary key,				--�̼ұ��
	Mer_name nvarchar(16) not null,						--����
	Mer_legal nvarchar(8) not null,						--���˴���
	Mer_address nvarchar(30) not null,					--��ַ
	Mer_phone telephone not null,						--��ϵ�绰
	Mer_email varchar(20),								--����
	Cli_pwd varchar(20) not null,						--����
	constraint CK_Mer_email check(Mer_email is null or (Mer_email like '%@%'))			--������
)

--��Ʒ��--------------------------------------------------------------------------------------
create table Goods(
	Goo_no varchar(8) not null primary key,				--��Ʒ����
	Mer_no varchar(8) not null,							--�̼ұ���
	Goo_name nvarchar(16) not null,						--��Ʒ��
	Goo_price decimal(8,2) not null,					--�۸�
	Goo_detail nvarchar(50) null,						--��Ʒ����
	Store varchar(6) not null,							--�ֿ���
	Goo_class varchar(8) not null,						--��Ʒ���
	Goo_img varchar(40) not null,						--��ƷͼƬ��ַ
	foreign key(Mer_no) references Merchant(Mer_no)				--�����̼ұ����
)

--ɾ���̼ң�����Ʒһͬ�¼�------------------------------------------------------------------
alter table Goods
	add constraint FK_Mer_no foreign key(Mer_no) references Merchant(Mer_no)
	on delete cascade;


--���ﳵ------------------------------------------------------------------------------------
create table Cart(
	Goo_no varchar(8) not null,				--��Ʒ����
	Cart_num int not null,					--����
	Cli_no telephone not null,				--�˿ͱ���
	constraint PK_Car primary key (Goo_no,Cli_no)				--����Ϊ��Ʒ������˿ͱ������������
)

--�û�ע�������ﳵ��������һͬ���---------------------------------------------------------
alter table Cart
	add constraint FK_Cart_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--��Ʒ�¼ܣ����ﳵ��������һͬ���---------------------------------------------------------
alter table Cart
	add constraint FK_Cart_Goo_no foreign key(Goo_no) references Goods(Goo_no)
	on delete cascade;

--�ջ���ַ��--------------------------------------------------------------------------------
create table Addres(
	Add_no varchar(8) not null primary key,				--�ջ���
	Add_name nvarchar(8) not null,						--�ջ���
	Add_detail nvarchar(30) not null,					--�ջ���ַ
	Add_phone telephone not null,						--��ϵ�绰
	Cli_no telephone not null,							--�˿ͱ��
	foreign key(Cli_no) references Client(Cli_no)					--���ù˿ͱ����
)

--�û�ע�����ջ���ַ����һͬ���--------------------------------------------------------------
alter table Addres
	add constraint FK_Addres_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--����----------------------------------------------------------------------------------------
create table Form(
	For_no varchar(10) not null primary key,			--������
	Cli_no telephone not null,							--�˿ͱ���
	Goo_no varchar(8) not null,							--��Ʒ���
	For_num int not null,								--����
	For_time date default getdate(),					--�µ�ʱ��
	For_pay int default 0,								--֧��״̬
	Add_no varchar(8),									--�ջ���
	foreign key(Goo_no) references Goodsbak(Goo_no),				--������Ʒ�����
	foreign key(Cli_no) references Client(Cli_no),				--�����û������
	foreign key(Add_no) references Addressbak(Add_no)				--���õ�ַ�����
)

--�û�ע�������ﳵ��������һͬ���------------------------------------------------------------
alter table Form
	add constraint FK_Form_Cli_no foreign key(Cli_no) references Client(Cli_no)
	on delete cascade;

--���ű�--------------------------------------------------------------------------------------
create table Department(
	Dep_no varchar(4) not null primary key,				--���ź�
	Dep_name varchar(30) not null,						--������
	Dep_phone telephone not null						--���ŵ绰
)	

--Ա����--------------------------------------------------------------------------------------
create table Employees(
	Emp_no varchar(6) not null primary key,			--��Ա���
	Emp_ID varchar(18) not null,					--���֤��
	Emp_name nvarchar(8) not null,					--��Ա��
	Emp_sex  nchar(1) not null,						--��Ա�Ա�
	Emp_birthday datetime not null,					--����
	Dep_no varchar(4) null,							--���ű��
	Emp_pwd varchar(20) not null,					--��¼����
	constraint CK_Emp_sex check(Emp_sex in ('��','Ů')),			--�Ա���
	foreign key(Dep_no) references Department(Dep_no)				--���ò��ű����
)

--���ű��еĲ��ű�Ÿ��£���Ӧ���еĲ��ű�ű��Ҳ���Զ����¡�-------------------------------
alter table Employees
	add constraint FK_Emp_Dep_no foreign key(Dep_no) references Department(Dep_no)
	on update cascade;

--�ּ��-------------------------------------------------------------------------------------
create table Sort (
	Sor_no varchar(10) not null primary key,			--�ּ��
	Emp_no varchar(6) not null,							--Ա����
	For_no varchar(10) not null,						--������
	Sor_time datetime not null,							--�ּ�ʱ��
	Sor_state int ,										--�ּ�״̬
	foreign key(For_no) references Form(For_no),					--���ö��������
	foreign key(Emp_no) references Employees(Emp_no)				--����Ա�������
)

--����ȡ�����ּ���Ϣһͬɾ��-----------------------------------------------------------------
alter table Sort
	add constraint FK_Sort_For_no foreign key(For_no) references Form(For_no)
	on delete cascade;


--����---------------------------------------------------------------------------------------
create table Delivery(
	Del_no varchar(10) not null primary key,			--���ͺ�
	Sor_no varchar(10) not null,						--�ּ��
	Emp_no varchar(6) not null,							--Ա�����
	Add_no varchar(8) not null,							--�ջ���
	Del_gotime datetime not null,						--����ʱ��
	Del_gettime datetime not null,						--ǩ��ʱ��
	Del_voucher int not null,							--ǩ��״̬
	Del_status int not null,							--����״̬
	foreign key(Sor_no) references Sort(Sor_no),				--���÷ּ�����
	foreign key(Add_no) references Addressbak(Add_no),				--�����ջ������
	foreign key(Emp_no) references Employees(Emp_no),			--����Ա�������
)	

--����ȡ����������Ϣһͬɾ��-------------------------------------------------------------------
alter table Delivery
	add constraint FK_Del_Sor_no foreign key(Sor_no) references Sort(Sor_no)
	on delete cascade;

---------------��������---------------
--���ű�
insert into Department  values( '1101', '���Ͳ�','13754979541')
insert into Department  values( '1102', '�ּ�','13678456756')
insert into Department values('1111','����Ա','13646086499')
----------------------------------------------------

--1.��ַ���ݣ���ֹ�û�ɾ����ַ��Ϣ��Ա�����޵�ַ��Ϣ�������ַ�ı��Ψһ�Լ��������ǰ��
select * into AddressBak from Addres
where 1=2
go
create trigger tri_address
on addres after insert
as
begin
	declare
	@Add_no varchar(8),										--��ַ���
	@Add_name nvarchar(8),										--�ռ���
	@Add_detail nchar(30),									--��ַ��Ϣ
	@Add_phone varchar(11),									--�ռ�����
	@Cli_no telephone										--�û����
	select @Add_no = Add_no, @Add_name = Add_name,@Add_detail = Add_detail, @Add_phone = Add_phone,@Cli_no=Cli_no 
	from inserted											--�Ӳ�����л�ȡ����Ϣ
	insert into AddressBak (Add_no,Add_name,Add_detail,Add_phone,Cli_no) values(@Add_no,@Add_name,@Add_detail,@Add_phone,@Cli_no)
end
go

------��������-----------------------------------------------------------------------
drop trigger tri_address
--�����ַ���ݣ��鿴���ݱ��Ƿ����ֶ�Ӧ����
insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','����','Ů','168413199808170054','1984987564@163.com','373555','1998-08-17')
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','����','����ʡ�����м�����ѧ','12527245577','12527245577')
delete from Addres where Add_no='65748752'
delete from AddressBak where Add_no='65748752'

select * from Addres
select * from AddressBak


-----2ɾ���û�����Ӧ��Ϣһͬɾ��---��������------
insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','����','Ů','168413199808170054','1984987564@163.com','373555','1998-08-17')
delete from Client where Cli_no='12527245577'
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','����','����ʡ�����м�����ѧ','12527245577','12527245577')
insert into Merchant(Mer_no ,Mer_name,Mer_legal,Mer_address,Mer_phone,Mer_email) values('22412785','���Դ����רӪ��','���Դ','��������','18762057961','3783783@qq.com')
insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img) values('CZ889488','22412785','С���ֻ�4','69.00','С���ֻ�4nfc4��5ȫ�����Ӳ�������������֧���ֻ���Ůʿ�����˶��ֱ�','235896','�ֱ�','../img/picture/026.jpg')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Cart(Goo_no,Cart_num,Cli_no) values('CZ889488','1','12527245577')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201899','161658200001235791','�Ϻ�','��','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201897','161658200001225791','�϶�','��','2000-01-22','1101','123456')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values('BUY4368668','9525876642','201897','65748752','2020-01-03 00:00:00.000','2020-01-08 00:00:00.000','0','1')

select * from Client
select * from Addres
select * from Cart
select * from Form
select * from Sort
select * from Delivery


--2.�Զ����ɶ���ʱ��--------------------------------����ǰ�˲������ݲ������ʱ�䣬�ʶ����ô������ķ�ʽ��ʱ�����Ϊ��ǰʱ��
go
create trigger tri_insert_form
on Form after insert
as
	declare
	@For_no varchar(10)

	select @For_no = For_no from inserted
	update Form set For_time = getdate() where For_no = @For_no
go

--3.���ɶ���ɾ�����ﳵ��Ϣ----------------------------------------------------
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

---------��������-------

insert into Client(Cli_no,Cli_name,Cli_sex,Cli_id,Cli_email,Cli_password,Cli_birthday) values('12527245577','����','Ů','168413199808170054','1984987564@163.com','373555','1998-08-17')
insert into Addres(Add_no,Add_name,Add_detail,Add_phone,Cli_no) values('65748752','����','����ʡ�����м�����ѧ','12527245577','12527245577')

insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Cart(Goo_no,Cart_num,Cli_no) values('CZ889488','1','12527245577')
delete from Cart where Goo_no='CZ889488'
delete from Form where Goo_no='CZ889488'
select * from Cart
select * from Form

--4.����ּ�Ա����������ʱ���Զ����䵱ǰ��������С�ķּ�Ա--------------------------------------------------------------------------------
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
	--��������ּ��
	select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
	if(@Sor_no in (select Sor_no from Sort))
	begin
		select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
	end
	
	--��ȡ��ǰ�����Ķ�����
	select @for_no = For_no from inserted



	--���ҳ���ǰ��������С�ķּ�Ա
	create table temp       --�½�һ�����Ź�������СԱ������Ϣ
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

	--��������СԱ����Ա����
	select @emp_no=Emp_no from temp 
	--ɾ���м��    
	drop table temp

	insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values(@Sor_no,@emp_no,@for_no,getdate(),0)   --Ĭ�����÷ּ�״̬Ϊ0��δ�ּ�
end
go

-----��������---------

insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
delete from Form where For_no='8082870722'
delete from Sort where Sor_no='5073419640'
select * from Form
select * from Sort
select * from Delivery


--��Ʒ�ϼ�ʱ�����ϼ���Ʒ����Goodsbak����ʱ�����¼��ˣ���ɲ�ѯ������Ʒ------------------------------------------------------------------------------------------------
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

--------��������--------------------

insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img) values('CZ889488','22412785','С���ֻ�4','69.00','С���ֻ�4nfc4��5ȫ�����Ӳ�������������֧���ֻ���Ůʿ�����˶��ֱ�','235896','�ֱ�','../img/picture/026.jpg')
delete from Goods where Goo_no='CZ889488'
delete from Goodsbak where Goo_no='CZ889488'
select * from Goods
select * from Goodsbak

--��������Ա���жϷּ�Ա�Ƿ�ּ���ϣ����ּ�����Զ����䵱ǰ��������С������Ա----------------------------------------------------------
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
	if(@Sor_statu = 1)     --�ж��Ƿ�ּ����
	begin
		--����������ͺ�
		select @Del_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
		if(@Del_no in (select Del_no from Delivery))
		begin
			select @Del_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
		end

		--�ּ�ÿ�ݵķּ��
		select @Sor_no = Sor_no from inserted

		--��ȡ�ö����Ŀͻ���ַ���
		declare @For_no varchar(10)
		select @For_no = For_no from Sort where Sor_no = @Sor_no 

		select @Add_no = Add_no from Form 
		where For_no = @For_no 

		create table temp       --�½�һ�����Ź�������СԱ������Ϣ
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

		--��������СԱ����Ա����
		select @emp_no=Emp_no from temp 
		--ɾ���м��    
		drop table temp

		--��ӵ����ͱ��У���������״̬δ0��ʾδ���ͣ�ǩ�տ���Ϊ0��ʾδǩ��
		insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values(@Del_no,@Sor_no,@emp_no,@Add_no,GETDATE(),null,0,0)
	end

end
go

------��������---------
insert into Goods(Goo_no,Mer_no,Goo_name,Goo_price,Goo_detail,Store,Goo_class ,Goo_img)
values('CZ889488','22412785','С���ֻ�4','69.00','С���ֻ�4nfc4��5ȫ�����Ӳ�������������֧���ֻ���Ůʿ�����˶��ֱ�','235896','�ֱ�','../img/picture/026.jpg')
insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
select * from Sort
update Sort set Sor_state=1 where Sor_no='3032194071'
update Sort set Sor_state=0 where Sor_no='3032194071'
select * from Delivery
select * from Form


------�洢����ʵ��Ա����ְ�����·����Ա���Ĺ���----------------------------------------------------------------
go
drop proc proc_newWork
go

create proc proc_newWork (@Emp_no varchar(6))
as
begin
	declare @Dep_no varchar(4)
	--��ѯ��Ա���Ĳ���
	select @Dep_no = Dep_no from Employees where Emp_no = @Emp_no
	
	declare 
	@for_no varchar(10),    --������
	@old_Sor_no varchar(10),--�ɵķּ��
	@Sor_no varchar(10),    --�ּ��
	@Sor_state int,         --�ּ�״̬
	@new_emp_no varchar(6), --
	@Del_no varchar(10),    --���ͺ�
	@Del_voucher int,		--ǩ��״̬
	@Del_status int,		--����״̬
	@Add_no varchar(8),     --��ַ
	@n int       --ѭ������
	declare @tep_Emp_no char(6), @total int  --�м��
	--�ж���ְ��Ա���������ĸ�����
	if(@Dep_no = '1102')  
	begin
		--���ҳ�ɾ���ķּ�Ա�ķּ���������
		select @n = count(Sor_no) from Sort where Emp_no = @Emp_no 
		
		while @n>0
		begin
			--��ȡ��ְ�ķּ�Ա������һ���ּ���Ϣ�ķּ�źͶ�����
			select top 1 @for_no = For_no ,@old_Sor_no = Sor_no,@Sor_state = Sor_state from Sort  where Emp_no = @Emp_no  
			
			--------���ҳ���ǰ��������С�ķּ�Ա
			create table temp       --�½�һ�����Ź�������СԱ������Ϣ
			(	
				Emp_no varchar(6),
				total int
			)
			select top 1 @tep_Emp_no=e.Emp_no,@total=count( s.Sor_no) from Employees e left join Sort s on e.Emp_no=s.Emp_no
						where e.Dep_no = '1102' and  e.Emp_no != @Emp_no
						group by e.Emp_no
						order by count(s.Sor_no) 

			insert into temp(Emp_no,total) values(@tep_Emp_no,@total)
			--��������СԱ����Ա����
			select @new_emp_no=Emp_no from temp 
			--ɾ���м��    
			drop table temp

			--�������ɷּ��
			select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)   
			if(@Sor_no in (select Sor_no from Sort))
			begin
				select @Sor_no=cast(floor((rand()*(10000000000-1000000000)+1000000000)) as bigint)
			end

			--���·���δ��ɵķּ�����������ּ�Ա
			
			insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values(@Sor_no,@new_emp_no,@for_no,getdate(),@Sor_state)

			--���ڸ����˷ּ�Ա����˸������ͱ��ҳ��ּ�Ŷ�Ӧ�����͵�
			if(@old_Sor_no in (select Sor_no from Delivery))
			begin
				select @Del_no = Del_no from Delivery where Sor_no = @old_Sor_no
				update Delivery set Sor_no = @Sor_no where Del_no = @Del_no
			end

			--ɾ������ְ�ּ�Ա�ķּ���Ϣ
			delete from Sort where  Sor_no = @old_Sor_no

			set @n = @n -1
		end

		--���·��乤���Ժ󣬽�����ְԱ����Ա������ɾ��
		delete from Employees where Emp_no = @Emp_no
		end

		else if(@Dep_no = '1101')
		begin
		--���ҳ�ɾ��������ԱԱ��������������
		select @n = count(Del_no) from Delivery where Emp_no = @Emp_no 
		
		while @n>0
		begin
			--��ȡ��ְ������Ա������һ���ּ���Ϣ�����ͺš��ּ�š�ǩ��״̬������״̬����ַ
			select top 1 @Del_no = Del_no ,@Sor_no = Sor_no,@Add_no = Add_no,@Del_voucher = Del_voucher ,@Del_status = Del_status from Delivery  where Emp_no = @Emp_no   

			--���ҵ�ǰ��������С������Ա
			create table temp       --�½�һ�����Ź�������СԱ������Ϣ
			(	
				Emp_no varchar(6),
				total int
			)
			
			select top 1 @tep_Emp_no=e.Emp_no,@total=count( d.Sor_no) from Employees e left join Delivery d on e.Emp_no=d.Emp_no
						where e.Dep_no = '1101' and  e.Emp_no != @Emp_no
						group by e.Emp_no
						order by count( d.Sor_no)  

			insert into temp(Emp_no,total) values(@tep_Emp_no,@total)
			--��������СԱ����Ա����
			select @new_emp_no=Emp_no from temp 
			--ɾ���м��    
			drop table temp
			--���·���δ��ɵ������������������Ա
			update Delivery set Emp_no = @new_emp_no where Del_no = @Del_no
			set @n = @n -1
		end

		--���·������͹����Ժ󣬽�����ְԱ����Ա������ɾ��
		delete from Employees where Emp_no = @Emp_no
	end

	--�����������ԱҲ���Ƿּ�Ա��ֱ�Ӵ�Ա������ɾ��
	else
	begin
		delete from Employees where Emp_no = @Emp_no
	end
end
go


------------��������--------------------------


select * from Employees
select * from Sort
select * from Delivery

insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201899','161658200001235791','�Ϻ�','��','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201897','161658200001225791','�϶�','��','2000-01-22','1101','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201879','161658200001235791','�Ϻ�2','��','2000-01-23','1102','123456')
insert into Employees(Emp_no,Emp_ID,Emp_name,Emp_sex,Emp_birthday,Dep_no,Emp_pwd) values('201877','161658200001225791','�϶�2','��','2000-01-22','1101','123456')

insert into Form(For_no,Cli_no,Goo_no,For_num,For_time,For_pay,Add_no) values('8082870722','12527245577','CZ889488','1','2020-01-01','1','65748752')
insert into Delivery(Del_no,Sor_no,Emp_no,Add_no,Del_gotime,Del_gettime,Del_voucher,Del_status) values('BUY4368668','9525876642','201897','65748752','2020-01-03 00:00:00.000','2020-01-08 00:00:00.000','0','1')


insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876642','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876643','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876644','201899','8082870722','2020-01-02 00:00:00.000','1')
insert into Sort(Sor_no,Emp_no,For_no,Sor_time,Sor_state) values('9525876645','201899','8082870722','2020-01-02 00:00:00.000','1')

exec proc_newWork '201899'


--12.���͵���ʱ���Զ������ʹ�ʱ��
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


--------------------------------------------------------�ֽ���---------------------------------------------------------------





--5.�޸ķּ�״̬��0Ϊ��û�зּ���ϣ�1Ϊ�ּ����
go
create proc proc_form_ststu (@Sor_no varchar(10))
as
	update Sort set Sor_state = 1 where Sor_no = @Sor_no
go

--6.�޸�����״̬��0Ϊδ���ͣ�1Ϊ�������ͣ�2Ϊ���ʹ�
create proc proc_Del_ststu (@Del_no varchar(10),@Del_status int)
as
	update Delivery set Del_status = @Del_status where Del_no = @Del_no
go

--7.�޸�ǩ��״̬��0Ϊǩ�գ�1Ϊ��ǩ��
create proc proc_Del_voucher (@Del_no varchar(10))
as
	update Delivery set Del_voucher = 1 where Del_no = @Del_no
go

------------------�û����󲿷�

--�洢������֤�û��Ƿ�ע���
create proc proc_Cli (@Cli_no char(11), @req int out)
as
	if(@Cli_no in (select Cli_no from Client))
		begin
			set @req = 1   --reqΪ1��ʾ���û��Ѿ�ע�����
		end
	else
		begin
			set @req = 0   --0��ʾδע��
		end

go


--�������룬ͨ���û��������֤��
create proc proc_forgetPsw(@Cli_no char(11), @Cli_id varchar(18), @new_psw varchar(20), @asnwer int out)
as	
	set @asnwer = 1   --answer����1��ʾ���Դ��ڸ��û������ҿ�����������
	if((@Cli_no in (select Cli_no from Client)) and (@Cli_id in (select @Cli_id from Client)) )
	begin 
		update Client set Cli_password = @new_psw where Cli_no = @Cli_no
	end
	else
	begin
		set @asnwer = 0  --answer����0��ʾ���û������ڣ������û��������֤��ƥ�䣬������������
	end
go


--�޸����룬ͨ���ԱȾ������Ƿ���ȷ�����ж��Ƿ�����޸�����
create proc proc_resetPsw(@Cli_no char(11),@old_psw varchar(20), @new_psw varchar(20), @asnwer int out)
as
	if((@Cli_no in (select Cli_no from Client)) and (@old_psw in (select Cli_password from Client)))
	begin 
		update Client set Cli_password = @new_psw where Cli_no = @Cli_no
		set @asnwer = 1   --�޸�����ɹ�
	end
	else
	begin
		set @asnwer = 0   --����������޷��޸�����
	end
go


--��ѯ�û���Ϣ
create proc proc_Cli_query(@Cli_no char(11))
as
	select * from Client where Cli_no = @Cli_no
go

--�����û���Ϣ
create proc proc_Cli_update(@Cli_no char(11),@Cli_name varchar(8),@Cli_email varchar(20))
as
	update Client set Cli_name = @Cli_name,Cli_email = @Cli_email
	where Cli_no = @Cli_no
go

--��ѯĳ�û����ﳵ�е���Ʒ��ϸ��Ϣ
create proc proc_Good_quert(@Cli_no char(11))
as
	declare
	@Goo_no varchar(8)
	select @Goo_no = Goo_no from Cart where Cli_no = @Cli_no

	select c.Goo_no �û�,c.Cart_num ��������,g.Goo_name ��Ʒ��,g.Goo_path ͼƬ·��,g.Goo_detail ��Ʒ��ϸ,g.Goo_price ��Ʒ���� from Cart c, Goods g
	where g.Goo_no = @Goo_no and Cli_no = @Cli_no
go

--��ѯ�û����еĵ�ַ
create proc proc_Cli_Add (@Cli_no char(11))
as
	select *from Addres where Cli_no = @Cli_no
go

--��ѯ�û������ж���
create proc proc_For_qiery (@Cli_no char(11))
as
	select *from Form where Cli_no = @Cli_no
go



--��ӹ��ﳵ
create proc proc_Cart_add(@Cli_no char(11),@Goo_no varchar(8),@Cart_num int)
as
	insert into Cart(Goo_no,Cart_num) values(@Cli_no,@Goo_no,@Cart_num)
go


--�����ջ���ַ
create proc proc_Add(@Cli_no char(11),@)
as
	declare 
	@Add_no varchar(8)
	--����������ͺ�
	select @Add_no=cast(floor((rand()*(100000000-10000000)+10000000)) as bigint)  

go

---------------------------��Ʒ��������

--������Ʒ��������Ʒ
create proc proc_goodClass_query(@Goo_class varchar(8))
as 
	select Goo_price, Goo_path,Goo_name from Goods
	where Goo_class = @Goo_class 
go



--������Ʒ��������Ʒ
create proc proc_good_query(@Goo_no varchar(8))
as 
	select * from Goods where Goo_no = @Goo_no
go


----------------------------Ա������

--����Ա�����ź������ѯ�Ƿ��и�Ա��
create proc proc_Emp_Ver(@Emp_no varchar(6), @Emp_pwd varchar(20),@answer int)
as
	
	if((@Emp_no in (select Emp_no from Employees)) and (@Emp_pwd in (select Emp_pwd from Employees)) )
	begin 
		set @answer = 1   --answer����1��ʾ��Ա���˺�������ȷ
	end
	else
	begin
		set @answer = 0  --answer����0��ʾ����Ա��������
	end
go


--Ա��ע���˺�
create proc proc_Emp_register(@Emp_no varchar(6),@Emp_pwd varchar(20),@Emp_ID varchar(18),@Emp_name nvarchar(8),@Emp_sex nchar(1),@Emp_birthday datetime,@Dep_no varchar(4))
as
	insert into Employees(Emp_no, Emp_pwd, Emp_ID, Emp_name, Emp_sex, Emp_birthday, Dep_no)
	values(@Emp_no, @Emp_pwd, @Emp_ID, @Emp_name, @Emp_sex, @Emp_birthday, @Dep_no)
go

--Ա���������룬ͨ��Ա����ź����֤��
create proc proc_Emp_forgetPsw(@Emp_no char(6), @Emp_ID varchar(18), @new_psw varchar(20), @answer int out)
as	
	set @answer = 1   --answer����1��ʾ���Դ��ڸ�Ա�������ҿ�����������
	if((@Emp_no in (select Emp_no from Employees)) and (@Emp_ID in (select Emp_ID from Employees)) )
	begin 
		update Employees set Emp_pwd = @new_psw where Emp_no = @Emp_no
	end
	else
	begin
		set @answer = 0  --answer����0��ʾ��Ա�������ڣ�����Ա����ź����֤��ƥ�䣬������������
	end
go



--��ѯԱ���������źͲ��ź�
create proc proc_Emp_query(@Emp_no varchar(6))
as
	select Emp_name,Emp_no,Dep_no from Employees
go



--��ѯԱ���ּ�����
create proc proc_Sort_query(@Emp_no varchar(6))
as
	select *from Sort where Emp_no = @Emp_no
go


------����
--��ѯ�����û�����Ϣ
create proc proc_allClient_query
as
	select *from Client
go


--��ѯ����Ա������Ϣ
create proc proc_allEmp_query
as
	select *from Employees
go


--��ѯ������Ʒ����Ϣ
create proc proc_allGoods_query
as
	select *from Goods
go

--��ѯ�����̼ҵ���Ϣ
create proc proc_allMer_query
as
	select *from Merchant
go


EXEC dbo.sp_changedbowner N'sql'


