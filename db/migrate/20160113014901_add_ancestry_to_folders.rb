class AddAncestryToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :ancestry, :string
    add_index :folders, :ancestry
    add_index :folders, :name
  end
end
