use SSIS_Telecom_DB
go

if exists (select * from sys.tables where name = 'fact_transaction' and type = 'U')
drop table fact_transaction
go

create table fact_transaction (
	id int not null identity (1,1),
	transaction_id int not null, -- transaction id from the source systme / file
	imsi varchar(9) not null,
	subscriber_id int,
	tac varchar(8) not null,
	snr varchar(6) not null,
	imei varchar(14) null,
	cell int not null,
	lac int not null,
	event_type varchar(2) null,
	event_ts datetime not null,
	audit_id int not null default (-1)

	constraint pk_fact_transaction_id primary key (id)
);
go
