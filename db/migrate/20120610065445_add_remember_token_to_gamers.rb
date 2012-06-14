class AddRememberTokenToGamers < ActiveRecord::Migration
  def change
    add_column :gamers, :remember_token, :string
    add_index  :gamers, :remember_token
  end
end
