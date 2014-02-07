class GroupsController < ApplicationController
  def new
    @current_department = Department.find_by_id(params[:department_id])
    @group = @current_department.groups.build
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      if !is_group_null?(current_user.id , @group.college.id, @group.department.id)
        @user_group_priv = @group.user_colleges.build
        
        @user_group_priv.user_id = current_user.id
        @user_group_priv.college_id = @group.college.id
        @user_group_priv.department_id = @group.department.id
        #todo value is hard coded here
        @user_group_priv.group_priv = 4
        @user_group_priv.save!
      else
        UserCollege.update_all(["group_id = ?, group_priv = 4", @group.id], ["user_id = ? and college_id = ? and department_id = ? and group_id is null", 
                                                                                current_user.id, @group.college.id, @group.department.id])
      end 
      flash.now[:success] = "Successfully created..."
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
     @micropost = current_user.microposts.build
    @feed_items = @group.microposts.paginate(:page => params[:page])
    store_location
  end
end
