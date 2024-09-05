class RemoveMatchFromPhotos < ActiveRecord::Migration[7.1]
  def change
    remove_column :photos, :match, :string
  end
end
