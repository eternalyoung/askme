class ChangeTagsName < ActiveRecord::Migration[7.0]
  def change
    change_column :tags, :name, :string, unique: true
  end
end
