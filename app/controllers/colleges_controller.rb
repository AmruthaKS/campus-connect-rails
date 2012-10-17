class CollegesController < ApplicationController
  before_filter :signed_in_user, :only => [:create]

  def new
    @college = College.new
  end
  
  def create
    @college = College.new(params[:college])
    if @college.save
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
  end

  def create_department
    redirect_to create_department_url
  end
  
private

  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, :notice => "Please sign in."
      end
    end

end

