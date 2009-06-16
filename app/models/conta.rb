class Conta < ActiveRecord::Base
	belongs_to :hospede
	has_many :aluguel
	
	@encerrada

	def initialize attributes = {}
		super
	end

	def total
		total_aluguel = 0
		total_diaria = 0
		alugueis = Aluguel.find(:all,:conditions => [" conta_id = ?", id])
		apts = ContasApartamento.find(:all, :conditions => ["conta_id = ?", id])
		for aluguel in alugueis 
			valor_aluguel = Servico.find(:last, :conditions => ["id = ?", aluguel.servico_id]).valor	
			total_aluguel = total_aluguel + valor_aluguel
		end

		for apt in apts
			tipo = Apartamento.find(:last, :conditions => ["id = ?", apt.apartamento_id]).tiposApartamento_id
			dias = dataSaid.to_date - dataEntr.to_date + 1
			valor_diaria = dias*TiposApartamento.find(:last, :conditions => ["id = ?",tipo]).valor
			total_diaria = total_diaria + valor_diaria
		end
		return total_aluguel + total_diaria
	end
end
