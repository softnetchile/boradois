class ContasController < ApplicationController
  layout 'layout'
  before_filter :authorize

  def show
    @conta = Conta.find(params[:id])
	@alugueis = Aluguel.find(:all,:conditions => [" conta_id = ?", @conta.id])
	@apts = ContasApartamento.find(:all, :conditions => ["conta_id = ?", @conta.id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conta }
    end
  end
  
  def encerrar
    @conta = Conta.find(params[:id])
	@alugueis = Aluguel.find(:all,:conditions => ["conta_id = ?", @conta.id])
	@apts = ContasApartamento.find(:all, :conditions => ["conta_id = ?", @conta.id])

	@conta.encerrada = true
	@conta.dataSaid = DateTime.now
	@conta.save
	for ap in @apts
		apt=ap.apartamento
		apt.livre=true
		apt.save
	end

	redirect_to :controller => "apartamentos", :action => "index"
  end

  def view
  	@contas = case params[:st]
  		when '0' then Conta.find(:all,:conditions => ["encerrada = false"])
  		when '1' then Conta.find(:all,:conditions => ["encerrada = true"])
  	end
	@estado_conta = case params[:st]
	   when '0' then "Ativas"
	   when '1' then "Encerradas"
	end
    respond_to do |format|
      format.html
      format.xml  { render :xml => @contas }
    end
  end

end
