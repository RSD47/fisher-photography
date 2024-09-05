class AddMatchToCollection < ActiveRecord::Migration[7.1]
  def change
    add_column :collections, :match, :string
  end
end
