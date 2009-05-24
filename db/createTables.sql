drop table if exists aluguel;

drop table if exists contasApartamentos;

drop table if exists contasPagamentos;

drop table if exists contas;

drop table if exists reservas;

drop table if exists hospedes;

drop table if exists recepcionistas;

drop table if exists apartamentos;

drop table if exists tipos_apartamentos;

drop table if exists servicos;

drop table if exists pagamentos;

drop table if exists tipos_pagamentos;



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
    primary key(id)
) ENGINE = InnoDB;

create table tipos_apartamentos (
    id            int                not    null auto_increment,
    nome         varchar(100)    not    null,
    descricao    text            not null,
    valor        float            not null,
    primary key(id)
) ENGINE = InnoDB;

create table reservas (
    id            int        not null auto_increment,
    fkTiposApartamentos    int        not null,
    fkHospedes        int        not null,
    dataEntrada        date,
    dataSaida        date,
    primary key(id),
    index (fkTiposApartamentos),
    index (fkHospedes),
    foreign key (fkTiposApartamentos)    references tipos_apartamentos(id)
    on delete cascade on update cascade,
    foreign key (fkHospedes)        references hospedes(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table apartamentos (
    id            int        not null auto_increment,
    num            int        not null unique,
    fkTiposApartamentos    int        not null,
    livre            boolean        default true,
    primary key(id),
    index (fkTiposApartamentos),
    foreign key (fkTiposApartamentos) references tipos_apartamentos(id)
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
    primary key(id)
) ENGINE = InnoDB;

create table pagamentos (
    id        int        not    null auto_increment,
    fkTiposPagamentos        int    not null,
    numParcelas    int            not null,
    valor        float            not null,
    primary key(id),
    index (fkTiposPagamentos),
    foreign key (fkTiposPagamentos) references tipos_pagamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table contas (
    id        int        not null    auto_increment,
    numAcomp    int    not    null,
    dataEntr    datetime    not null,
    dataSaid    datetime    not null,
    fkHospedes     int not null,
    primary key(id),
    index (fkHospedes),
    foreign key (fkHospedes) references hospedes(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;


create table contasPagamentos(
    id    int    not null    auto_increment,
    fkPagamentos    int    not null,
    fkContas    int    not null,
    primary key(id),
    index (fkPagamentos),
    index (fkContas),
    foreign key (fkPagamentos) references pagamentos(id)
    on delete cascade on update cascade,
    foreign key (fkContas) references contas(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table contasApartamentos (
    id    int    not null    auto_increment,
    fkContas    int    not null,
    fkApartamentos    int    not null,
    primary key(id),
    index (fkContas),
    index (fkApartamentos),
    foreign key (fkContas) references contas(id)
    on delete cascade on update cascade,
    foreign key (fkApartamentos) references apartamentos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;

create table aluguel(
    id    int    not null    auto_increment,
    fkContas    int    not null,
    fkServicos    int    not null,
    dataHora    datetime    not null,
    primary key(id),
    index (fkContas),
    index (fkServicos),
    foreign key (fkContas) references contas(id)
    on delete cascade on update cascade,
    foreign key (fkServicos) references servicos(id)
    on delete cascade on update cascade
) ENGINE = InnoDB;