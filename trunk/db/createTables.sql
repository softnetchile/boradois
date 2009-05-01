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

drop table if exists recepcionistas;

create table recepcionistas (
	id			int				not	null auto_increment,
	nome 		varchar(100)	not	null,
	endereco	varchar(300)	not null,
	nascimento	date			not null,
	sexo		ENUM('Masculino', 'Feminino')	not null,
	estCivil	ENUM('Casado', 'Solteiro', 'Divorciado', 'Viuvo')	not null,
	login		varchar(30)		not null,
	password	varchar(50)		not null,
	primary key(id)
);

drop table if exists apartamentos;

create table apartamentos (
	id			int				not	null auto_increment,
	num			int				not	null unique,
	tipo		ENUM('Executivo', 'Luxo', 'Presidencial')	not null,
	livre		boolean			default true,
	primary key(id)
);

drop table if exists servicos;

create table servicos (
	id			int				not	null auto_increment,
	nome 		varchar(100)	not	null,
	valor		float			not null,
	descricao	text			not null,
	primary key(id)
);
