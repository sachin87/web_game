class Game < ActiveRecord::Base
  attr_accessible :game_time, :opponent_id, :owner_id, :score, :status
  belongs_to :gamer, :foreign_key => 'owner_id'
end
