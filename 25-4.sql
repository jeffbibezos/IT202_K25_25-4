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


