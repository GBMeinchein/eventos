 class RegistrationsController < Devise::RegistrationsController

	#private

	def sign_up_params
		params.require(:login).permit(:nome, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:login).permit(:nome, :email, :password, :password_confirmation, :current_password)
	end

	def after_sign_up_path_for(resource)
		if resource_name == :login
  			login_path(@login)
  		end
    end	

	def create
	    @login = Login.new(login_params)

	    respond_to do |format|
	      if @login.save
	        format.html { redirect_to(action: "show", id: @user, notice: 'User was successfully created.') }
	      else
	        format.html { render :new }
	      end
	      redirect_to(action: "show", id: @login)
	    end
	end

#   def create
#     auth = request.env["omniauth.auth"]
#     user = Login.find_or_create_with_omniauth(auth)
#     session[:user_id] = login.id
#     redirect_to secret_page_path, :notice => "Opa! Você está online!"
#   end

#   def failure
#     redirect_to root_url
#   end

#   def destroy
#     session[:user_id] = nil
#     redirect_to root_url, :notice => "Volte em breve!"
#   end
end