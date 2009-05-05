class Hospede < ActiveRecord::Base

	validates_presence_of :nome, :endereco, :nascimento, :pais, :sexo, :estCivil

	def self.estadosCivis
		%w[Casado Solteiro Divorciado Viuvo]
	end

	def self.generos
		%w[Masculino Feminino]
	end

	def self.nomes
		Hospede.find(:all, :select => 'nome').map(&:nome);
	end
end
