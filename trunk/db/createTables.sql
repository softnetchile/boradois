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

drop table if exists reservas;

drop table if exists hospedes;

create table hospedes (
	id			int	not	null auto_increment,
	nome 		varchar(100)	not	null,
	endereco	varchar(300)	not null,
	nascimento	date			not null,
	pais		varchar(50)		not null,
	sexo		ENUM('Masculino', 'Feminino')	not null,
	estCivil	ENUM('Casado', 'Solteiro', 'Divorciado', 'Viuvo')	not null,
	primary key(id)
) ENGINE = InnoDB;

drop table if exists apartamentos;

drop table if exists tipos_apartamentos;

create table tipos_apartamentos (
	id			int				not	null auto_increment,
	nome 		varchar(100)	not	null,
	descricao	text			not null,
	valor		float			not null,
	primary key(id)
) ENGINE = InnoDB;

create table reservas (
	id			int		not null auto_increment,
	fkTiposApartamentos	int		not null,
	fkHospedes		int		not null,
	dataEntrada		Date,
	dataSaida		Date,
	primary key(id),
	index (fkTiposApartamentos),
	index (fkHospedes),
	foreign key (fkTiposApartamentos)	references tipos_apartamentos(id)	
	on delete cascade on update cascade,
	foreign key (fkHospedes)		references hospedes(id)			
	on delete cascade on update cascade
) ENGINE = InnoDB;

create table apartamentos (
	id			int		not null auto_increment,
	num			int		not null unique,
	fkTiposApartamentos	int		not null,
	livre		boolean			default true,
	primary key(id),
	index (fkTiposApartamentos),
	foreign key (fkTiposApartamentos) references tipos_apartamentos(id)
	on delete cascade on update cascade
) ENGINE = InnoDB;

drop table if exists servicos;

create table servicos (
	id			int		not null auto_increment,
	nome 		varchar(100)		not null,
	valor		float			not null,
	descricao	text			not null,
	primary key(id)
);
