class UserCollege < ActiveRecord::Base
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :college, :class_name => "College"
  belongs_to :department
  belongs_to :group
  
end
