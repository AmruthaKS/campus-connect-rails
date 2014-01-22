module NotificationsHelper

def get_referred_url_for_notification(notification)
  if notification.tContent_type.eql? USER_RCONTENT_TYPE

  elsif notification.tContent_type.eql? COLLEGE_RCONTENT_TYPE
    college = College.find(notification.tContent_id)
    return url_for college

    elsif notification.tContent_type.eql? APPROVE_RCONTENT_TYPE
      return approve_user_path(current_user)

    elsif notification.tContent_type.eql? POST_RCONTENT_TYPE
      micropost = Micropost.find(notification.tContent_id)
      user_who_caused = User.find(notification.event.user_id)
      user_micropost_path(user_who_caused, micropost)
  end

end
end
