class AdminController < ApplicationController
  layout 'layout'
  before_filter :authorize, :except => :login

  def login
	unless session[:admin]
		if request.get?
			session[:admin] = nil
			@user = Recepcionista.new
		else
			@user = Recepcionista.new(params[:recepcionista])
			logged_in_user = @user.try_to_login
			if logged_in_user
				session[:admin] = logged_in_user
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
	session[:admin] = nil
	flash[:notice] = "Logged out"
	redirect_to(:action => "login")
  end

  def index
	
  end
end
