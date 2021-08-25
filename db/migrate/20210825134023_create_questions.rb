class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
