class UserCollegesController < ApplicationController
  
    def create 
    user_college_params = params[:user_college]
    @college = College.find(user_college_params[:college_id])
    @user_college = @college.user_colleges.build
    @user_college.user_id = current_user.id
    @user_college.department_id = user_college_params[:department_id]
    @user_college.group_id = user_college_params[:group_id]
    @user_college.save
    redirect_back_or root_url
  end
  
end
