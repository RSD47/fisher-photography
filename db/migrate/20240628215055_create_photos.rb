class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.datetime :season
      t.string :match

      t.timestamps
    end
  end
end
