class UserCollege < ActiveRecord::Base
  attr_accessible :user_id, :college_id, :department_id, :grouop_id, :college_priv, :dept_priv, :group_priv, :start_date, :end_date, :role
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :college, :class_name => "College"
  belongs_to :department, :class_name => "Department"
  belongs_to :group, :class_name => "Group"

end