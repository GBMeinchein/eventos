class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :login
      t.string :email
      t.string :senha
      t.datetime :dataCadastro

      t.timestamps null: false
    end
  end
end
