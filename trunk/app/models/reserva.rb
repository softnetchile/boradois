class Reserva < ActiveRecord::Base
	belongs_to :tipos_apartamentos
	belongs_to :hospedes

	def self.okToReserve(dataEntrada,dataSaida,fkTipoApartamento)
		if dataEntrada <= dataSaida
			@totalAp=Apartamento.count(:conditions => ["fkTiposApartamentos = ?",fkTipoApartamento)
			@ocupados=Reserva.count(:conditions => ["fkTiposApartamentos = ? AND (( dataSaida < ? AND dataSaida > ? ) OR (dataEntrada < ? AND dataEntrada > ? ))", fkTipoApartamento, dataSaida, dataEntrada, dataSaida, dataEntrada)
			if @ocupados < @totalAp
				return true
			end
		end
		return false
	end

end
