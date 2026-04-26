-- 25/4
create database BookWorm;

use BookWorm;

create table Authors (
	author_id int primary key auto_increment,
    full_name varchar(100) not null,
    birth_year int not null,
    nationality varchar(50) not null
);

create table Books (
	book_id int primary key auto_increment,
    book_name varchar(100) not null,
    category varchar(100) not null,
    price decimal(12, 0) not null default 0 check(price >= 0),
    publish_year int not null,
    author_id int not null,
	foreign key (author_id) references Authors(author_id)
);

create table Customers (
	customer_id int primary key auto_increment,
    customer_name varchar(100) not null,
    email varchar(100) not null unique,
    phone varchar(15) not null unique,
	registration_date date default(current_date)
);

-- 26/4
insert into Authors (full_name, birth_year, nationality) 
values 
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Agatha Christie', 1890, 'Anh'),
('Dale Carnegie', 1888, 'Mỹ');

insert into Books (book_name, category, price, publish_year, author_id) 
values 
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 85000, 2008, 1),
('Mắt biếc', 'Văn học', 110000, 1990, 1),
('Kính vạn hoa', 'Văn học', 55000, 1995, 1),
('Án mạng trên chuyến tàu cao tốc Phương Đông', 'Trinh thám', 120000, 1934, 2),
('Vụ ám thát Roger Ackroyd', 'Trinh thám', 95000, 1926, 2),
('Đắc Nhân Tâm', 'Kỹ năng', 76000, 1936, 3),
('Quẳng gánh lo đi và vui sống', 'Kỹ năng', 82000, 1948, 3),
('Linh hồn của tiền', 'Kỹ năng', 150000, 2021, 3);

insert into Customers (customer_name, email, phone)
values 
('Trần Văn An', 'an.tran@gmail.com', '0901234567'),
('Lê Thị Bình', 'binh.le@yahoo.com', '0912345678'),
('Phạm Hồng Cường', 'cuong.pham@outlook.com', '0987654321'),
('Nguyễn Minh Dung', 'dung.nguyen@hotmail.com', '0933445566'),
('Đỗ Hoàng Yến', 'yen.do@protonmail.com', '0944556677');


insert into Customers (customer_name, email, phone)
value
('Trần Văn An', 'an.tran@gmail.com', '0901234567');
-- Nó báo lỗi Duplicate bởi vì ban đầu ở bảng Customers chúng ta đã có unique nó bắt buộc
-- mỗi khách hàng phải có gmail riêng và không trùng nhau



