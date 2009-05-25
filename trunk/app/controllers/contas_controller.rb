class ContasController < ApplicationController
  layout 'layout'
  before_filter :authorize

  def show
    @conta = Conta.find(params[:id])
	@alugueis = Aluguel.find(:all,:conditions => [" conta_id = ?", @conta.id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conta }
    end
  end
end
