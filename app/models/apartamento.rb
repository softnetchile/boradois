class Apartamento < ActiveRecord::Base
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :fkTiposApartamentos
	validates_uniqueness_of :num
	validates_numericality_of :num

	@livre=true

	def hospedar(hospede,numAcomp,dataEntr,dataSaid)
		atrib = { :apartamento => self, :fkHospedes => hospede, :hospede => Hospede.find(hospede), :numAcomp => numAcomp, :dataEntr => dataEntr, :dataSaid => dataSaid }
		c=Conta.new(atrib).save
		@livre=false
		self.save
	end

	protected
	def validate
		errors.add(:num, "deve ser positivo") unless num.nil? || num > 0.0
	end
end
