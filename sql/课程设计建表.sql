USE 购物商城
exec sp_addtype @typename='telephone',@phystype='varchar(11)',@nulltype='not null';

--用户表
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

--购物车
create table Cart(
	Goo_no varchar(8) not null,				--商品条码
	Cart_num int not null,					--数量
	Cli_no telephone not null,				--顾客编码
	constraint PK_Car primary key (Goo_no,Cli_no)				--主键为商品条码与顾客编码的联合主键
)

--订单
create table Form(
	For_no varchar(10) not null primary key,			--订单号
	Cli_no telephone not null,							--顾客编码
	Goo_no varchar(8) not null,							--商品编号
	For_num int not null,								--数量
	For_time date default getdate(),					--下单时间
	For_pay int default 0,								--支付状态
	foreign key(Goo_no) references Goods(Goo_no),				--引用商品表外键
	foreign key(Cli_no) references Client(Cli_no),				--引用用户表外键
)

--商家表
create table Merchant(
	Mer_no varchar(8) not null primary key,				--商家编号
	Mer_name nvarchar(16) not null,						--店名
	Mer_legal nvarchar(8) not null,						--法人代表
	Mer_address nvarchar(30) not null,					--地址
	Mer_phone telephone not null,						--联系电话
	Mer_email varchar(20),								--邮箱
	constraint CK_Mer_email check(Mer_email is null or (Mer_email like '%@%'))			--邮箱检查
)

--商品表
create table Goods(
	Goo_no varchar(8) not null primary key,				--商品编码
	Mer_no varchar(8) not null,							--商家编码
	Goo_name nvarchar(16) not null,						--商品名
	Goo_price decimal(8,2) not null,					--价格
	Goo_detail nvarchar(50) null,						--商品介绍
	Store varchar(6) not null,							--仓库编号
	foreign key(Mer_no) references Merchant(Mer_no)				--引用商家表外键
)

--员工表
create table Employees(
	Emp_no varchar(6) not null primary key,			--雇员编号
	Emp_ID varchar(18) not null,					--身份证号
	Emp_name nvarchar(8) not null,					--雇员名
	Emp_sex  nchar(1) not null,						--雇员性别
	Emp_birthday datetime not null,					--生日
	Dep_no varchar(4) null,							--部门编号
	constraint CK_Emp_sex check(Emp_sex in ('男','女')),			--性别检查
	foreign key(Dep_no) references Department(Dep_no)				--引用部门表外键
)

--分拣表
create table Sort (
	Sor_no varchar(10) not null primary key,			--分拣号
	Emp_no varchar(6) not null,							--员工号
	For_no varchar(10) not null,						--订单号
	Sor_time datetime not null,							--分拣时间
	foreign key(For_no) references Form(For_no),					--引用订单表外键
	foreign key(Emp_no) references Employees(Emp_no)				--引用员工表外键
)

--配送
create table Delivery(
	Del_no varchar(10) not null primary key,			--配送号
	Sor_no varchar(10) not null,						--分拣号
	Emp_no varchar(6) not null,							--员工编号
	Add_no varchar(8) not null,							--收货号
	Del_gotime datetime not null,						--配送时间
	Del_gettime datetime not null,						--签收时间
	Del_voucher int not null,							--签收状态
	foreign key(Sor_no) references Sort(Sor_no),				--引用分拣表外键
	foreign key(Add_no) references Addres(Add_no),				--引用收货表外键
	foreign key(Emp_no) references Employees(Emp_no),			--引用员工表外键
)

--部门表
create table Department(
	Dep_no varchar(4) not null primary key,				--部门号
	Dep_name varchar(30) not null,						--部门名
	Dep_phone telephone not null						--部门电话
)					

--收货地址表
create table Addres(
	Add_no varchar(8) not null primary key,				--收货号
	Add_name nvarchar(8) not null,						--收货人
	Add_detail nvarchar(30) not null,					--收货地址
	Add_phone telephone not null,						--联系电话
	Cli_no telephone not null,							--顾客编号
	foreign key(Cli_no) references Client(Cli_no)					--引用顾客表外键
)

--部门表中的部门编号更新，相应表中的部门编号编号也能自动更新。
alter table Employees
	add constraint FK_Dep_no foreign key(Dep_no) references Department(Dep_no)
	on update cascade;

