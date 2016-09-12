# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160912001052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "deals", force: :cascade do |t|
    t.string   "deal_type"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "item_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["buyer_id"], name: "index_deals_on_buyer_id", using: :btree
  add_index "deals", ["item_id"], name: "index_deals_on_item_id", using: :btree
  add_index "deals", ["seller_id"], name: "index_deals_on_seller_id", using: :btree

  create_table "depots", force: :cascade do |t|
    t.integer "user_id"
  end

  add_index "depots", ["user_id"], name: "index_depots_on_user_id", using: :btree

  create_table "depots_items", id: false, force: :cascade do |t|
    t.integer "depot_id", null: false
    t.integer "item_id",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.decimal "price"
  end

  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer "user_id"
    t.text    "commentary"
  end

  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.text     "description"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "deals", "items"
  add_foreign_key "depots", "users"
  add_foreign_key "items", "products"
  add_foreign_key "offers", "users"
  add_foreign_key "products", "categories"
end
