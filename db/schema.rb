# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_18_215538) do

  create_table "containers", force: :cascade do |t|
    t.decimal "tree_dimension_in_cubic_meters"
    t.integer "truck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["truck_id"], name: "index_containers_on_truck_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "social_number_id"
    t.string "driving_license"
    t.string "truck_license"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "legs", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.integer "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_legs_on_route_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "price"
    t.decimal "tree_dimension_in_cubic_meters"
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "largest_dimension_in_meters"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "price_amount"
    t.string "latitude"
    t.string "longitude"
    t.integer "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_orders_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.integer "truck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["truck_id"], name: "index_routes_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "license_plate"
    t.string "license"
    t.integer "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_trucks_on_driver_id"
  end

  add_foreign_key "containers", "trucks"
  add_foreign_key "legs", "routes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "routes"
  add_foreign_key "routes", "trucks"
  add_foreign_key "trucks", "drivers"
end
