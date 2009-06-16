class Apartamento < ActiveRecord::Base
	has_one :conta
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :tiposApartamento_id
	validates_uniqueness_of :num
	validates_numericality_of :num

	def hospedar(hospede,numAcomp,dataEntr)
		atrib = { :hospede => Hospede.find(hospede), :numAcomp => numAcomp, :dataEntr => dataEntr, :dataSaid => 'null', :encerrada => false }
		c = Conta.new(atrib)
		c.save
		@conta = c

		atrib2 = { :conta => Conta.find(c.id), :apartamento => self }
		ca = ContasApartamento.new(atrib2)
		ca.save

		reserva = Reserva.find(:first, :conditions => ["(hospede_id = ? and dataEntrada =? and tiposApartamento_id = ?)",hospede,dataEntr.to_date, self.tiposApartamento_id])
		if reserva
			
			Reserva.delete(reserva.id)
			#flash[:notice] = "Reserva concretizada."
		end

		self.livre=false
		self.save

	end

	protected
	def validate
		errors.add(:num, "deve ser positivo") unless num.nil? || num > 0.0
	end
end
