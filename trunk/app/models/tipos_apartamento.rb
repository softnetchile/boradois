class TiposApartamento < ActiveRecord::Base

	validates_presence_of :nome, :descricao, :valor
	validates_numericality_of :valor
	validates_uniqueness_of :nome

	protected
	def validate
		errors.add(:valor, "deve ser positivo") unless valor.nil? || valor > 0.0
	end

end
