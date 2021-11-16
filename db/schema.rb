# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_122849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_cart_products_on_product_id"
    t.index ["user_id"], name: "index_cart_products_on_user_id"
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "start_time"
    t.integer "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.bigint "product_version_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
    t.index ["product_version_id"], name: "index_order_products_on_product_version_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "delivery_time_id", null: false
    t.integer "sub_total_price"
    t.integer "cash_on_delivery"
    t.integer "postage"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "delivery_date"
    t.index ["delivery_time_id"], name: "index_orders_on_delivery_time_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_versions", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.boolean "published"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_versions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_delivery_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_delivery_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_products", "products"
  add_foreign_key "cart_products", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "product_versions"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "delivery_times"
  add_foreign_key "orders", "users"
  add_foreign_key "product_versions", "products"
  add_foreign_key "user_delivery_infos", "users"
end
