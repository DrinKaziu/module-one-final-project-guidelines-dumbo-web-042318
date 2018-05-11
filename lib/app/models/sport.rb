class Sport < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :teams
  has_many :cities, through: :teams
end
