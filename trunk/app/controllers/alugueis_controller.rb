class AlugueisController < ApplicationController
  layout 'layout'
  before_filter :authorize

  # GET /alugueis
  # GET /alugueis.xml
  # GET /alugueis/1
  # GET /alugueis/1.xml
  def show
    @aluguel = Aluguel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aluguel }
    end
  end

  # GET /alugueis/new
  # GET /alugueis/new.xml
  def new
    @aluguel = Aluguel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aluguel }
    end
  end

  # POST /alugueis
  # POST /alugueis.xml
  def create
    @aluguel = Aluguel.new(params[:aluguel])

    respond_to do |format|
      if @aluguel.save
        flash[:notice] = 'Aluguel was successfully created.'
        format.html { redirect_to(@aluguel) }
        format.xml  { render :xml => @aluguel, :status => :created, :location => @aluguel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aluguel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alugueis/1
  # DELETE /alugueis/1.xml
  def destroy
    @aluguel = Aluguel.find(params[:id])
    @aluguel.destroy

    respond_to do |format|
      format.html { redirect_to(alugueis_url) }
      format.xml  { head :ok }
    end
  end
end
