class AddAskUserIdToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :asker_id, :integer
  end
end
