class Notification < ActiveRecord::Base
  attr_accessible :id, :description, :notification_type, :tContent_id, :tContent_type, :event_id

  has_one :inbox
  belongs_to :event

end
