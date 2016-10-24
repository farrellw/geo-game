class Game < ActiveRecord::Base
  has_many :guesses
  belongs_to :country

  validates :country_id, {presence: true}
end
