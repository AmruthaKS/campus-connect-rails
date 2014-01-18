class AddFiledsToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :college_id, :integer
    add_column :microposts, :department_id, :integer
    add_column :microposts, :group_id, :integer
  end
end
