require "digest/sha1"
class Hospede < ActiveRecord::Base
	validates_presence_of :nome, :endereco, :nascimento, :pais, :sexo, :estCivil, :login, :password
	validates_uniqueness_of :login
#	attr_accessor :password
#	attr_accessible :login, :password

	def before_create
		self.password = Hospede.hash_password(self.password)
	end
	
	def after_create
		@password = nil
	end

	def self.login(login, password)
		password = hash_password(password || "")
		find(:last, :conditions => ["login = ? and password = ?", login, password])
	end

	def try_to_login
		Hospede.login(self.login, self.password)
	end

	def self.hash_password(password)
		Digest::SHA1.hexdigest(password)
	end

	def self.estadosCivis
		%w[Casado Solteiro Divorciado Viuvo]
	end

	def self.generos
		%w[Masculino Feminino]
	end

	def self.meses
		%w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]
	end
end
