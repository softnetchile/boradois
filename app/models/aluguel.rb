class Aluguel < ActiveRecord::Base
	set_table_name 'alugueis'

	belongs_to :conta
	belongs_to :servico

end
