class AddNextQuestionNameToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :next_question_name, :string
  end
end
