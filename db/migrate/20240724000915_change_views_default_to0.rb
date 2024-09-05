class ChangeViewsDefaultTo0 < ActiveRecord::Migration[7.1]
  def change
    change_column :images, :views, :integer, default: 0
  end
end
