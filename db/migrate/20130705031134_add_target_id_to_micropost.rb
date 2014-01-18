class AddTargetIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :target_id, :integer
    add_column :microposts, :target_type, :integer
  end
end
