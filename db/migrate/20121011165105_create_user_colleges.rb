class CreateUserColleges < ActiveRecord::Migration
  def change
    create_table :user_colleges do |t|
      
      t.integer :user_id
      t.integer :college_id
      t.column :college_priv, 'SMALLINT UNSIGNED'
      t.integer :department_id
      t.column :dept_priv, 'SMALLINT UNSIGNED'
      t.integer :group_id
      t.column :group_priv, 'SMALLINT UNSIGNED' 
      
      t.timestamps
    end
  end
end
