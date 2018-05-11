class City < ActiveRecord::Base
  has_many :teams
  has_many :sports, through: :teams
end
