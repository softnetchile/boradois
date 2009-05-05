class Reserva < ActiveRecord::Base
	validates_presence_of :fkHospedes, :fkTiposApartamentos
	belongs_to :tipos_apartamentos
	belongs_to :hospedes

	def self.meses
		%w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]
	end

#=begin	
	def self.okToReserve(dataEntrada, dataSaida, fkTiposApartamentos)
		if dataEntrada.to_s <= dataSaida.to_s then
			@totalAp=Apartamento.count(:conditions => ["fkTiposApartamentos = ?",fkTiposApartamentos])
			@ocupados=Reserva.count(:conditions => ["fkTiposApartamentos = ? AND (( dataSaida < ? AND dataSaida > ? ) OR (dataEntrada < ? AND dataEntrada > ? ))", fkTiposApartamentos, dataSaida, dataEntrada, dataSaida, dataEntrada])
			if @ocupados < @totalAp
				return true
			end
		end
		return false
	end

	def self.dates(dataEntrada, dataSaida)
		if dataEntrada.to_s <= dataSaida.to_s
			return false
		else
	 		return true
		end
	end

	def validate
		errors.add("Data de entrada superior a saida") if Reserva.dates :dataEntrada, :dataSaida
		#errors.add( "Reserva não pode ser feita") unless Reserva.okToReserve :dataEntrada, :dataSaida, :fkTiposApartamentos
		#não sei se isso tah ok sem o primeiro argumento... mas passou
	end
#=end

end
