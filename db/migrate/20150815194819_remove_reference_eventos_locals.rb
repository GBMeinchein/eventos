class RemoveReferenceEventosLocals < ActiveRecord::Migration
  def change
  	remove_column :eventos, :locals_id, :local
  end
end
