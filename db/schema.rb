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

ActiveRecord::Schema.define(version: 20150530064324) do

  create_table "addresses", force: :cascade do |t|
    t.string   "zip_code",   limit: 255, null: false
    t.string   "detail",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.string   "phone",      limit: 255,             null: false
    t.integer  "gender",                 default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "tel",        limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "customer_id"
    t.decimal  "total_cost",    precision: 8, scale: 2, default: 0.0
    t.decimal  "price",         precision: 8, scale: 2, default: 0.0
    t.datetime "transacted_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["merchant_id"], name: "index_orders_on_merchant_id"

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255,                                       null: false
    t.decimal  "price",                  precision: 8, scale: 2, default: 0.0
    t.string   "unit",                                           default: "个"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

end
