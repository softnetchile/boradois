class Aluguel < ActiveRecord::Base

	belongs_to :apartamento
	has_one :servico

end
