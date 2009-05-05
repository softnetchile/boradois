class Apartamento < ActiveRecord::Base
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :fkTiposApartamentos
	validates_uniqueness_of :num
	validates_numericality_of :num

	protected
	def validate
		errors.add(:num, "deve ser positivo") unless num.nil? || num > 0.0
	end
end
