class GroupsController < ApplicationController
  def new
    department_params = params[:department]
    @current_department = Department.find_by_id(department_params[:id])
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
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
