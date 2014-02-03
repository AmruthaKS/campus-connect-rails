class College < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :contact_email, :country, :name, :phone, :state, :website, :zip_code, :admin_id, :avatar

  has_attached_file :avatar, :styles => { :large => "320x320>", :thumb => "100x100>", :small => "50x50>" }, :default_url => "/assets/college/:style/default.jpeg"
  has_many :departments, :dependent => :destroy
  belongs_to :admin , :class_name => "User", :foreign_key => "admin_id"
  has_many :groups, :dependent => :destroy
  
  has_many :microposts, :dependent => :destroy
  
  has_many :user_colleges, :dependent => :destroy
  has_many :users, :through => :user_colleges, :source => :user, :uniq => true
end