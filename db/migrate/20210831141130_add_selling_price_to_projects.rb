class AddSellingPriceToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :selling_price, :integer
  end
end
