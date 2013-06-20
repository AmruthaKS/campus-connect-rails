class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.integer :user_id
      t.integer :user_id
      t.integer :notification_id
      t.integer :checked

      t.timestamps
    end
  end
end
