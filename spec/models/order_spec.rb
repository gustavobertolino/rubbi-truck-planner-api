require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'create new order' do
    @order = Order.new(:id => 1)
    expect(@order.id).to eq(1)
  end
end
