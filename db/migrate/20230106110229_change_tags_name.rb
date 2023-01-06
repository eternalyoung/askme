class ChangeTagsName < ActiveRecord::Migration[7.0]
  def change
    change_table :tags do |t|
      t.index :name, unique: true
    end
  end
end
