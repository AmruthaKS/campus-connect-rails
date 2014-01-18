module InboxesHelper
  def checked_notifications_for(user_id)
    Inbox.where('user_id = ? and checked = ? ' , user_id, CHECKED_INBOX).limit 10
  end

  def unchecked_notifications_for(user_id)
      Inbox.where('user_id = ? and checked = ? ' , user_id, UNCHECKED_INBOX).all
  end

  def check_all_notifications_for(user_id)
    ActiveRecord::Base.connection.execute("update inboxes set checked = #{CHECKED_INBOX} where user_id = #{ActiveRecord::Base.sanitize(user_id)}")
  end
end
