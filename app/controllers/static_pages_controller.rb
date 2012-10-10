class StaticPagesController < ApplicationController
  def home
   #define empty micropost object helps in form construction
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page]) if signed_in?
  #  @feed_items = current_user.feed.all
  end

  def help
  end

  def about
  end
end
