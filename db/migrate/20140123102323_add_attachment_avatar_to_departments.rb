class AddAttachmentAvatarToDepartments < ActiveRecord::Migration
  def self.up
    change_table :departments do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :departments, :avatar
  end
end
