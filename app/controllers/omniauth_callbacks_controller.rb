class Logins::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    byebug
    @login = Login.from_omniauth(request.env["omniauth.auth"], current_user)

    if @login.persisted?  
      byebug
      sign_in_and_redirect @login, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      byebug
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_login_registration_url
    end
  end

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @login = Login.find_for_oauth(request.env["omniauth.auth"], current_user)
        if @login.persisted?
          sign_in_and_redirect @login, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_login_registration_url
        end
      end
    }
  end

end