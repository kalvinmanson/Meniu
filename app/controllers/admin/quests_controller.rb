class Admin::QuestsController < ApplicationController
  before_action :set_quest, only: [:destroy]
  before_action :authenticate_user!

  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.all
  end


  def destroy
    @quest.destroy
    redirect_to quests_url, notice: 'Quest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:user_id, :quest, :result)
    end
end
