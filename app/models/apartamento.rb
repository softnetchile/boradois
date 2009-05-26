class Apartamento < ActiveRecord::Base
	has_one :conta
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :tiposApartamento_id
	validates_uniqueness_of :num
	validates_numericality_of :num

	@livre

	def hospedar(hospede,numAcomp,dataEntr)
		atrib = { :hospede => Hospede.find(hospede), :numAcomp => numAcomp, :dataEntr => dataEntr, :dataSaid => 'null', :encerrada => false }
		c = Conta.new(atrib)
		c.save
		@conta = c

		atrib2 = { :conta => Conta.find(c.id), :apartamento => self }
		ca = ContasApartamento.new(atrib2)
		ca.save

		@livre=false
		self.save

	end

	protected
	def validate
		errors.add(:num, "deve ser positivo") unless num.nil? || num > 0.0
	end
end
