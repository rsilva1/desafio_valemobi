class Depot < ActiveRecord::Base
  belongs_to :user
  has_many :depots_items
  has_many :items, through: :depots_items
end
