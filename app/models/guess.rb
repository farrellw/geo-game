class Guess < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
end
