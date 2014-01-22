class MicropostsController < ApplicationController
  before_filter :signed_in_user, :only => [:create, :destroy]
  before_filter :correct_user,   :only => :destroy
  before_filter :is_coming_through_user, :only => :show
  def index
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      respond_to do |format|
        format.html {
          flash[:success] = "Micropost created!"
          redirect_back_or(root_url)
        }
        format.js
      end
    else
      render 'static_pages/home'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end


  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html {
        redirect_to root_url
      }
      format.js
    end
  end

  private

  def is_coming_through_user
    redirect_to root_url if params[:user_id].nil? && params[:college_id].nil?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, :notice => "Please sign in."
    end
  end

  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_url if @micropost.nil?
  end

end