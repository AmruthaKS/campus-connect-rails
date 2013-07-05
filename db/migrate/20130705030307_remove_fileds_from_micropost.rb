class RemoveFiledsFromMicropost < ActiveRecord::Migration
  def up
    remove_column :microposts, :college_id
    remove_column :microposts, :department_id
    remove_column :microposts, :group_id
  end

end
