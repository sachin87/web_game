class AddIndexToGamersEmail < ActiveRecord::Migration
  def change
    add_index :gamers, :email, unique: true
  end
end
