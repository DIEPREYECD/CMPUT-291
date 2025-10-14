-- Let's drop the tables in case they exist from previous runs
drop table if exists payment;
drop table if exists checkout;
drop table if exists add2cart;
drop table if exists search;
drop table if exists viewedProduct;
drop table if exists activities;
drop table if exists orderSessions;
drop table if exists sessions;
drop table if exists orderlines;
drop table if exists orders;
drop table if exists creditCards;
drop table if exists products;
drop table if exists customers;

create table customers (
  cid		int,
  name		text, 
  email		text,
  primary key (cid)
);
create table products (
  pid		int, 
  name		text, 
  category	text, 
  price		float, 
  stock_count	int, 
  descr		text,
  primary key (pid)
);
create table creditCards (
  cno		int, 
  holder_name	text, 
  expiry	date,
  primary key (cno)
);
create table orders (
  ono		int, 
  odate		date, 
  shipping_address text,
  primary key (ono)
);
create table orderlines (
  ono		int, 
  lineNo	int, 
  pid		int, 
  qty		int, 
  uprice	float, 
  discount	floar,
  primary key (ono, lineNo),
  foreign key (ono) references orders on delete cascade
);
create table sessions (
  cid		int,
  sessionNo	int, 
  start_time	datetime, 
  end_time	datetime,
  primary key (cid, sessionNo),
  foreign key (cid) references customers on delete cascade
);
create table orderSessions (
  ono		int, 
  cid		int, 
  sessionNo	int,
  primary key (ono, cid, sessionNo),
  foreign key (ono) references orders,
  foreign key (cid,sessionNo) references sessions
);
create table activities (
  cid		int, 
  sessionNo	int, 
  ts		timestamp,
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo) references sessions on delete cascade
);
create table viewedProduct (
  cid		int, 
  sessionNo	int, 
  ts		timestamp, 
  pid		int,
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo, ts) references activities on delete cascade,
  foreign key (pid) references products
);
create table search (
  cid		int, 
  sessionNo	int, 
  ts		timestamp, 
  query		text,
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo, ts) references activities on delete cascade
);
create table add2cart (
  cid		int, 
  sessionNo	int, 
  ts		timestamp, 
  pid		int,
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo, ts) references activities on delete cascade,
  foreign key (pid) references products
);

create table checkout (
  cid		int, 
  sessionNo	int, 
  ts		timestamp, 
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo, ts) references activities on delete cascade
);
create table payment (
  cid		int, 
  sessionNo	int, 
  ts		timestamp, 
  cno		int,
  primary key (cid, sessionNo, ts),
  foreign key (cid, sessionNo, ts) references activities on delete cascade,
  foreign key (cno) references creditCards
);
