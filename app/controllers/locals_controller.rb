class LocalsController < ApplicationController
  before_action :authenticate_login!  
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # GET /locals
  # GET /locals.json
  def index
    @locals = Local.all
    @cidades = Cidade.all     

    @hash = Gmaps4rails.build_markers(@locals) do |local, marker|
      marker.lat local.latitude
      marker.lng local.longitude

@map = GMaps.new(div: '#map', lat: -12.043333, lng: -77.028333)
@map.addMarker(lat: -12.043333,
               lng: -77.028333,
               title: 'Lima',
               click: GMaps::JS["function(e) { alert('You clicked in this marker'); }"])
@map.addMarker(lat: -12.042,
               lng: -77.028333,
               title: 'Marker with InfoWindow',
               infoWindow: {
                 content: '<p>HTML Content</p>'
               })
    end

  end

  # GET /locals/1
  # GET /locals/1.json
  def show
    @local = Local.find(params[:id])

    #@map = GMaps.new(lat: @local.latitude , lng: @local.longitude )
    @hash = Gmaps4rails.build_markers(@locals) do |local, marker|
      marker.lat @local.latitude
      marker.lng @local.longitude
    end

    @map = GMaps.new(div: '#map', lat: @local.latitude, lng: @local.longitude)
    @map.addMarker(lat: @local.latitude,
                   lng: @local.longitude,
                   title: @local.nome,
                   click: GMaps::JS["function(e) { alert('You clicked in this marker'); }"])
    @map.addMarker(lat: @local.latitude,
                   lng: @local.longitude,
                   title: 'Marker with InfoWindow',
                   infoWindow: {
                     content: '<p>HTML Content</p>'
                   })
  end

  def local_params
    params.require(:local).permit(:nome, :latitude, :longitude)
  end

  # GET /locals/new
  def new
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = Local.new(local_params)

    respond_to do |format|
      if @local.save
        format.html { redirect_to @local, notice: 'Local was successfully created.' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to @local, notice: 'Local was successfully updated.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locals_url, notice: 'Local was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:nome, :cidade_id, :endereco, :latitude, :longitude)
    end
end
