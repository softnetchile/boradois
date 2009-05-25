class Aluguel < ActiveRecord::Base
	set_table_name 'alugueis'

	belongs_to :apartamento
	belongs_to :servico

end
