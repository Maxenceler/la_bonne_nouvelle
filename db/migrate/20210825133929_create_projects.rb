class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :address
      t.string :type
      t.integer :estimated_price
      t.integer :garden_size
      t.integer :living_area
      t.references :user, null: false, foreign_key: true
      t.integer :rooms_number
      t.date :building_date
      t.integer :non_living_area
      t.integer :bedrooms_number
      t.string :title
      t.integer :bathrooms_number
      t.string :buildable

      t.timestamps
    end
  end
end
