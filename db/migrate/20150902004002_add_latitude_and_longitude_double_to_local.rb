class AddLatitudeAndLongitudeDoubleToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :latitude, :double
    add_column :locals, :longitude, :double
  end
end
