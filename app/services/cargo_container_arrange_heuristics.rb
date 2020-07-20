# heuristics for arranging items in container
module CargoContainerArrangeHeuristics
  def arrange_orders_in_container_by_volume(orders, truck)
    truck_container = truck.containers.detect(&is_available?)
    truck_container_volume = truck_container.tri_dimension_in_cubic_meters
    truck_container_prototype = []
    remaining_container_volume = truck_container_volume

    cloned_orders = []
    orders.map { |item| cloned_orders.append(item) }
    cloned_orders.sort_by(&:tri_dimension_in_cubic_meters).reverse

    cloned_orders.each do |item|
      next if (item.largest_dimension >= truck_container.largest_dimension ||
               item.tri_dimension_in_cubic_meters >= truck_container_volume)

      break if remaining_container_volume.zero?

      remaining_container_volume -= item.tri_dimension_in_cubic_meters
      truck_container_prototype.append(item)
      item.is_arranged = true
      item.available_for_arrangement = false
    end

    truck.is_container_loaded = true
    truck.is_available_for_arrangement = false
    truck_container_prototype
  end
end
