class DepartmentsController < ApplicationController
  def new
    @department = Department.new
    college_params = params[:college]
    @current_college = College.find_by_id(college_params[:id])
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      @user_dept_priv = @department.user_colleges.build
      @user_dept_priv.user_id = current_user.id
      @user_dept_priv.college_id = @department.college_id
      @user_dept_priv.dept_priv = 4
      @user_dept_priv.save!
      flash[:success] = "Successfully created..."
      redirect_to @department
    else
      render 'new'
    end
  end

  def show
    @department = Department.find(params[:id])
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = @department.microposts.paginate(:page => params[:page])
    store_location
  end

end
