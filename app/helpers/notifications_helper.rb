module NotificationsHelper

  def get_string_to_be_printed(notification)
    if notification.tContent_type.eql? USER_TCONTENT_TYPE

    elsif notification.tContent_type.eql? COLLEGE_TCONTENT_TYPE

    end

  end
end
