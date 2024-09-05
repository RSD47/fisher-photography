class RenamePhotosToImages < ActiveRecord::Migration[7.1]
  def change
    rename_table :photos, :images
  end
end
