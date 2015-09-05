class AddLatitudeToEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :latitude, :decimal
    add_column :eventos, :longitude, :decimal
  end
end
