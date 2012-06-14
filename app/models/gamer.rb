# == Schema Information
#
# Table name: gamers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Gamer < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :games

  has_secure_password
  before_save { email.downcase! }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 15}
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
