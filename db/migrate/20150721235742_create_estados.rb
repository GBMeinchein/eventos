class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :siglaEstado
      t.string :nome

      t.timestamps null: false
    end
  end
end
