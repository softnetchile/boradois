class Conta < ActiveRecord::Base
	belongs_to :apartamento
	has_one :hospede
#	has_many :despesas

	@fkHospedes

	def initialize attributes = {}
		super
	end
end
