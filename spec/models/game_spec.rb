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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end
