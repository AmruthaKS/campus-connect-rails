class UserCollegesController < ApplicationController

  def create
    user_college_params = params[:user_college]
    college = College.find(user_college_params[:college_id]) #keeping in mind college will be always there
    user_college = college.user_colleges.build
    user_college.user_id = current_user.id
    user_college.department_id = user_college_params[:department_id]
    user_college.group_id = user_college_params[:group_id]
    user_college.save

    #create a event -- Shiva joined PESIT(college)
    event = current_user.events.build
    event.user_id = current_user.id
    event.event_type = JOINED_EVENT_TYPE
    event.tContent_id = user_college_params[:college_id]
    event.tContent_type = COLLEGE_TCONTENT_TYPE

    event.description = current_user.name + ' ' + EVENT_TYPES[JOINED_EVENT_TYPE] + ' ' + college.name
    event.save

    #create a notification for the admins
    #FIXME: Description --> needs to be changed ()
    notification = Notification.new
    notification.event_id = event.id
    notification.description = '<b>' + current_user.name + '</b> ' + EVENT_TYPES[JOINED_EVENT_TYPE] + ' <b>' + college.name + '</b> Approval pending'
    notification.notification_type = APPROVE_NOTIFICATION_TYPE
   # notification.tContent_id = current_user.id
    notification.tContent_type= APPROVE_RCONTENT_TYPE
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

  def approveme
    @user_college = UserCollege.find(params[:id])
    @user_college.update_attributes(:college_priv => READ_ACCESS_RIGHT, :dept_priv => READ_ACCESS_RIGHT, :group_priv => WRITE_ACCESS_RIGHT)

    notification = Notification.new

    notification.description = '<b>' + @user_college.college.name + '</b> request been ' + NOTIFICATION_TYPES[APPROVED_NOTIFICATION_TYPE]
    notification.notification_type = APPROVED_NOTIFICATION_TYPE
    notification.tContent_id = @user_college.group_id
    notification.tContent_type= GROUP_RCONTENT_TYPE
    notification.save

    inbox = Inbox.new
    inbox.notification_id = notification.id
    inbox.user_id = @user_college.user_id
    inbox.checked = false
    inbox.save

    respond_to do |format|
      format.html { }
      format.js
    end
  end

end
