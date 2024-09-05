class RemoveTitleFromCollection < ActiveRecord::Migration[7.1]
  def change
    remove_column :collections, :title, :string
  end
end
