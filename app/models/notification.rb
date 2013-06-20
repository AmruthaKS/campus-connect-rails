class Notification < ActiveRecord::Base
  attr_accessible :description, :notification_type, :tContent_id, :tContent_type

  has_one :inbox

end
