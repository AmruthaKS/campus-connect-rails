class UserCollegesController < ApplicationController
  
    def create 
    user_college_params = params[:user_college]
    @college = College.find(user_college_params[:college_id])    #keeping in mind college will be always there
    @user_college = @college.user_colleges.build
    @user_college.user_id = current_user.id
    @user_college.department_id = user_college_params[:department_id]
    @user_college.group_id = user_college_params[:group_id]
    @user_college.save

    #create a event
    @event = current_user.events.build
    @event.user_id = current_user.id
    @event.event_type = 2
    @event.tContent_id =  user_college_params[:college_id]
    @event.tContent_type = 2

    @event.description = current_user.name + " joined " + @college.name
    @event.save

    #create a notification for the admins
    redirect_back_or root_url
  end
  
end
