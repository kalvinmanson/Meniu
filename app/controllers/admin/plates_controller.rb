class Admin::PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /plates
  # GET /plates.json
  def index
    @plates = Plate.all
  end

  # GET /plates/1
  # GET /plates/1.json
  def show
  end

  # GET /plates/new
  def new
    @plate = Plate.new
  end

  # GET /plates/1/edit
  def edit
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = Plate.new(plate_params)
    if @plate.save
      redirect_to admin_plate_path(@plate), notice: 'Plate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    if @plate.update(plate_params)
      redirect_to admin_plate_path(@plate), notice: 'Plate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate.destroy
    redirect_to admin_plates_url, notice: 'Plate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_params
      params.require(:plate).permit(:place_id, :name, :content, :category, :favored, :tags, :options, :diners, :active, :deleted_at)
    end
end
