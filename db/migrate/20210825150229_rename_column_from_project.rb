class RenameColumnFromProject < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :type, :project_type
  end
end
