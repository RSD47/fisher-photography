class RemoveSeasonFromImage < ActiveRecord::Migration[7.1]
  def change
    remove_column :images, :season, :string
  end
end
