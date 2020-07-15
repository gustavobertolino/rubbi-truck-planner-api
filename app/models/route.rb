class Route < ApplicationRecord
  belongs_to :truck
  has_many :orders
end
