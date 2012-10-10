class DepartmentsController < ApplicationController
  def new
    @department = Department.new
      college_params = params[:college]
      @current_college = College.find_by_id(college_params[:id])
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:success] = "Successfully created..."
      redirect_to @department
    else
      render 'new'
    end
  end

  def show
    @department = Department.find(params[:id])
  end

end
