class Group < ActiveRecord::Base
 attr_accessible :college_id, :name, :department_id, :admin_id

  belongs_to :department
  belongs_to :college
  belongs_to :admin , :class_name => "User", :foreign_key => "admin_id"
end
