class CreateOfflineSchools < ActiveRecord::Migration
  def change
    create_table :offline_schools do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :site_url
      t.text :ed_level
      t.text :bio
      t.text :format
      t.string :street
      t.float :longitude
      t.float :latitude
      t.text :contact_email
      t.string :phone
      t.text :languages
      t.string :country

      t.timestamps
    end
  end
end
