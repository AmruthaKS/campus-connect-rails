class MicropostsController < ApplicationController
  before_filter :signed_in_user, :only => [:create, :destroy]
  before_filter :correct_user,   :only => :destroy
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