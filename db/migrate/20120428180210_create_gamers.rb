class CreateGamers < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
