class Apartamento < ActiveRecord::Base

	has_one :conta
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :fkTiposApartamentos
	validates_uniqueness_of :num
	validates_numericality_of :num

	def hospedar(hospede,numAcomp,dataEntr)
		atrib = { :apartamento => self, :hospede => Hospede.find(hospede), :numAcomp => numAcomp, :dataEntr => dataEntr, :dataSaid => 'null' }
		c = Conta.new(atrib)
		c.save
		@conta = c
		self.livre=false
		self.save
	end

	protected
	def validate
		errors.add(:num, "deve ser positivo") unless num.nil? || num > 0.0
	end
end
