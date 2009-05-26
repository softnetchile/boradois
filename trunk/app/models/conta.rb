class Conta < ActiveRecord::Base
	belongs_to :hospede
	has_many :aluguel

	def initialize attributes = {}
		super
	end
end
