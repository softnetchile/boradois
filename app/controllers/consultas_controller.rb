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

  def con2
	contas1 = Conta.find(	:all,
							:conditions => ["encerrada = true and dataSaid >= ? and dataSaid <= ?",1.month.ago.beginning_of_month,1.month.ago.end_of_month])
	@total1 = 0
	for conta in contas1
		@total1 = conta.total + @total1
	end
	contas2 = Conta.find(	:all,
							:conditions => ["encerrada = true and dataSaid >= ? and dataSaid <= ?",2.month.ago.beginning_of_month,2.month.ago.end_of_month])
	@total2 = 0
	for conta in contas2
		@total2 = conta.total + @total2
	end
	contas3 = Conta.find(	:all,
							:conditions => ["encerrada = true and dataSaid >= ? and dataSaid <= ?",3.month.ago.beginning_of_month,3.month.ago.end_of_month])
	@total3 = 0
	for conta in contas3
		@total3 = conta.total + @total3
	end
  end

  def con3
	if request.post?
		@hospedes = Hospede.find(:all, :conditions => ["nome LIKE ?",params[:hospede][:nome]+"%"])
		for hospede in @hospedes
			conta = Conta.find(:last, :conditions => ["hospede_id = ? and encerrada = false",hospede.id])
			if conta
				@apts = Hash.new
				@apts[hospede.id] = Apartamento.find(	:all,
											:joins => "inner join contas_apartamentos as a on apartamentos.id=a.apartamento_id",
											:conditions => ["a.conta_id = ?",conta.id])
			else
				@hospedes.delete hospede
			end
		end
		if @hospedes.size <= 0
			flash[:notice]="Esse hospede não existe ou não está hospedado em nenhum quarto"
		end
	end
    respond_to do |format|
      format.html # con3.html.erb
      format.xml  { render :xml }
    end
  end

  def con4
	@totais = Aluguel.find(	:all,
							:conditions => ["dataHora >= ? and dataHora <= ?", 1.month.ago.beginning_of_month,1.month.ago.end_of_month],
							:joins => "as b inner join servicos as a on b.servico_id = a.id ",
							:select => "a.id as servico_id, a.nome as nome, sum(a.valor) as total",
							:group => "servico_id", :order => "total DESC")
    respond_to do |format|
      format.html # con4.html.erb
      format.xml  { render :xml }
    end
  end

end
