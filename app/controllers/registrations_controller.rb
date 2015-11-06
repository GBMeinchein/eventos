 class RegistrationsController < Devise::RegistrationsController

 #before_action :set_login, only: [:show, :edit, :update, :destroy]
  #layout "devise_company_application"

  def index
    @logins = Login.all
  end

  def show
    @requests = LoginRequests.where("login_id = ?", current_login.id)
    
  end

  def new
    @logins = Login.new
  end

  def edit
  end

  def create
    @login = Login.new(login_params)

    respond_to do |format|
      if @login.save
        format.html { redirect_to(action: "show", id: @login, notice: 'User was successfully created.') }
      else
        format.html { render :new }
      end
      redirect_to(action: "show", id: @login)
    end
  end

  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
      redirect_to action: show
    end
  end

  def destroy
    @login.destroy
    respond_to do |format|
      format.html { redirect_to logins_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_login
      @login = Login.find(params[:id])
    end

    def login_params
      params.require(:login).permit(:name, :email, :password, :access_token, :uid, :photo_url, :provider)
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