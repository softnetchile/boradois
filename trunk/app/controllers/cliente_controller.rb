class ClienteController < ApplicationController
  layout 'layout'
  before_filter :authorize_cliente, :except => :login

  def login
	unless session[:cliente]
		if request.get?
			session[:cliente] = nil
			@user = Hospede.new
		else
			@user = Hospede.new(params[:hospede])
			logged_in_user = @user.try_to_login
			if logged_in_user
				session[:cliente] = logged_in_user
				session[:id] = logged_in_user.id
				jumpto = session[:jumpto] || { :action => "index" }
				session[:jumpto] = nil
				redirect_to(jumpto)
			else
				flash[:notice] = "Login ou senha inválidos."
			end
		end
	else
		flash[:notice] = "You have already logged in."
		redirect_to(:action => "index")
	end
  end

  def logout
	session[:cliente] = nil
	flash[:notice] = "Logged out"
	redirect_to(:action => "login")
  end

  def index
	
  end
end
