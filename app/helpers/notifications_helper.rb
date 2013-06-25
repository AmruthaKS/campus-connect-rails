module NotificationsHelper

  def get_string_to_be_printed_for_notification(notification)
    if notification.tContent_type.eql? USER_TCONTENT_TYPE

    elsif notification.tContent_type.eql? COLLEGE_TCONTENT_TYPE
      College.find(notification.tContent_id)
    end

  end

  def get_object_to_be_printed_for_notification

  end
end
