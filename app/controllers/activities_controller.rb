class ActivitiesController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: [:destroy]

  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities.paginate(page: params[:page])
  end

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

  def edit
    @activity = current_user.activities.find(params[:id])
  end

  def update
    @activity = current_user.activities.find(params[:id])

    if @activity.update_attributes(activity_params)
      redirect_to root_url, notice: "Activity saved!"
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { render :text => "$('li#activity_#{@activity.id}').remove()" }
    end
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
