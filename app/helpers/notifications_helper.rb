module NotificationsHelper

def get_referred_url_for_notification(notification)
  if notification.tContent_type.eql? USER_RCONTENT_TYPE

  elsif notification.tContent_type.eql? COLLEGE_RCONTENT_TYPE
    @college = College.find(notification.tContent_id)
    url_for @college

    elsif notification.tContent_type.eql? APPROVE_RCONTENT_TYPE
    approve_user_path(current_user)

  end

end



end
