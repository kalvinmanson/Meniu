class VisitsController < ApplicationController
  load_and_authorize_resource :plate
  load_and_authorize_resource :plate, :through => :plate
  
  before_action :set_plate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plate

  # GET /plates
  # GET /plates.json
  def index
    @visits = Visit.where(plate: @plate)
  end

  # GET /plates/1
  # GET /plates/1.json
  def show

  end

  # GET /plates/new
  def new
    @visit = Visit.new(plate: @plate)
  end

  # GET /plates/1/edit
  def edit
  end

  # POST /plates
  # POST /plates.json
  def create
    @visit = Visit.new
    @visit.plate = @plate
    @visit.place = @plate.place
    @visit.user = current_user
    if @visit.save
      redirect_to place_plate_path(@plate.place, @plate), notice: 'Visit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    if @visit.update(plate_params)
      redirect_to plate_plate_path(@plate, @visit), notice: 'Visit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @visit.destroy
    redirect_to plate_plates_url, notice: 'Visit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @visit = Visit.find(params[:id])
    end

    def set_plate
      @plate = Plate.find(params[:plate_id])
    end
end
