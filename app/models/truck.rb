class Truck < ApplicationRecord
  belongs_to :driver
  has_many :routes
  has_many :containers
end
