class AddRoleToUserColleges < ActiveRecord::Migration
  def change
    add_column :user_colleges, :role, :string
  end
end
