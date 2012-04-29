class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :score
      t.integer :owner_id
      t.integer :opponent_id
      t.time :game_time
      t.string :status

      t.timestamps
    end
  end
end
