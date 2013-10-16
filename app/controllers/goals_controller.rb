class GoalsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:success] = "Goal created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @goal.destroy
    redirect_to root_url
  end

  private

    def goal_params
      params.require(:goal).permit(:content)
    end

    def correct_user
      @goal = current_user.goals.find_by(id: params[:id])
      redirect_to root_url if @goal.nil?
    end

end