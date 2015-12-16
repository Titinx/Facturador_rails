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

ActiveRecord::Schema.define(version: 20151216162229) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birthday"
    t.string   "gender"
    t.string   "kind_document"
    t.integer  "document"
    t.string   "cuil_cuit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "kind"
    t.string   "data"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id"

  create_table "invoices", force: :cascade do |t|
    t.text     "description"
    t.float    "amount"
    t.date     "date"
    t.integer  "person_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"
  add_index "invoices", ["person_id"], name: "index_invoices_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birthday"
    t.string   "gender"
    t.string   "kind_document"
    t.integer  "document"
    t.string   "cuil_cuit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
