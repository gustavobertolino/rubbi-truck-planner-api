class CreateContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :containers do |t|
      t.decimal :tree_dimension_in_cubic_meters
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
