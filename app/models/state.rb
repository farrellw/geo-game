class State < ActiveRecord::Base
  has_many :games, as: :locatable
end
