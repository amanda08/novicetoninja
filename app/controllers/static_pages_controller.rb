class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @activity = current_user.activities.build
      # removed .build from above
      @feed_items = current_user.feed.paginate(page: params[:page])
      @goal = Goal.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
