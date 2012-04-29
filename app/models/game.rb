# == Schema Information
#
# Table name: games
#
#  id          :integer(4)      not null, primary key
#  score       :string(255)
#  owner_id    :integer(4)
#  opponent_id :integer(4)
#  game_time   :time
#  status      :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Game < ActiveRecord::Base

  attr_accessible :game_time, :opponent_id, :owner_id, :score, :status

  belongs_to :gamer, :foreign_key => 'owner_id'

end
