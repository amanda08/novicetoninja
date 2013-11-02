class ActivitiesController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: [:destroy]

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      flash[:success] = "Activity created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @activity.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def activity_params
      params.require(:activity).permit(:title, :description, :link, :xp, goal_ids: [])
    end
    def correct_user
      @activity = current_user.activities.find_by(id: params[:id])
      redirect_to root_url if @activity.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    
end
