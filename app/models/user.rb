# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not nullhas_one
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar
  has_secure_password
  has_attached_file :avatar, :styles => { :large => "320x320>", :thumb => "100x100>", :small => "50x50>" }, :default_url => "/assets/users/:style/default.jpeg"
  has_many :microposts, :dependent => :destroy
  has_many :comments, :foreign_key => "user_id", :dependent => :destroy

  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through=> :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name =>  "Relationship",
                                   :dependent =>   :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  has_many :created_departments, :foreign_key => "admin_id", :class_name => "Department"
  has_many :created_colleges, :foreign_key => "admin_id", :class_name => "College"
  has_many :created_groups, :foreign_key => "admin_id", :class_name => "Group"
  
  has_many :user_colleges, :dependent => :destroy
  has_many :colleges, :through => :user_colleges, :source => :college, :uniq => true
  has_many :departments, :through => :user_colleges, :source => :department, :uniq => true
  has_many :groups, :through => :user_colleges, :source => :group, :uniq => true

  has_many :events, :dependent => :destroy
  has_many :inbox_notifications, :foreign_key => "user_id", :class_name => "Inbox", :dependent => :destroy, :order => "created_at DESC"


  before_save { |user| user.email = email.downcase }
  validates(:name, :length  => {:maximum => 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false})
  #validates :password, :length => { :minimum => 6 }
  before_save :create_remember_token
  
  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(:followed_id => other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.hex(64)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
