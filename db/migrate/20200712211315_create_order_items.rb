class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :price
      t.decimal :tree_dimension_in_cubic_meters
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
