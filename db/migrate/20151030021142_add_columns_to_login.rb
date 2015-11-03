class AddColumnsToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :oauth_token, :string
    add_column :logins, :token_secret, :string
  end
end
