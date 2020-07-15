class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.references :truck, null:false, foreign_key:true

      t.timestamps
    end
  end
end
