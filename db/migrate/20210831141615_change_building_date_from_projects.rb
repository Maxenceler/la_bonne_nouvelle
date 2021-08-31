class ChangeBuildingDateFromProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :building_date, :string
  end
end
