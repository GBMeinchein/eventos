class AddLatitudeAndLongitudeToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :latitude, :float
    add_column :locals, :longitude, :float
  end
end
