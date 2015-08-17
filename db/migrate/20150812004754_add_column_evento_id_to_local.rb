class AddColumnEventoIdToLocal < ActiveRecord::Migration
  def change
  	add_column :locals, :evento_id, :integer
  end
end
