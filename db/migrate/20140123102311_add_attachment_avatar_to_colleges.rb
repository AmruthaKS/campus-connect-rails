class AddAttachmentAvatarToColleges < ActiveRecord::Migration
  def self.up
    change_table :colleges do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :colleges, :avatar
  end
end
