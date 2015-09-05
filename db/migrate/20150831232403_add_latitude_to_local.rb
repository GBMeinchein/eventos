class AddLatitudeToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :latitude, :decimal
    add_column :locals, :longitude, :decimal
  end
end
