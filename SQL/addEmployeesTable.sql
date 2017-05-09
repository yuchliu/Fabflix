create table employees (
	email varchar(50) primary key not null default '',
	password varchar(20) not null default '',
	fullname varchar(100) default ''
);

INSERT INTO employees VALUES('classta@email.edu', 'classta', 'TA CS122B');