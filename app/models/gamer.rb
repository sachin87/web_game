class Gamer < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :games
end
