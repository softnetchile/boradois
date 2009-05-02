class Hospede < ActiveRecord::Base

	validates_presence_of :nome, :endereco, :nascimento, :pais, :sexo, :estCivil
	SEXO_OPCOES = [
		[ "Masculino", "m" ],
		[ "Feminino", "f"]
	].freeze

end
