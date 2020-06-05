/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2020/5/11 10:57:24                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Address') and o.name = 'FK_ADDRESS_MODIFY_CLIENT')
alter table Address
   drop constraint FK_ADDRESS_MODIFY_CLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Cart') and o.name = 'FK_CART_Ìí¼Ó_CLIENT')
alter table Cart
   drop constraint FK_CART_Ìí¼Ó_CLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Communication') and o.name = 'FK_COMMUNIC_COMMUNICA_MERCHANT')
alter table Communication
   drop constraint FK_COMMUNIC_COMMUNICA_MERCHANT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Communication') and o.name = 'FK_COMMUNIC_COMMUNICA_CLIENT')
alter table Communication
   drop constraint FK_COMMUNIC_COMMUNICA_CLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Delivery') and o.name = 'FK_DELIVERY_DEL_SUBJE_EMPLOYEE')
alter table Delivery
   drop constraint FK_DELIVERY_DEL_SUBJE_EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Delivery') and o.name = 'FK_DELIVERY_ACCORDING_ADDRESS')
alter table Delivery
   drop constraint FK_DELIVERY_ACCORDING_ADDRESS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Delivery') and o.name = 'FK_DELIVERY_GET_GOODS_SORT')
alter table Delivery
   drop constraint FK_DELIVERY_GET_GOODS_SORT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Employees') and o.name = 'FK_EMPLOYEE_SUBJECTIO_DEPARTME')
alter table Employees
   drop constraint FK_EMPLOYEE_SUBJECTIO_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Form') and o.name = 'FK_FORM_CONFIRM_CLIENT')
alter table Form
   drop constraint FK_FORM_CONFIRM_CLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Form') and o.name = 'FK_FORM_GENERATE_CART')
alter table Form
   drop constraint FK_FORM_GENERATE_CART
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Goods') and o.name = 'FK_GOODS_MANAGE_MERCHANT')
alter table Goods
   drop constraint FK_GOODS_MANAGE_MERCHANT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Sort') and o.name = 'FK_SORT_SOR_SUBJE_EMPLOYEE')
alter table Sort
   drop constraint FK_SORT_SOR_SUBJE_EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Sort') and o.name = 'FK_SORT_DISTRIBUT_FORM')
alter table Sort
   drop constraint FK_SORT_DISTRIBUT_FORM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"browse"') and o.name = 'FK_BROWSE_BROWSE_CLIENT')
alter table "browse"
   drop constraint FK_BROWSE_BROWSE_CLIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"browse"') and o.name = 'FK_BROWSE_BROWSE2_GOODS')
alter table "browse"
   drop constraint FK_BROWSE_BROWSE2_GOODS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Address')
            and   name  = 'modify_FK'
            and   indid > 0
            and   indid < 255)
   drop index Address.modify_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Address')
            and   type = 'U')
   drop table Address
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Cart')
            and   name  = 'Ìí¼Ó_FK'
            and   indid > 0
            and   indid < 255)
   drop index Cart.Ìí¼Ó_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Cart')
            and   type = 'U')
   drop table Cart
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Client')
            and   type = 'U')
   drop table Client
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Communication')
            and   name  = 'Communication2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Communication.Communication2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Communication')
            and   name  = 'Communication_FK'
            and   indid > 0
            and   indid < 255)
   drop index Communication.Communication_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Communication')
            and   type = 'U')
   drop table Communication
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Delivery')
            and   name  = 'get_Goods_FK'
            and   indid > 0
            and   indid < 255)
   drop index Delivery.get_Goods_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Delivery')
            and   name  = 'Del_subjection_FK'
            and   indid > 0
            and   indid < 255)
   drop index Delivery.Del_subjection_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Delivery')
            and   name  = 'according_FK'
            and   indid > 0
            and   indid < 255)
   drop index Delivery.according_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Delivery')
            and   type = 'U')
   drop table Delivery
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Department')
            and   type = 'U')
   drop table Department
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Employees')
            and   name  = 'subjection_FK'
            and   indid > 0
            and   indid < 255)
   drop index Employees.subjection_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Employees')
            and   type = 'U')
   drop table Employees
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Form')
            and   name  = 'confirm_FK'
            and   indid > 0
            and   indid < 255)
   drop index Form.confirm_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Form')
            and   name  = 'generate_FK'
            and   indid > 0
            and   indid < 255)
   drop index Form.generate_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Form')
            and   type = 'U')
   drop table Form
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Goods')
            and   name  = 'manage_FK'
            and   indid > 0
            and   indid < 255)
   drop index Goods.manage_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Goods')
            and   type = 'U')
   drop table Goods
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Merchant')
            and   type = 'U')
   drop table Merchant
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Sort')
            and   name  = 'Sor_subjection_FK'
            and   indid > 0
            and   indid < 255)
   drop index Sort.Sor_subjection_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Sort')
            and   name  = 'distribution_FK'
            and   indid > 0
            and   indid < 255)
   drop index Sort.distribution_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sort')
            and   type = 'U')
   drop table Sort
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"browse"')
            and   name  = 'browse2_FK'
            and   indid > 0
            and   indid < 255)
   drop index "browse".browse2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"browse"')
            and   name  = 'browse_FK'
            and   indid > 0
            and   indid < 255)
   drop index "browse".browse_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"browse"')
            and   type = 'U')
   drop table "browse"
go

/*==============================================================*/
/* Table: Address                                               */
/*==============================================================*/
create table Address (
   Add_no               varchar(8)           not null,
   Cli_no               char(11)             null,
   Add_name             nchar(8)             not null,
   Add_detail           nchar(30)            not null,
   Add_phone            varchar(11)          not null,
   constraint PK_ADDRESS primary key nonclustered (Add_no)
)
go

/*==============================================================*/
/* Index: modify_FK                                             */
/*==============================================================*/
create index modify_FK on Address (
Cli_no ASC
)
go

/*==============================================================*/
/* Table: Cart                                                  */
/*==============================================================*/
create table Cart (
   Good_no              varchar(8)           not null,
   Cart_num             int                  not null,
   Cli_no               char(11)             null,
   constraint PK_CART primary key nonclustered (Good_no, Cart_num)
)
go

/*==============================================================*/
/* Index: Ìí¼Ó_FK                                                 */
/*==============================================================*/
create index Ìí¼Ó_FK on Cart (
Cli_no ASC
)
go

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client (
   Cli_no               char(11)             not null,
   Cli_name             varchar(8)           not null,
   Cli_sex              nchar(1)             not null,
   Cli_id               varchar(18)          not null,
   Cli_email            varchar(20)          null,
   Cli_ppassword        varchar(20)          not null,
   Cli_birthday         datetime             null,
   constraint PK_CLIENT primary key nonclustered (Cli_no)
)
go

/*==============================================================*/
/* Table: Communication                                         */
/*==============================================================*/
create table Communication (
   Mer_no               varchar(8)           not null,
   Cli_no               char(11)             not null,
   constraint PK_COMMUNICATION primary key (Mer_no, Cli_no)
)
go

/*==============================================================*/
/* Index: Communication_FK                                      */
/*==============================================================*/
create index Communication_FK on Communication (
Mer_no ASC
)
go

/*==============================================================*/
/* Index: Communication2_FK                                     */
/*==============================================================*/
create index Communication2_FK on Communication (
Cli_no ASC
)
go

/*==============================================================*/
/* Table: Delivery                                              */
/*==============================================================*/
create table Delivery (
   ÅäËÍºÅ                  varchar(10)          not null,
   Sor_no               varchar(10)          null,
   Emp_no               varchar(6)           null,
   Add_no               varchar(8)           null,
   Del_gotime           datetime             not null,
   Del_gettime          datetime             not null,
   Del_voucher          int                  not null,
   constraint PK_DELIVERY primary key nonclustered (ÅäËÍºÅ)
)
go

/*==============================================================*/
/* Index: according_FK                                          */
/*==============================================================*/
create index according_FK on Delivery (
Add_no ASC
)
go

/*==============================================================*/
/* Index: Del_subjection_FK                                     */
/*==============================================================*/
create index Del_subjection_FK on Delivery (
Emp_no ASC
)
go

/*==============================================================*/
/* Index: get_Goods_FK                                          */
/*==============================================================*/
create index get_Goods_FK on Delivery (
Sor_no ASC
)
go

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
   Dep_no               varchar(4)           not null,
   Dep_name             varchar(30)          not null,
   Dep_phone            varchar(11)          not null,
   constraint PK_DEPARTMENT primary key nonclustered (Dep_no)
)
go

/*==============================================================*/
/* Table: Employees                                             */
/*==============================================================*/
create table Employees (
   Emp_no               varchar(6)           not null,
   Dep_no               varchar(4)           null,
   Emp_ID               varchar(18)          not null,
   Emp_name             nchar(8)             not null,
   Emp_sex              nchar(1)             not null,
   Emp_birthday         datetime             not null,
   constraint PK_EMPLOYEES primary key nonclustered (Emp_no)
)
go

/*==============================================================*/
/* Index: subjection_FK                                         */
/*==============================================================*/
create index subjection_FK on Employees (
Dep_no ASC
)
go

/*==============================================================*/
/* Table: Form                                                  */
/*==============================================================*/
create table Form (
   For_no               varchar(10)          not null,
   Cli_no               char(11)             null,
   Good_no              varchar(8)           null,
   Cart_num             int                  null,
   For_time             datetime             not null,
   Ö§¸¶Æ¾Ö¤                 int                  not null,
   constraint PK_FORM primary key nonclustered (For_no)
)
go

/*==============================================================*/
/* Index: generate_FK                                           */
/*==============================================================*/
create index generate_FK on Form (
Good_no ASC,
Cart_num ASC
)
go

/*==============================================================*/
/* Index: confirm_FK                                            */
/*==============================================================*/
create index confirm_FK on Form (
Cli_no ASC
)
go

/*==============================================================*/
/* Table: Goods                                                 */
/*==============================================================*/
create table Goods (
   Goo_no               varchar(8)           not null,
   Mer_no               varchar(8)           null,
   Goo_name             nchar(16)            not null,
   Goo_price            decimal(2,2)         not null,
   Goo_detail           nchar(50)            not null,
   Store                varchar(6)           not null,
   constraint PK_GOODS primary key nonclustered (Goo_no)
)
go

/*==============================================================*/
/* Index: manage_FK                                             */
/*==============================================================*/
create index manage_FK on Goods (
Mer_no ASC
)
go

/*==============================================================*/
/* Table: Merchant                                              */
/*==============================================================*/
create table Merchant (
   Mer_no               varchar(8)           not null,
   Mer_name             nchar(16)            not null,
   Mer_legal            nchar(8)             not null,
   Mer_address          nchar(30)            not null,
   Mer_phone            varchar(11)          not null,
   Mer_email            varchar(20)          null,
   constraint PK_MERCHANT primary key nonclustered (Mer_no)
)
go

/*==============================================================*/
/* Table: Sort                                                  */
/*==============================================================*/
create table Sort (
   Sor_no               varchar(10)          not null,
   Emp_no               varchar(6)           null,
   For_no               varchar(10)          null,
   Sor_time             datetime             not null,
   constraint PK_SORT primary key nonclustered (Sor_no)
)
go

/*==============================================================*/
/* Index: distribution_FK                                       */
/*==============================================================*/
create index distribution_FK on Sort (
For_no ASC
)
go

/*==============================================================*/
/* Index: Sor_subjection_FK                                     */
/*==============================================================*/
create index Sor_subjection_FK on Sort (
Emp_no ASC
)
go

/*==============================================================*/
/* Table: "browse"                                              */
/*==============================================================*/
create table "browse" (
   Cli_no               char(11)             not null,
   Goo_no               varchar(8)           not null,
   Bro_time             datetime             null default getdate(),
   constraint PK_BROWSE primary key (Cli_no, Goo_no)
)
go

/*==============================================================*/
/* Index: browse_FK                                             */
/*==============================================================*/
create index browse_FK on "browse" (
Cli_no ASC
)
go

/*==============================================================*/
/* Index: browse2_FK                                            */
/*==============================================================*/
create index browse2_FK on "browse" (
Goo_no ASC
)
go

alter table Address
   add constraint FK_ADDRESS_MODIFY_CLIENT foreign key (Cli_no)
      references Client (Cli_no)
go

alter table Cart
   add constraint FK_CART_Ìí¼Ó_CLIENT foreign key (Cli_no)
      references Client (Cli_no)
go

alter table Communication
   add constraint FK_COMMUNIC_COMMUNICA_MERCHANT foreign key (Mer_no)
      references Merchant (Mer_no)
go

alter table Communication
   add constraint FK_COMMUNIC_COMMUNICA_CLIENT foreign key (Cli_no)
      references Client (Cli_no)
go

alter table Delivery
   add constraint FK_DELIVERY_DEL_SUBJE_EMPLOYEE foreign key (Emp_no)
      references Employees (Emp_no)
go

alter table Delivery
   add constraint FK_DELIVERY_ACCORDING_ADDRESS foreign key (Add_no)
      references Address (Add_no)
go

alter table Delivery
   add constraint FK_DELIVERY_GET_GOODS_SORT foreign key (Sor_no)
      references Sort (Sor_no)
go

alter table Employees
   add constraint FK_EMPLOYEE_SUBJECTIO_DEPARTME foreign key (Dep_no)
      references Department (Dep_no)
go

alter table Form
   add constraint FK_FORM_CONFIRM_CLIENT foreign key (Cli_no)
      references Client (Cli_no)
go

alter table Form
   add constraint FK_FORM_GENERATE_CART foreign key (Good_no, Cart_num)
      references Cart (Good_no, Cart_num)
go

alter table Goods
   add constraint FK_GOODS_MANAGE_MERCHANT foreign key (Mer_no)
      references Merchant (Mer_no)
go

alter table Sort
   add constraint FK_SORT_SOR_SUBJE_EMPLOYEE foreign key (Emp_no)
      references Employees (Emp_no)
go

alter table Sort
   add constraint FK_SORT_DISTRIBUT_FORM foreign key (For_no)
      references Form (For_no)
go

alter table "browse"
   add constraint FK_BROWSE_BROWSE_CLIENT foreign key (Cli_no)
      references Client (Cli_no)
go

alter table "browse"
   add constraint FK_BROWSE_BROWSE2_GOODS foreign key (Goo_no)
      references Goods (Goo_no)
go

