class TiposPagamentosController < ApplicationController
  layout 'layout'
  before_filter :authorize

  # GET /tipos_pagamentos
  # GET /tipos_pagamentos.xml
  def index
    @tipos_pagamentos = TiposPagamento.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_pagamentos }
    end
  end

  # GET /tipos_pagamentos/1
  # GET /tipos_pagamentos/1.xml
  def show
    @tipos_pagamento = TiposPagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos_pagamento }
    end
  end

  # GET /tipos_pagamentos/new
  # GET /tipos_pagamentos/new.xml
  def new
    @tipos_pagamento = TiposPagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos_pagamento }
    end
  end

  # GET /tipos_pagamentos/1/edit
  def edit
    @tipos_pagamento = TiposPagamento.find(params[:id])
  end

  # POST /tipos_pagamentos
  # POST /tipos_pagamentos.xml
  def create
    @tipos_pagamento = TiposPagamento.new(params[:tipos_pagamento])

    respond_to do |format|
      if @tipos_pagamento.save
        flash[:notice] = 'TiposPagamento was successfully created.'
        format.html { redirect_to(@tipos_pagamento) }
        format.xml  { render :xml => @tipos_pagamento, :status => :created, :location => @tipos_pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_pagamentos/1
  # PUT /tipos_pagamentos/1.xml
  def update
    @tipos_pagamento = TiposPagamento.find(params[:id])

    respond_to do |format|
      if @tipos_pagamento.update_attributes(params[:tipos_pagamento])
        flash[:notice] = 'TiposPagamento was successfully updated.'
        format.html { redirect_to(@tipos_pagamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_pagamentos/1
  # DELETE /tipos_pagamentos/1.xml
  def destroy
    @tipos_pagamento = TiposPagamento.find(params[:id])
    @tipos_pagamento.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_pagamentos_url) }
      format.xml  { head :ok }
    end
  end
end
