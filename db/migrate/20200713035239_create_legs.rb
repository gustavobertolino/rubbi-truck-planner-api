class CreateLegs < ActiveRecord::Migration[6.0]
  def change
    create_table :legs do |t|
      t.string :latitude
      t.string :longitude
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
