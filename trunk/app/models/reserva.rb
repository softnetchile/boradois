class Reserva < ActiveRecord::Base
	belongs_to :tipos_apartamentos
	belongs_to :hospedes
end
