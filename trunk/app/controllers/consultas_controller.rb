class ConsultasController < ApplicationController
  layout 'layout'
  before_filter :authorize

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml }
    end
  end

  def con1
	if request.post?
		data = Date.civil(params[:post][:"data(1i)"].to_i,params[:post][:"data(2i)"].to_i,params[:post][:"data(3i)"].to_i)
		if data <= Date.today
			total = Apartamento.find(:all).size
			ocupados = Conta.find(	:all,
									:conditions => ["(dataEntr <= ? and dataSaid IS NULL) or (dataEntr <= ? and dataSaid >= ?)",data.beginning_of_day,data.beginning_of_day,data.end_of_day],
									:joins => "as b inner join contas_apartamentos as a on a.conta_id = b.id",
									:select => "a.apartamento_id").size
			@taxa_ocupacao = Float(ocupados)/total
		else
			flash[:notice] = "A data escolhida deve anterior a data atual"
		end
	end
    respond_to do |format|
      format.html # con1.html.erb
      format.xml  { render :xml }
    end
  end

  def con4
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
