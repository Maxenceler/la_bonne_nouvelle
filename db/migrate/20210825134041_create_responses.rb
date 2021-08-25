class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :content
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
