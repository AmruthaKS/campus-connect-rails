class AddRoleToUserColleges < ActiveRecord::Migration
  def change
    add_column :user_colleges, :role, :integer
  end
end
