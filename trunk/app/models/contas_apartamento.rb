class ContasApartamento < ActiveRecord::Base
	belongs_to :conta
	belongs_to :apartamento

   
	def initialize attributes = {}
		super
	end
end
