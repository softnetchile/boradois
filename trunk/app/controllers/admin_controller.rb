class AdminController < ApplicationController
  def login
		if request.get?
			session[:user_id] = nil
			@user = Recepcionista.new
		else
			@user = Recepcionista.new(params[:user])
			logged_in_user = @user.try_to_login
			if logged_in_user
				session[:admin_id] = logged_in_user.id
				redirect_to(:action => "index")
			else
				flash[:notice] = "Login ou senha inválidos."
			end
		end
  end

  def logout
  end

end
