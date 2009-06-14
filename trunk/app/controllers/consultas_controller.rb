class ConsultasController < ApplicationController
  layout 'layout'
  before_filter :authorize

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml }
    end
  end

  def con4
	month = Time.now.month
	@totais = Aluguel.find(	:all,
							:conditions => ["dataHora >= ?", Time.now.beginning_of_month ],
							:joins => "as b inner join servicos as a on b.servico_id = a.id ",
							:select => "a.id as servico_id, a.nome as nome, sum(a.valor) as total",
							:group => "servico_id", :order => "total DESC")
    respond_to do |format|
      format.html # con4.html.erb
      format.xml  { render :xml }
    end
  end

end
