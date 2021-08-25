class CreateResponseProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :response_projects do |t|
      t.references :response, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
