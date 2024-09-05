class AddCollectionIdToImage < ActiveRecord::Migration[7.1]
  def change
    add_reference :images, :collection, null: false, foreign_key: true
  end
end
