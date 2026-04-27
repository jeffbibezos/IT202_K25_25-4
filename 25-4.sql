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

-- 27/4
-- 1. In ra danh sách các cuốn sách thuộc thể loại "Trinh thám" CÓ giá bán dưới 100.000đ.
select * from Books 
where category = 'Trinh thám' and price > 100000;

-- 2. Tìm những khách hàng sử dụng email của Google.
select * from Customers 
where email like '%@gmail.com';
-- LIKE nó như toán tử so sánh tương đối á 
-- còn '%@gmail.com'; thì % có nghĩa là 1 chuỗi ký tự kèm theo sau đó là @gmail.com

-- 3. Lấy ra top 3 cuốn sách đắt tiền nhất trong cửa hàng.
select * from Books 
order by price desc
limit 3;
-- order by dùng để sắp xếp
-- desc là giảm dần 
-- limit 3 lấy ra 3 cái đầu tiên => lấy đc 3 cuốn giá cao nhất

-- 4. Nhân dịp lễ lớn, nhà sách giảm giá 10% cho TẤT CẢ sách được xuất bản trước năm 2020. 
-- Hãy viết lệnh để thực hiện việc cập nhật giá đồng loạt.
set SQL_SAFE_UPDATES = 0;
update Books
set price = price * 0.9
where publish_year < 2022;
set SQL_SAFE_UPDATES = 1;




