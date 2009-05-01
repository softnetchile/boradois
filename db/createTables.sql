drop table if exists hospedes;

create table hospedes (
	id			int				not	null auto_increment,
	nome 		varchar(100)	not	null,
	endereco	varchar(300)	not null,
	nascimento	date			not null,
	pais		varchar(50)		not null,
	sexo		ENUM('Masculino', 'Feminino')	not null,
	estCivil	ENUM('Casado', 'Solteiro', 'Divorciado', 'Viuvo')	not null,
	primary key(id)
);
