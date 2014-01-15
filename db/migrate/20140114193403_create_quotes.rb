class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :employer
      t.string :position
      t.integer :years_programming
      t.text :advice
      t.string :picture
      t.text :education

      t.timestamps
    end
  end
end
