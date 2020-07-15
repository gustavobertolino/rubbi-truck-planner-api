class Order < ApplicationRecord
  belongs_to :route
  has_many :order_item
end
