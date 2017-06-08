--创建数据库
create database hotel character set utf8;
user hotel;
--1.餐桌表
create table dinnerTable(
	id int primary key auto_increment,  --餐桌主键
	tableName varchar(20),              --餐桌名
	tableStatus int default 0,          --餐桌状态：0空闲 ，1预约
	orderDate datetime,					--预定时间
	crateAuthor varchar(20),			--创建者
	crateTime datetime,					--创建时间
	modifyAuthor varchar(20),			--修改者
	modifyTime dateTime					--修改时间
)


--2.类别表
create table foodType(
	id int primary key auto_increment,  --类别主键
	typeName varchar(20),				--类别名
	crateAuthor varchar(20),			--创建者
	crateTime datetime,					--创建时间
	modifyAuthor varchar(20),			--修改者
	modifyTime dateTime					--修改时间

)

--3.菜品种类
create table food(
	id int primary key auto_increment,	--主键id	
	foodName varchar(20),				--菜品名
	foodType_id int,					--菜系id
	price double,						--价格
	merberprice double,					--会员价格
	remark varchar(200),				--简介
	imgURL varchar(100),				--图片路径
	crateAuthor varchar(20),			--创建者
	crateTime datetime,					--创建时间
	modifyAuthor varchar(20),			--修改者
	modifyTime dateTime					--修改时间
)



--4.订单表（订单基本信息）
create table orders(
	id int primary key auto_increment,
	table_id int,	                    --餐桌编号
	orderDate datetime,					--下单时间
	totalPrice double             		--总金额
	orderStatus int default 0,			--订单状态:0表示未结账，1表示已结账
	crateAuthor varchar(20),			--创建者
	crateTime datetime,					--创建时间
	modifyAuthor varchar(20),			--修改者
	modifyTime dateTime					--修改时间
)


--5.订单明细表（主要是菜品种）
create table orderDetail(
	id int primary key auto_increment,	--主键
	orderId int,						--外键：引用的是订单表的主键
	food_id int,						--外键：引用的是菜信息表的主键
	foodCount int,						--菜的数量
	crateAuthor varchar(20),			--创建者
	crateTime datetime,					--创建时间
	modifyAuthor varchar(20),			--修改者
	modifyTime dateTime					--修改时间
)


--添加菜品与菜类别的关系约束
alter table food add constraint fk_food_foodType_id foreign key(foodType_id) references foodType(id);

--添加订单表与餐桌表的关系约束
alter table orders add constraint fk_order_table_id foreign key(table_id) references dinnerTable(id);

--添加订单明细与订单表的关系
alter table orderDetail add constraint fk_orderDetail_order_id foreign key(orderId) references orders(id);

--添加订单明细与菜信息的关系
alter table orderDetail add constraint fk_orderDetail_food_id foreign key(food_id) references food(id);


































