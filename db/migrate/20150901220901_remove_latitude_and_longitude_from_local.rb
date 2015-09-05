class RemoveLatitudeAndLongitudeFromLocal < ActiveRecord::Migration
  def change
    remove_column :locals, :latitude, :decimal
    remove_column :locals, :longitude, :decimal
  end
end
