class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :longitude, :float
    add_column :projects, :latitude, :float
  end
end
