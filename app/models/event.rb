class Event < ActiveRecord::Base
  attr_accessible :description, :event_type, :tContent_id, :tContent_type, :user_id

  belongs_to :user

end
