class CollegesController < ApplicationController
  autocomplete :college, :name
  before_filter :signed_in_user, :only => [:create]

def auto_fetch_departments
  @college = College.find(:first, :conditions => { :name => params[:college_name]})
      respond_to do |format|
        format.html {
        }
        format.js
      end
end

  def new
    @college = College.new
  end
  
  def create
    @college = College.new(params[:college])
    if @college.save
      @user_college_priv = @college.user_colleges.build
      @user_college_priv.user_id = current_user.id
      @user_college_priv.college_priv = 4
      @user_college_priv.save!
       flash.now[:success] = "Welcome, your college been registered successfully!!!"
       redirect_to @college
    else
      render new
    end
  end

  def show
    @college = College.find(params[:id])
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = @college.microposts.paginate(:page => params[:page])
    store_location
  end
  
private

  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, :notice => "Please sign in."
      end
    end

end

