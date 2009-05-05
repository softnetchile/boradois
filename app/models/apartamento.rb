class Apartamento < ActiveRecord::Base
	belongs_to :tipos_apartamentos
	
	validates_presence_of :num, :fkTiposApartamentos
	validates_uniqueness_of :num

end
