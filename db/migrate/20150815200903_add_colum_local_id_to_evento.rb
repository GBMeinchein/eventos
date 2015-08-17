class AddColumLocalIdToEvento < ActiveRecord::Migration
  def change
  	add_column :eventos, :local_id, :integer
  end
end
