class AddViewsToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :views, :integer
  end
end
