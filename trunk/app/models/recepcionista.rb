require "digest/sha1"

class Recepcionista < ActiveRecord::Base
	attr_accessor :password
	attr_reader :id
	attr_accessible :nome, :endereco, :nascimento, :sexo, :estCivil, :login, :password

	validates_uniqueness_of :login

	def before_create
		self.f.hashed_password = User.hash_password(self.password)
	end

	def after_create
		@password = nil
	end

	def self.login(login, password)
		hashed_password = hash_password(password || "")
		find(:last, :conditions => ["login = ? and password = ?", login, hashed_password])
	end

	def try_to_login
		Recepcionista.login(self.login, self.password)
	end

	private

	def self.hash_password(password)
		Digest::SHA1.hexdigest(password)
	end

end
