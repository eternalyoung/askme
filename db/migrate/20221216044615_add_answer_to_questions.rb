class AddAnswerToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer, :string
  end
end
