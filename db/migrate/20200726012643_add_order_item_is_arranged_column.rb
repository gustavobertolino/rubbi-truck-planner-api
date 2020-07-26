class AddOrderItemIsArrangedColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :order_items do |t|
      t.boolean :is_order_item_arranged
    end
  end
end
