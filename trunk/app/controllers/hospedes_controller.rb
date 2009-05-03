class HospedesController < ApplicationController
  before_filter :authorize

  # GET /hospedes
  # GET /hospedes.xml
  def index
    @hospedes = Hospede.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hospedes }
    end
  end

  # GET /hospedes/1
  # GET /hospedes/1.xml
  def show
    @hospede = Hospede.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hospede }
    end
  end

  # GET /hospedes/new
  # GET /hospedes/new.xml
  def new
    @hospede = Hospede.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hospede }
    end
  end

  # GET /hospedes/1/edit
  def edit
    @hospede = Hospede.find(params[:id])
  end

  # POST /hospedes
  # POST /hospedes.xml
  def create
    @hospede = Hospede.new(params[:hospede])

    respond_to do |format|
      if @hospede.save
        flash[:notice] = 'Hospede inserido com sucesso.'
        format.html { redirect_to(@hospede) }
        format.xml  { render :xml => @hospede, :status => :created, :location => @hospede }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hospede.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hospedes/1
  # PUT /hospedes/1.xml
  def update
    @hospede = Hospede.find(params[:id])

    respond_to do |format|
      if @hospede.update_attributes(params[:hospede])
        flash[:notice] = 'Hospede atualizado com sucesso.'
        format.html { redirect_to(@hospede) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hospede.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hospedes/1
  # DELETE /hospedes/1.xml
  def destroy
    @hospede = Hospede.find(params[:id])
    @hospede.destroy

    respond_to do |format|
      format.html { redirect_to(hospedes_url) }
      format.xml  { head :ok }
    end
  end
end
