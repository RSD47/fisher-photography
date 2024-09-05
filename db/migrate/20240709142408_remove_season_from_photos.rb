class RemoveSeasonFromPhotos < ActiveRecord::Migration[7.1]
  def change
    remove_column :photos, :season, :string
  end
end
