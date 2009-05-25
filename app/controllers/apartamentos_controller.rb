class ApartamentosController < ApplicationController
  layout 'layout'
  before_filter :authorize

  # GET /apartamentos
  # GET /apartamentos.xml
  def index
    @apartamentos = Apartamento.find(:all, :order => "num")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apartamentos }
    end
  end

  # GET /apartamentos/1
  # GET /apartamentos/1.xml
  def show
    @apartamento = Apartamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @apartamento }
    end
  end

  # GET /apartamentos/new
  # GET /apartamentos/new.xml
  def new
    @apartamento = Apartamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @apartamento }
    end
  end

  # GET /apartamentos/1/edit
  def edit
    @apartamento = Apartamento.find(params[:id])
  end

  def hospedar2
    Apartamento.find(params[:id]).hospedar(params[:hospede][:id],params[:acompanhantes][:num],Date.new(12122005),Date.new(12122008))
	redirect_to :action => "index"
  end

  # POST /apartamentos
  # POST /apartamentos.xml
  def create
    @apartamento = Apartamento.new(params[:apartamento])

    respond_to do |format|
      if @apartamento.save
        flash[:notice] = 'Apartamento was successfully created.'
        format.html { redirect_to(@apartamento) }
        format.xml  { render :xml => @apartamento, :status => :created, :location => @apartamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @apartamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /apartamentos/1
  # PUT /apartamentos/1.xml
  def update
    @apartamento = Apartamento.find(params[:id])

    respond_to do |format|
      if @apartamento.update_attributes(params[:apartamento])
        flash[:notice] = 'Apartamento was successfully updated.'
        format.html { redirect_to(@apartamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @apartamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /apartamentos/1
  # DELETE /apartamentos/1.xml
  def destroy
    @apartamento = Apartamento.find(params[:id])
    @apartamento.destroy

    respond_to do |format|
      format.html { redirect_to(apartamentos_url) }
      format.xml  { head :ok }
    end
  end
end
