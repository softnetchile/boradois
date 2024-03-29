SET FOREIGN_KEY_CHECKS=0;

drop table if exists recepcionistas;

drop table if exists reservas;

drop table if exists contas_apartamentos;

drop table if exists contas_pagamentos;

drop table if exists alugueis;

drop table if exists servicos;

drop table if exists pagamentos;

drop table if exists tipos_pagamentos;

drop table if exists contas;

drop table if exists hospedes;

drop table if exists apartamentos;

drop table if exists tipos_apartamentos;

drop table if exists usuarios;


create table recepcionistas (
    id            int                not    null auto_increment,
    nome         varchar(100)    not    null,
    endereco    varchar(300)    not null,
    nascimento    date            not null,
    sexo        ENUM('Masculino', 'Feminino')    not null,
    estCivil    ENUM('Casado', 'Solteiro', 'Divorciado', 'Viuvo')    not null,
    login        varchar(30)        not null,
    password    varchar(50)        not null,
    primary key(id)
) ENGINE = InnoDB;

create table hospedes (
    id            int    not    null auto_increment,
    nome         varchar(100)    not    null,
    endereco    varchar(300)    not null,
    nascimento    date            not null,
    pais        varchar(50)        not null,
    sexo        ENUM('Masculino', 'Feminino')    not null,
    estCivil    ENUM('Casado', 'Solteiro', 'Divorciado', 'Viuvo')    not null,
    email	varchar(50),
    login        varchar(30)        not null,
    password    varchar(50)        not null,
    primary key(id)
) ENGINE = InnoDB;

create table tipos_apartamentos (
    id            int                not    null auto_increment,
    nome         varchar(100)    not    null,
    lotacao      int    not    null,
    descricao    text            not null,
    valor        float            not null,
    primary key(id)
) ENGINE = InnoDB;

create table reservas (
    id            int        not null auto_increment,
    tiposApartamento_id    int        not null,
    hospede_id        int        not null,
    dataEntrada        date,
    dataSaida        date,
    primary key(id),
    index (tiposApartamento_id),
    index (hospede_id),
    foreign key (tiposApartamento_id)    references tipos_apartamentos(id)
    on delete cascade on update cascade,
    foreign key (hospede_id)        references hospedes(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table apartamentos (
    id            int        not null auto_increment,
    num            int        not null unique,
    tiposApartamento_id    int        not null,
    livre            boolean        default true,
    primary key(id),
    index (tiposApartamento_id),
    foreign key (tiposApartamento_id) references tipos_apartamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table servicos (
    id            int        not null auto_increment,
    nome         varchar(100)        not null,
    valor        float            not null,
    descricao    text            not null,
    primary key(id)
) ENGINE = InnoDB;

create table tipos_pagamentos (
    id        int        not    null auto_increment,
    nome        varchar(100)    not null,
    descricao    text            not null,
    primary key(id)
) ENGINE = InnoDB;

create table pagamentos (
    id        int        not    null auto_increment,
    tiposPagamento_id        int    not null,
    numParcelas    int            not null,
    valor        float            not null,
    primary key(id),
    index (tiposPagamento_id),
    foreign key (tiposPagamento_id) references tipos_pagamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table contas (
    id        int        not null    auto_increment,
    numAcomp    int    not    null,
    dataEntr    datetime    not null,
    dataSaid    datetime,
    hospede_id     int not null,
    encerrada  boolean  default false,
    primary key(id),
    index (hospede_id),
    foreign key (hospede_id) references hospedes(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table contas_pagamentos(
    id    int    not null    auto_increment,
    pagamento_id    int    not null,
    conta_id    int    not null,
    primary key(id),
    index (pagamento_id),
    index (conta_id),
    foreign key (pagamento_id) references pagamentos(id)
    on delete cascade on update cascade,
    foreign key (conta_id) references contas(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table contas_apartamentos (
    id    int    not null    auto_increment,
    conta_id    int    not null,
    apartamento_id    int    not null,
    primary key(id),
    index (conta_id),
    index (apartamento_id),
    foreign key (conta_id) references contas(id)
    on delete cascade on update cascade,
    foreign key (apartamento_id) references apartamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table alugueis(
    id    int    not null    auto_increment,
    conta_id    int,
    apartamento_id    int    not null,
    servico_id    int    not null,
    dataHora    datetime    not null,
    primary key(id),
    index (servico_id),
    foreign key (servico_id) references servicos(id)
    on delete cascade on update cascade,
    foreign key (apartamento_id) references apartamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;
