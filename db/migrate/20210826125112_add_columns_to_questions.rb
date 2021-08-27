class AddColumnsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :name, :string
    add_column :questions, :next_question_name, :string
  end
end
