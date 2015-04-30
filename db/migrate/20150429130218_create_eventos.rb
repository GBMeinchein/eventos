class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.text :descricao
      t.datetime :inicio
      t.datetime :termino
      t.string :imagem

      t.timestamps null: false
    end
  end
end
