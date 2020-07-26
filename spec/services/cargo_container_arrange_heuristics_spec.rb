require 'rails_helper'

RSpec.describe "test_heuristics" do
  class Heuristics
  end

  before do
    @heuristics = Heuristics.new
    @heuristics.extend(CargoContainerArrangeHeuristics)

    @order_item1 = OrderItem.new(:id => 001,
                                  :tree_dimension_in_cubic_meters => 50,
                                  :largest_dimension_in_meters => 5)
    @order_item2 = OrderItem.new(:id => 002,
                                  :tree_dimension_in_cubic_meters => 20,
                                  :largest_dimension_in_meters => 2)

    @order1 = Order.new(:id => 01, :order_item => [@order_item1])
    @order2 = Order.new(:id => 02, :order_item => [@order_item2])
    @orders = [@order1, @order2]

    @container = Container.new(:id => 01, :tree_dimension_in_cubic_meters => 200,
                               :largest_dimension_in_meters => 10)
    @truck = Truck.new(:id => 01, :containers => [@container])
  end

  describe "arrange" do
    it "orders in truck container with 200m3 capacity" do
      expect(@heuristics.arrange_orders_in_container_by_volume(@orders, @truck)).to eq([@order_item1, @order_item2])
    end
  end
end
