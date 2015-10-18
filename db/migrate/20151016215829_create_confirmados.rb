class CreateConfirmados < ActiveRecord::Migration
  def change
    create_table :confirmados do |t|
      t.integer :evento_id
      t.integer :login_id

      t.timestamps null: false
    end
  end
end
