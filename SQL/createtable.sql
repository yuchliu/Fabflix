create table movies (id int not null AUTO_INCREMENT primary key,
					 title varchar(100) not null default '',
					 year int not null,
					 director varchar(100) not null default '',
					 banner_url varchar(200) default '',
					 trailer_url varchar(200) default '');

create table stars (id int not null AUTO_INCREMENT primary key,
				   first_name varchar(50) not null default '',
				   last_name varchar(50) not null default '',
				   dob date default null,
				   photo_url varchar(200) default '');

create table stars_in_movies (star_id int not null,
							  foreign key (star_id) references stars(id),
							  movie_id int not null,
							  foreign key (movie_id) references movies(id));

create table genres (id int primary key not null AUTO_INCREMENT,
					 name varchar(32) not null default '');

create table genres_in_movies(genre_id int not null,
							  foreign key (genre_id) references genres(id),
							  movie_id int not null,
							  foreign key (movie_id) references movies(id));

create table creditcards(id varchar(20) not null primary key default '',
						 first_name varchar(50) not null default '',
						 last_name varchar(50) not null default '',
						 expiration date not null);

create table customers(id int not null AUTO_INCREMENT primary key,
					   first_name varchar(50) not null default '',
					   last_name varchar(50) not null default '',
					   cc_id varchar(20) not null,
					   foreign key (cc_id) references creditcards(id),
					   address varchar(200) not null default '',
					   email varchar(50) not null default '',
					   password varchar(20) not null default '');

create table sales(id int not null AUTO_INCREMENT primary key,
				   customer_id int not null,
				   foreign key (customer_id) references customers(id),
				   movie_id int not null,
				   foreign key (movie_id) references movies(id),
				   sale_date date not null );

CREATE TABLE carts (
	cart_id INT NOT NULL AUTO_INCREMENT primary key,
	amount INT NOT NULL DEFAULT 1,
	customer_id INT NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	movie_id INT NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	UNIQUE KEY(customer_id, movie_id)
);