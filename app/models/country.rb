class Country < ActiveRecord::Base
  has_many :games, as: :locatable
end
