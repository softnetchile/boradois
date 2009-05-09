class TiposApartamentosController < ApplicationController
  layout 'layout'
  before_filter :authorize

  # GET /tipos_apartamentos
  # GET /tipos_apartamentos.xml
  def index
    @tipos_apartamentos = TiposApartamento.find(:all, :order => "nome, valor")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_apartamentos }
    end
  end

  # GET /tipos_apartamentos/1
  # GET /tipos_apartamentos/1.xml
  def show
    @tipos_apartamento = TiposApartamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos_apartamento }
    end
  end

  # GET /tipos_apartamentos/new
  # GET /tipos_apartamentos/new.xml
  def new
    @tipos_apartamento = TiposApartamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos_apartamento }
    end
  end

  # GET /tipos_apartamentos/1/edit
  def edit
    @tipos_apartamento = TiposApartamento.find(params[:id])
  end

  # POST /tipos_apartamentos
  # POST /tipos_apartamentos.xml
  def create
    @tipos_apartamento = TiposApartamento.new(params[:tipos_apartamento])

    respond_to do |format|
      if @tipos_apartamento.save
        flash[:notice] = 'TiposApartamento was successfully created.'
        format.html { redirect_to(@tipos_apartamento) }
        format.xml  { render :xml => @tipos_apartamento, :status => :created, :location => @tipos_apartamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos_apartamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_apartamentos/1
  # PUT /tipos_apartamentos/1.xml
  def update
    @tipos_apartamento = TiposApartamento.find(params[:id])

    respond_to do |format|
      if @tipos_apartamento.update_attributes(params[:tipos_apartamento])
        flash[:notice] = 'TiposApartamento was successfully updated.'
        format.html { redirect_to(@tipos_apartamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos_apartamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_apartamentos/1
  # DELETE /tipos_apartamentos/1.xml
  def destroy
    @tipos_apartamento = TiposApartamento.find(params[:id])
    @tipos_apartamento.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_apartamentos_url) }
      format.xml  { head :ok }
    end
  end
end
