USE �����̳�
exec sp_addtype @typename='telephone',@phystype='varchar(11)',@nulltype='not null';

--�û���
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

--���ﳵ
create table Cart(
	Goo_no varchar(8) not null,				--��Ʒ����
	Cart_num int not null,					--����
	Cli_no telephone not null,				--�˿ͱ���
	constraint PK_Car primary key (Goo_no,Cli_no)				--����Ϊ��Ʒ������˿ͱ������������
)

--����
create table Form(
	For_no varchar(10) not null primary key,			--������
	Cli_no telephone not null,							--�˿ͱ���
	Goo_no varchar(8) not null,							--��Ʒ���
	For_num int not null,								--����
	For_time date default getdate(),					--�µ�ʱ��
	For_pay int default 0,								--֧��״̬
	foreign key(Goo_no) references Goods(Goo_no),				--������Ʒ�����
	foreign key(Cli_no) references Client(Cli_no),				--�����û������
)

--�̼ұ�
create table Merchant(
	Mer_no varchar(8) not null primary key,				--�̼ұ��
	Mer_name nvarchar(16) not null,						--����
	Mer_legal nvarchar(8) not null,						--���˴���
	Mer_address nvarchar(30) not null,					--��ַ
	Mer_phone telephone not null,						--��ϵ�绰
	Mer_email varchar(20),								--����
	constraint CK_Mer_email check(Mer_email is null or (Mer_email like '%@%'))			--������
)

--��Ʒ��
create table Goods(
	Goo_no varchar(8) not null primary key,				--��Ʒ����
	Mer_no varchar(8) not null,							--�̼ұ���
	Goo_name nvarchar(16) not null,						--��Ʒ��
	Goo_price decimal(8,2) not null,					--�۸�
	Goo_detail nvarchar(50) null,						--��Ʒ����
	Store varchar(6) not null,							--�ֿ���
	foreign key(Mer_no) references Merchant(Mer_no)				--�����̼ұ����
)

--Ա����
create table Employees(
	Emp_no varchar(6) not null primary key,			--��Ա���
	Emp_ID varchar(18) not null,					--���֤��
	Emp_name nvarchar(8) not null,					--��Ա��
	Emp_sex  nchar(1) not null,						--��Ա�Ա�
	Emp_birthday datetime not null,					--����
	Dep_no varchar(4) null,							--���ű��
	constraint CK_Emp_sex check(Emp_sex in ('��','Ů')),			--�Ա���
	foreign key(Dep_no) references Department(Dep_no)				--���ò��ű����
)

--�ּ��
create table Sort (
	Sor_no varchar(10) not null primary key,			--�ּ��
	Emp_no varchar(6) not null,							--Ա����
	For_no varchar(10) not null,						--������
	Sor_time datetime not null,							--�ּ�ʱ��
	foreign key(For_no) references Form(For_no),					--���ö��������
	foreign key(Emp_no) references Employees(Emp_no)				--����Ա�������
)

--����
create table Delivery(
	Del_no varchar(10) not null primary key,			--���ͺ�
	Sor_no varchar(10) not null,						--�ּ��
	Emp_no varchar(6) not null,							--Ա�����
	Add_no varchar(8) not null,							--�ջ���
	Del_gotime datetime not null,						--����ʱ��
	Del_gettime datetime not null,						--ǩ��ʱ��
	Del_voucher int not null,							--ǩ��״̬
	foreign key(Sor_no) references Sort(Sor_no),				--���÷ּ�����
	foreign key(Add_no) references Addres(Add_no),				--�����ջ������
	foreign key(Emp_no) references Employees(Emp_no),			--����Ա�������
)

--���ű�
create table Department(
	Dep_no varchar(4) not null primary key,				--���ź�
	Dep_name varchar(30) not null,						--������
	Dep_phone telephone not null						--���ŵ绰
)					

--�ջ���ַ��
create table Addres(
	Add_no varchar(8) not null primary key,				--�ջ���
	Add_name nvarchar(8) not null,						--�ջ���
	Add_detail nvarchar(30) not null,					--�ջ���ַ
	Add_phone telephone not null,						--��ϵ�绰
	Cli_no telephone not null,							--�˿ͱ��
	foreign key(Cli_no) references Client(Cli_no)					--���ù˿ͱ����
)

--���ű��еĲ��ű�Ÿ��£���Ӧ���еĲ��ű�ű��Ҳ���Զ����¡�
alter table Employees
	add constraint FK_Dep_no foreign key(Dep_no) references Department(Dep_no)
	on update cascade;

