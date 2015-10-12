class AddColunasToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :nome, :string
    add_column :logins, :access_token, :string
    add_column :logins, :uid, :string
    add_column :logins, :provider, :string
  end
end
