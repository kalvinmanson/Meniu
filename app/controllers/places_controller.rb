class PlacesController < ApplicationController
  load_and_authorize_resource
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def my
    @places = current_user.places
  end
  # GET /places
  # GET /places.json
  def index
    @q = search_params[:q]
    @latitude = search_params[:latitude]
    @longitude = search_params[:longitude]
    @min_price = search_params[:min_price]
    @max_price = search_params[:max_price]
    @options = search_params[:options]
    @category = search_params[:category]
    @plates = Plate.where('plates.name LIKE "%"?"%"', @q).or(Plate.where('plates.content LIKE "%"?"%"', @q)).joins(:place).by_distance(:origin => [@latitude,@longitude])
    #if isset options
    if @options.present?
      @options.each do |option|
        @plates = @plates.where('plates.options LIKE "%"?"%"', option)
      end
    else
      @options = []
    end
    #if isset category
    if @category.present? && @category != "ALL"
        @plates = @plates.where('plates.category = ?', @category)
    end
    #if prices
    if @min_price.present?
        @plates = @plates.where('plates.price > ?', @min_price)
    end
    #if prices
    if @max_price.present?
        @plates = @plates.where('plates.price < ?', @max_price)
    end


    @plates = @plates.limit(100)
    #group
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
    @place.user = current_user
    @place.expires_at = 3.month.from_now
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update

      if @place.update(place_params)
        redirect_to @place, notice: 'Place was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    redirect_to places_my_url, notice: 'Place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:city_id, :name, :picture, :address, :description, :phone, :email, :latitude, :longitude, :q)
    end

    def search_params
      params.permit(:q, :latitude, :longitude, {:options => []}, :category, :min_price, :max_price)
    end

end
