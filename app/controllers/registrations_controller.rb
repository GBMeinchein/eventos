class RegistrationsController < Devise::RegistrationsController

	#private

	def sign_up_params
		params.require(:login).permit(:nome, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:login).permit(:nome, :email, :password, :password_confirmation, :current_password)
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