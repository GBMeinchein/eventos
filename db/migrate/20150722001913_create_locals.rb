class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :nome
      t.references :cidade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
