class Reserva < ActiveRecord::Base
	validates_presence_of :fkHospedes, :fkTiposApartamento
	belongs_to :tipos_apartamentos
	belongs_to :hospedes

=begin	
	def self.okToReserve(dataEntrada, dataSaida, fkTiposApartamentos)
		if dataEntrada <= dataSaida then
			@totalAp=Apartamento.count(:conditions => ["fkTiposApartamentos = ?",fkTiposApartamentos])
			@ocupados=Reserva.count(:conditions => ["fkTiposApartamentos = ? AND (( dataSaida < ? AND dataSaida > ? ) OR (dataEntrada < ? AND dataEntrada > ? ))", fkTiposApartamentos, dataSaida, dataEntrada, dataSaida, dataEntrada])
			if @ocupados < @totalAp
				return true
			end
		end
		return false
	end

	def validate
		errors.add( "Reserva não pode ser feita") unless Reserva.okToReserve :dataEntrada, :dataSaida, :fkTiposApartamentos
		#não sei se isso tah ok sem o primeiro argumento... mas passou
	end
=end

end
