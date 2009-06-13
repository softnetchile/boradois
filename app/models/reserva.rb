class Reserva < ActiveRecord::Base
	validates_presence_of :hospede_id, :tiposApartamento_id
	validate :okToReserve 
	belongs_to :tipos_apartamentos
	belongs_to :hospedes

	def self.meses
		%w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]
	end


	def okToReserve
		if dataEntrada < Date.today
			errors.add("Coloque uma data de hoje em diante")
		end
		if dataEntrada <= dataSaida
			@totalAp=Apartamento.count(:conditions => ["tiposApartamento_id = ?",tiposApartamento_id])
			@ocupados=Reserva.count(:conditions => ["tiposApartamento_id = ? AND (( dataSaida <= ? AND dataSaida >= ? ) OR (dataEntrada <= ? AND dataEntrada >= ? ))", tiposApartamento_id, dataSaida, dataEntrada, dataSaida, dataEntrada])
			if @ocupados >= @totalAp
				errors.add("Não existe vaga")
			end
		else
			errors.add("Data de entrada superior a saida")
		end

	end

end
