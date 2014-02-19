module InboxesHelper
  def checked_notifications_for(user_id)
    Inbox.where('user_id = ? and checked = ? ' , user_id, CHECKED_INBOX).limit 10
  end

  def unchecked_notifications_count_for(user_id)
      Inbox.where('user_id = ? and checked = ? ' , user_id, UNCHECKED_INBOX).all.count
  end
end
