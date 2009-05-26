insert into boradois_development.recepcionistas (login,password) values ("suzana", SHA1("suzana"));
insert into boradois_development.recepcionistas (login,password) values ("iuri", SHA1("iuri"));

insert into boradois_development.hospedes values ('', 'João Maria', 'Rua Silva e Silva', '1974-04-01', 'Brasil', 'Masculino', 'Solteiro');
insert into boradois_development.hospedes values ('', 'Maria João', 'Rua São Vicente', '1983-07-23', 'Brasil', 'Feminino', 'Viuvo');
insert into boradois_development.hospedes values ('', 'Samara Simão', 'Rua Carucaru', '1970-12-15', 'Brasil', 'Feminino', 'Solteiro');

insert into boradois_development.tipos_apartamentos values ('', 'Luxo', '5', 'Espaçoso com vista para o mar.', '50.0');
insert into boradois_development.tipos_apartamentos values ('', 'Presidencial', '7', 'Muito espaçoso com vista para o mar, banheira.', '100.0');

insert into boradois_development.reservas values ('', '1', '1', '2009-06-26', NULL);
insert into boradois_development.reservas values ('', '1', '1', '2009-09-26', '2009-10-04');

insert into boradois_development.apartamentos values ('', '1', '1', false);
insert into boradois_development.apartamentos values ('', '2', '1', true);
insert into boradois_development.apartamentos values ('', '3', '1', true);
insert into boradois_development.apartamentos values ('', '4', '2', true);

insert into boradois_development.servicos values ('', 'Toalha', '5.0', 'Toalha para banho.');
insert into boradois_development.servicos values ('', 'Frigobar', '15.0', 'Frigobar no quarto, não contando o preço do que tem dentro.');
insert into boradois_development.servicos values ('', 'Serviço de quarto', '25.0', 'Entregar a comida/bebida no quarto.');

insert into boradois_development.tipos_pagamentos values ('', 'Cheque', 'Pagando em cheque tem direito até 3 prestações.');
insert into boradois_development.tipos_pagamentos values ('', 'Cartão', 'Pagando em cheque tem direito até 6 prestações.');
insert into boradois_development.tipos_pagamentos values ('', 'A vista', 'Paga tudo na hora.');

insert into boradois_development.contas values ('', '1', '2009-05-26', NULL, '1',false);

insert into boradois_development.contas_apartamentos values ('', '1', '1');

insert into boradois_development.alugueis values ('', '1', '1', '2009-05-26 03:48:06');
insert into boradois_development.alugueis values ('', '1', '2', '2009-05-26 07:03:01');
