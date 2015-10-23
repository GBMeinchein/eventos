class AddNumeroConfirmadosToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :numeroConfirmados, :int
  end
end
