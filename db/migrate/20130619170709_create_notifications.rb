class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :description
      t.integer :notification_type
      t.integer :tContent_id
      t.integer :tContent_type

      t.timestamps
    end
  end
end
