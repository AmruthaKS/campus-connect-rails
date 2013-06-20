class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.integer :event_type
      t.integer :tContent_id
      t.integer :tContent_type

      t.timestamps
    end
  end
end
