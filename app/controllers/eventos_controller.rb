class EventosController < ApplicationController
  before_action :authenticate_login! , only: [:new, :edit, :update, :destroy]
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    #if params[:search]
      @eventos = Evento.search(params[:search], params[:estadoSearch], params[:cidadeSearch], params[:searchlocal], params[:deSearch], params[:ateSearch])
    #else
    #  @eventos = Evento.all.order("numeroConfirmados DESC")
    #end

    #@eventos = Evento.search(params[:search])
    #  @eventos = @eventos.titulo(params[:titulo]) if params[:titulo].present?
  end

  def search
    @eventos = Evento.search params[:search]
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
    @evento.login_id = current_login.id
    @evento.numeroConfirmados = 0;
  end

  # GET /eventos/1/edit
  def edit
    if @evento.login_id != current_login.id 
        respond_to do |format|
        format.html { redirect_to eventos_url, alert: 'Atenção! Você não tem permissão para essa tarefa.' }
        format.json { head :no_content }
        end
    end
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)
    @evento.login_id = current_login.id

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    if @evento.login_id == current_login.id 
      @evento.destroy
      respond_to do |format|
        format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
        respond_to do |format|
        format.html { redirect_to eventos_url, alert: 'Atenção! Você não tem permissão para essa tarefa.' }
        format.json { head :no_content }
        end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      #byebug
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      #byebug
      params.require(:evento).permit(:titulo, :descricao, :inicio, :termino, :imagem, :local_id)
    end
end
