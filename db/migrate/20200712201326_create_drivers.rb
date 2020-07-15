class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :social_number_id
      t.string :driving_license
      t.string :truck_license

      t.timestamps
    end
  end
end
