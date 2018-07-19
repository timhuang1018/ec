# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180714033711) do

  create_table "cart_details", force: :cascade do |t|
    t.string "product_name"
    t.integer "quantity"
    t.integer "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_record_id"
    t.integer "product_subtal"
    t.index ["cart_record_id"], name: "index_cart_details_on_cart_record_id"
  end

  create_table "cart_records", force: :cascade do |t|
    t.integer "user_id"
    t.string "user_name"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buy_date"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_categories_on_product_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "quantity"
    t.integer "in_stocks"
    t.integer "safety_stocks"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["in_stocks"], name: "index_products_on_in_stocks"
    t.index ["safety_stocks"], name: "index_products_on_safety_stocks"
  end

  create_table "replenish_details", force: :cascade do |t|
    t.string "product_name"
    t.integer "amount"
    t.integer "after_instock"
    t.integer "unit_price"
    t.integer "subtal_price"
    t.integer "unit_weight"
    t.integer "subtal_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "replenish_id"
    t.index ["replenish_id"], name: "index_replenish_details_on_replenish_id"
  end

  create_table "replenishes", force: :cascade do |t|
    t.string "name"
    t.integer "total_weight"
    t.integer "freight_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
