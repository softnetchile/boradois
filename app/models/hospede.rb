class Hospede < ActiveRecord::Base
	validates_presence_of :nome, :endereco, :nascimento, :pais, :sexo, :estCivil
end
