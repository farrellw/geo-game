class Game < ActiveRecord::Base
  has_many :guesses
  belongs_to :locatable, polymorphic: true

  validates :country_id, {presence: true}
end
