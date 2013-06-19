class Inbox < ActiveRecord::Base
  attr_accessible :checked, :notification_id, :user_id, :user_id
  belongs_to :notification
  belongs_to :user

end
