require 'deep_dup/core_ext/object'

# heuristics for arranging items in container
module CargoContainerArrangeHeuristics
  def arrange_orders_in_container_by_volume(orders, truck)
    truck_container = truck.containers.detect(&:itself)
    truck_container_volume = truck_container.tree_dimension_in_cubic_meters
    truck_container_prototype = []
    remaining_container_volume = truck_container_volume
    cloned_orders = orders

    cloned_order_items = cloned_orders.flat_map { |item| item.order_item }
    byebug
    cloned_order_items.sort_by(&:tree_dimension_in_cubic_meters).reverse

    cloned_order_items.each do |item|
      next if (item.largest_dimension_in_meters >= truck_container.largest_dimension_in_meters ||
               item.tree_dimension_in_cubic_meters >= truck_container_volume)

      break if remaining_container_volume.zero?

      remaining_container_volume -= item.tree_dimension_in_cubic_meters
      truck_container_prototype.append(item)
      item.is_order_item_arranged = true
    end

    truck_container.is_container_loaded = true
    truck_container_prototype
  end
end
