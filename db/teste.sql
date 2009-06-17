insert into boradois_development.recepcionistas (login,password) values ("suzana", SHA1("suzana"));
insert into boradois_development.recepcionistas (login,password) values ("iuri", SHA1("iuri"));


insert into boradois_development.hospedes values ('', 'Ceu Azul do Sol Poente', 'Rua Carabino, n4', '1966-09-21', 'Brasil', 'Feminino', 'Solteiro','azulzinha@gmail.com', 'ceu-azul', SHA1("azulazul"));
insert into boradois_development.hospedes values ('', 'Um Dois Tres de Oliveira Quatro', 'Rua Silva de Linhares, n319', '1987-02-14', 'Brasil', 'Masculino', 'Viuvo','oliveira1234@gmail.com', 'oliveira1234', SHA1("1234oliveira"));
insert into boradois_development.hospedes values ('', 'João Maria', 'Rua Silva e Silva, n10', '1974-04-01', 'Brasil', 'Masculino', 'Solteiro','joao.maria2004@gmail.com', 'joao_maria', SHA1("jo$ao4002K"));
insert into boradois_development.hospedes values ('', 'Maria João', 'Rua São Vicente, n246', '1983-07-23', 'Brasil', 'Feminino', 'Viuvo','','mariazinha', SHA1("coelhinho"));
insert into boradois_development.hospedes values ('', 'Samara Simão', 'Rua Carucaru, n700', '1970-12-15', 'Brasil', 'Feminino', 'Solteiro', 'samarainhazinha@gmail.com', 'simao.samara', SHA1('o&chamad0'));
insert into boradois_development.hospedes values ('', 'Lindulfo Celidonio Calafange de Tefé', 'Rua Légua e Meia, n900A', '1984-08-25', 'Brasil', 'Masculino', 'Casado', 'lindulfo@gmail.com', 'tefe', SHA1('tefe'));

insert into boradois_development.tipos_apartamentos values ('', 'Solteiro', '1', 'Otimo para alguem que quer passar alguns dias sozinho.', '30.0');
insert into boradois_development.tipos_apartamentos values ('', 'Casal', '2', 'Otimas noites para dois.', '50.0');
insert into boradois_development.tipos_apartamentos values ('', 'Luxo', '5', 'Espaçoso com vista para o mar.', '70.0');
insert into boradois_development.tipos_apartamentos values ('', 'Presidencial', '7', 'Muito espaçoso com vista para o mar, banheira.', '100.0');

insert into boradois_development.reservas values ('', '1', '5', '2009-07-26', '2009-07-30');
insert into boradois_development.reservas values ('', '2', '6', '2009-06-20', '2009-06-30');
insert into boradois_development.reservas values ('', '1', '1', '2009-06-23', '2009-06-23');
insert into boradois_development.reservas values ('', '1', '2', '2009-07-01', '2009-08-01');
insert into boradois_development.reservas values ('', '3', '4', '2009-07-05', '2009-07-14');
insert into boradois_development.reservas values ('', '1', '1', '2009-07-26', '2009-07-06');

insert into boradois_development.apartamentos values ('', '1', '1', false);
insert into boradois_development.apartamentos values ('', '2', '1', true);
insert into boradois_development.apartamentos values ('', '3', '1', true);
insert into boradois_development.apartamentos values ('', '4', '1', true);
insert into boradois_development.apartamentos values ('', '5', '1', true);
insert into boradois_development.apartamentos values ('', '6', '1', true);
insert into boradois_development.apartamentos values ('', '7', '1', true);
insert into boradois_development.apartamentos values ('', '8', '1', true);
insert into boradois_development.apartamentos values ('', '9', '1', true);
insert into boradois_development.apartamentos values ('', '10', '1', true);
insert into boradois_development.apartamentos values ('', '11', '2', true);
insert into boradois_development.apartamentos values ('', '12', '2', true);
insert into boradois_development.apartamentos values ('', '13', '2', true);
insert into boradois_development.apartamentos values ('', '14', '2', true);
insert into boradois_development.apartamentos values ('', '15', '2', true);
insert into boradois_development.apartamentos values ('', '16', '3', true);
insert into boradois_development.apartamentos values ('', '17', '3', true);
insert into boradois_development.apartamentos values ('', '18', '3', true);
insert into boradois_development.apartamentos values ('', '19', '3', true);
insert into boradois_development.apartamentos values ('', '20', '4', true);

insert into boradois_development.servicos values ('', 'Toalha', '5.0', 'Toalha para banho.');
insert into boradois_development.servicos values ('', 'Frigobar', '15.0', 'Frigobar no quarto, não contando o preço do que tem dentro.');
insert into boradois_development.servicos values ('', 'Jantar', '15.0', 'Rodizio com direito a tudo.');
insert into boradois_development.servicos values ('', 'Refrigerante', '3.0', 'Todos os tipos.');
insert into boradois_development.servicos values ('', 'Serviço de quarto', '25.0', 'Entregar a comida/bebida no quarto.');

insert into boradois_development.tipos_pagamentos values ('', 'Cheque', 'Pagando em cheque tem direito até 3 prestações.');
insert into boradois_development.tipos_pagamentos values ('', 'Cartão', 'Pagando em cheque tem direito até 6 prestações.');
insert into boradois_development.tipos_pagamentos values ('', 'A vista', 'Paga tudo na hora.');


insert into boradois_development.contas values ('', '0', '2009-05-26', NULL, '1',false);
insert into boradois_development.contas values ('', '1', '2009-05-10', '2009-05-15', '1',true);
insert into boradois_development.contas values ('', '2', '2009-05-05', '2009-06-01', '2',true);
insert into boradois_development.contas values ('', '1', '2009-04-14', '2009-04-20', '1',true);
insert into boradois_development.contas values ('', '1', '2009-03-26', '2009-04-30', '3',true);
insert into boradois_development.contas values ('', '1', '2009-03-10', '2009-03-20', '4',true);
insert into boradois_development.contas values ('', '1', '2009-03-03', '2009-05-10', '5',true);

insert into boradois_development.contas_apartamentos values ('', '1', '1');
insert into boradois_development.contas_apartamentos values ('', '2', '2');
insert into boradois_development.contas_apartamentos values ('', '3', '3');
insert into boradois_development.contas_apartamentos values ('', '4', '4');
insert into boradois_development.contas_apartamentos values ('', '5', '5');
insert into boradois_development.contas_apartamentos values ('', '6', '6');
insert into boradois_development.contas_apartamentos values ('', '7', '7');

insert into boradois_development.alugueis values ('', '1', '1', '1', '2009-05-26 03:48:06');
insert into boradois_development.alugueis values ('', '2', '2', '1', '2009-05-10 07:03:01');
insert into boradois_development.alugueis values ('', '3', '3', '1', '2009-05-05 07:03:01');
insert into boradois_development.alugueis values ('', '3', '3', '2', '2009-05-07 07:03:01');
insert into boradois_development.alugueis values ('', '3', '3', '3', '2009-05-10 07:03:01');
insert into boradois_development.alugueis values ('', '4', '4', '2', '2009-04-16 07:03:01');
insert into boradois_development.alugueis values ('', '5', '5', '2', '2009-03-27 07:03:01');
insert into boradois_development.alugueis values ('', '6', '6', '2', '2009-03-16 07:03:01');
insert into boradois_development.alugueis values ('', '7', '7', '2', '2009-03-26 07:03:01');
