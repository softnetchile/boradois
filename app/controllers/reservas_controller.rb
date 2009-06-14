class ReservasController < ApplicationController
  layout 'layout'
#  before_filter :authorize

  # GET /reservas
  # GET /reservas.xml
  def index
	if session[:admin]
		@reservas = Reserva.find(:all, :order => "dataEntrada, dataSaida, tiposApartamento_id, hospede_id")
	elsif session[:cliente]	
		@reservas = Reserva.find(:all, :conditions =>["hospede_id =?", session[:id]], :order => "dataEntrada, dataSaida, tiposApartamento_id, hospede_id")
	else
		redirect_to :controller => "cliente", :action => "login"
	end	
	respond_to do |format|
		format.html # index.html.erb
		format.xml  { render :xml => @reservas }
	end
  end

  # GET /reservas/1
  # GET /reservas/1.xml
  def show
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else
	    @reserva = Reserva.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.xml  { render :xml => @reserva }
	    end
	end
  end

  # GET /reservas/new
  # GET /reservas/new.xml
  def new
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else
      		@reserva = Reserva.new
      		respond_to do |format|
      			format.html # new.html.erb
      			format.xml  { render :xml => @reserva }
    		end
	end
  end

  # GET /reservas/1/edit
  def edit
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else
		@reserva = Reserva.find(params[:id])
		if session[:cliente]
			if @reserva.hospede_id != session[:id]
				flash[:notice] = "Nao pode acessar esta reserva"
				redirect_to :controller => "cliente", :action => "index"
			end
		else

		end
	end
  end

  # POST /reservas
  # POST /reservas.xml
  def create
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else

    @reserva = Reserva.new(params[:reserva])

    respond_to do |format|
      if @reserva.save
        flash[:notice] = 'Reserva was successfully created.'
        format.html { redirect_to(@reserva) }
        format.xml  { render :xml => @reserva, :status => :created, :location => @reserva }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reserva.errors, :status => :unprocessable_entity }
      end
    end
	end
  end

  # PUT /reservas/1
  # PUT /reservas/1.xml
  def update
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else

    @reserva = Reserva.find(params[:id])
    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        flash[:notice] = 'Reserva was successfully updated.'
        format.html { redirect_to(@reserva) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reserva.errors, :status => :unprocessable_entity }
      end
    end
	end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.xml
  def destroy
	unless session[:admin] || session[:cliente]
		redirect_to :controller => "cliente", :action => "login"
	else

    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to(reservas_url) }
      format.xml  { head :ok }
    end
	end
  end
end
