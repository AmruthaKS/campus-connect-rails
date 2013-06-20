class UserCollegesController < ApplicationController
  
    def create 
    user_college_params = params[:user_college]
    college = College.find(user_college_params[:college_id])    #keeping in mind college will be always there
    user_college = college.user_colleges.build
    user_college.user_id = current_user.id
    user_college.department_id = user_college_params[:department_id]
    user_college.group_id = user_college_params[:group_id]
    user_college.save

    #create a event -- Shiva joined PESIT(college)
    event = current_user.events.build
    event.user_id = current_user.id
    event.event_type = JOINED_EVENT_TYPE
    event.tContent_id =  user_college_params[:college_id]
    event.tContent_type = COLLEGE_TCONTENT_TYPE

    event.description = current_user.name + ' ' + EVENT_TYPES[JOINED_EVENT_TYPE] + ' ' + college.name
    event.save

    #create a notification for the admins

    notification = Notification.new
    notification.event_id = event.id
    notification.description = current_user.name + ' ' + EVENT_TYPES[JOINED_EVENT_TYPE] + ' ' + college.name + ' Approval pending'
    notification.notification_type = APPROVE_NOTIFICATION_TYPE
    notification.tContent_id = current_user.id
    notification.tContent_type= USER_TCONTENT_TYPE
    notification.save

    admins = get_group_admins(user_college_params[:group_id])

    admins.each do |admin|
      inbox = Inbox.new
      inbox.notification_id = notification.id
      inbox.user_id = admin.user_id
      inbox.checked = false
      inbox.save
    end
    redirect_back_or root_url
    end
end
