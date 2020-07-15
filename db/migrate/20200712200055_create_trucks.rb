class CreateTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :trucks do |t|
      t.string :license_plate
      t.string :license
      t.references :driver, null:false, foreign_key:true

      t.timestamps
    end
  end
end
