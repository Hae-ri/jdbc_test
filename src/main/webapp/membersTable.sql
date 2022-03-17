use address;

create table if not exists members(
	id varchar(10) primary key,
	passwd varchar(20),
	email varchar(50),
	signuptime timestamp default current_timestamp
) ;

