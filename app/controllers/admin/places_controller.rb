class Admin::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to admin_place_path(@place), notice: 'Place was successfully created.'
    else
      :new 
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update

      if @place.update(place_params)
        redirect_to admin_place_path(@place), notice: 'Place was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    redirect_to admin_places_url, notice: 'Place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:user_id, :city_id, :name, :expires_at, :address, :description, :phone, :email, :latitude, :longitude, :deleted_at)
    end
end
