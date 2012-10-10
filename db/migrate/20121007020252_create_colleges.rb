class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|

      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.integer :admin_id
      t.string :phone
      t.string :contact_email
      t.string :website

      t.timestamps
    end
  end
end
