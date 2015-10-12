class AddUserToEventos < ActiveRecord::Migration
  def change
  	add_column :eventos, :login_id, :integer
  end
end
