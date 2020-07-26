class AddContainerIsLoadedColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :containers do |t|
      t.boolean :is_container_loaded
    end
  end
end
