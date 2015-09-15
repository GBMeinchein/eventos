class HomeController < ApplicationController
  def index
  	if login_signed_in?
  		redirect_to eventos_path
  	else
  		redirect_to new_login_session_path
  	end
  end
end
