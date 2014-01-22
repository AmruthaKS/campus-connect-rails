class UsersController < ApplicationController
  require 'inboxes_helper'
   before_filter :signed_in_user, :only => [:index, :edit, :update, :destroy, :following, :followers]
   before_filter :correct_user,   :only => [:edit, :update]
   
  def new
    @user = User.new
  end

  def index
   #  @users = User.all
    @users = User.paginate(:page => params[:page])
   # @users = User.all
  end
  
  def show
     @micropost = current_user.microposts.build(params[:micropost])
     @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to the Comapus Connect!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @user_college = @user.user_colleges.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

   def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
   
   def info
     @user = User.find(params[:id])
     render 'show_info'
   end

   def notifications
     @title = "Notifications"
     @user = User.find(params[:id])
     render 'show_notifications'
   end

   def events
     @title = "Events"
     @user =  User.find(params[:id])
     render 'show_events'
   end

   def approve
     @title = 'Approve'
     @user =  User.find(params[:id])
     render 'show_approves'
   end

   def notifications_check
     @title = 'notifications'
     @user =  User.find(params[:id])
     respond_to do |format|
       format.html { }
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
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
end
