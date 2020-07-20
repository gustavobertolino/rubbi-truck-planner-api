class ChangeOrderItem < ActiveRecord::Migration[6.0]
  def change
    change_table :order_items do |t|
      t.decimal :largest_dimension_in_meters
    end
  end
end
