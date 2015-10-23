class ConfirmadosController < ApplicationController
  before_action :authenticate_login!
  before_action :set_confirmado, only: [:show, :edit, :update, :destroy]

  # GET /confirmados
  # GET /confirmados.json
  def index
    @confirmados = Confirmado.all
  end

  def SomaConfirmados
    @numeroConfirmados = Confirmado.SomaConfirmados(params[:evento]).count
  end

  # GET /confirmados/1
  # GET /confirmados/1.json
  def show
  end

  # GET /confirmados/new
  def new
    @confirmado = Confirmado.new

  end

  # GET /confirmados/1/edit
  def edit
  end

  # POST /confirmados
  # POST /confirmados.json
  def create
      confirmados = Confirmado.search(params[:evento_id], current_login.id)
        
      if confirmados.present?
        respond_to do |format|
            format.html { redirect_to eventos_url, alert: 'Obrigado, você já confirmou a presença no evento!' }
            format.json { render :show, status: :created, location: @confirmado }
        end
      else
        @confirmado = Confirmado.new
        @confirmado.login_id = current_login.id
        @confirmado.evento_id = params[:evento_id]

        @evento = @confirmado.evento
        @evento.numeroConfirmados = params[:numeroConfirmados]
        if @evento.numeroConfirmados == nil
          @evento.numeroConfirmados = 1
        else
          @evento.numeroConfirmados = @evento.numeroConfirmados + 1
        end
        @evento.save

        respond_to do |format|
          if @confirmado.save
            format.html { redirect_to eventos_url, notice: 'Isso aí! Te esperamos lá!' }
            format.json { render :show, status: :created, location: @confirmado }
          else
            format.html { render :new }
            format.json { render json: @confirmado.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # PATCH/PUT /confirmados/1
  # PATCH/PUT /confirmados/1.json
  def update
    respond_to do |format|
      if @confirmado.update(confirmado_params)
        format.html { redirect_to @confirmado, notice: 'Confirmado was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmado }
      else
        format.html { render :edit }
        format.json { render json: @confirmado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmados/1
  # DELETE /confirmados/1.json
  def destroy
    @confirmado.destroy
    respond_to do |format|
      format.html { redirect_to confirmados_url, notice: 'Confirmado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmado
      @confirmado = Confirmado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmado_params
      params.require(:confirmado).permit(:evento_id, :login_id)
    end
end
