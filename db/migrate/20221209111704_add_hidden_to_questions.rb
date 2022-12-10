class AddHiddenToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :hidden, :boolean, null: false, default: false
  end
end
