class Department < ActiveRecord::Base
  attr_accessible :name, :college_id, :admin_id

  belongs_to :college
  belongs_to :admin , :class_name => "User", :foreign_key => "admin_id"

  has_many :groups, :dependent => :destroy
end
