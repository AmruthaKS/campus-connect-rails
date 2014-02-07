class DepartmentsController < ApplicationController
  
  def auto_fetch_groups
    @department = Department.find_by_id(params[:dept_id])
      respond_to do |format|
        format.html {
        }
        format.js
      end
  end
  
  def new
    @current_college = College.find_by_id(params[:college_id])
    @department = @current_college.departments.build
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      if !is_dept_and_group_null?(current_user.id , @department.college.id)
        @user_dept_priv = @department.user_colleges.build
        @user_dept_priv.user_id = current_user.id
        @user_dept_priv.college_id = @department.college.id
        #TODO fix this hard coded value
        @user_dept_priv.dept_priv = 4
        @user_dept_priv.save!
      else
        UserCollege.update_all(["department_id = ?, dept_priv = 4", @department.id], ["user_id = ? and college_id = ? and department_id is null and group_id is null", current_user.id, @department.college.id])
      end
      
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
