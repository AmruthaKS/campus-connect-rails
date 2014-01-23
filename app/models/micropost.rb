class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :college_id, :department_id, :group_id, :target_id, :target_type
  belongs_to :user

  has_many :comments, :dependent => :destroy
  
  validates :content, :presence => true, :length => { :maximum => 255 }
  validates :user_id, :presence => true
  default_scope :order => 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
   where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", :user_id => user)
  end

  def self.user_related(user)
    where("user_id = :user_id OR (target_id=:user_id and target_type = #{USER_MICRO_POST})", :user_id => user)
  end

end
