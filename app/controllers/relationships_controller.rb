class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
   respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def user_unfollow
    @user = User.find(params[:id])
    @referred_id = params[:user][:referred_id]
    puts "******************************* " + @referred_id
    current_user.relationships.find_by_followed_id(@user).delete
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def user_follow
    @user = User.find(params[:id])
    @referred_id = params[:user][:referred_id]
    puts "******************************* " + @referred_id
    current_user.follow!(@user)
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
end
