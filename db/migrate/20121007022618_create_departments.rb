class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :admin_id
      t.integer :college_id
      
      t.timestamps
    end
  end
end
