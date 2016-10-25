class Game < ActiveRecord::Base
  has_many :guesses
  belongs_to :locatable, polymorphic: true

  validates :locatable_id, {presence: true}
end
