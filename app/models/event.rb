class Event < ActiveRecord::Base
  attr_accessible :id, :description, :event_type, :tContent_id, :tContent_type, :user_id

  belongs_to :user
  has_one :notification

end
