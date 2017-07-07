class Admin::VisitsController < ApplicationController
  before_action :set_visit, only: [:destroy]
  before_action :authenticate_user!

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    redirect_to visits_url, notice: 'Visit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:user_id, :place_id, :plate_id, :confirmed, :rank, :comments)
    end
end
