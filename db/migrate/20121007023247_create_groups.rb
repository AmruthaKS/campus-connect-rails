class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :college_id
      t.integer :department_id
      t.string :name
      t.integer :admin_id
      
      t.timestamps
    end
  end
end
