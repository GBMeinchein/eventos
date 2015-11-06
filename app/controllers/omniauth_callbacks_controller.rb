class Logins::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook     
    byebug
      @login = Login.find_for_facebook_oauth(request.env["omniauth.auth"], current_login)  
      if @login.persisted?       
        sign_in_and_redirect @login, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_login_registration_url
      end
  end

  
end