class AddEnderecoToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :endereco, :string
  end
end
