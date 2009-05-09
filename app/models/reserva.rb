class Reserva < ActiveRecord::Base
	validates_presence_of :fkHospedes, :fkTiposApartamentos
	validate :okToReserve 
	belongs_to :tipos_apartamentos
	belongs_to :hospedes

	def self.meses
		%w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]
	end


	def okToReserve
		if dataEntrada <= dataSaida
			@totalAp=Apartamento.count(:conditions => ["fkTiposApartamentos = ?",fkTiposApartamentos])
			@ocupados=Reserva.count(:conditions => ["fkTiposApartamentos = ? AND (( dataSaida <= ? AND dataSaida >= ? ) OR (dataEntrada <= ? AND dataEntrada >= ? ))", fkTiposApartamentos, dataSaida, dataEntrada, dataSaida, dataEntrada])
			if @ocupados >= @totalAp
				errors.add("Não existe vaga")
			end
		else
			errors.add("Data de entrada superior a saida")
		end

	end

end
