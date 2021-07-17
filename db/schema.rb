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

ActiveRecord::Schema.define(version: 20210717135328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "os_resources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "r"
    t.integer  "b"
    t.integer  "swpd"
    t.integer  "free"
    t.integer  "buff"
    t.integer  "cache"
    t.integer  "si"
    t.integer  "so"
    t.integer  "bi"
    t.integer  "bo"
    t.integer  "in"
    t.integer  "cs"
    t.integer  "us"
    t.integer  "sy"
    t.integer  "idle"
    t.integer  "wa"
    t.integer  "st"
    t.integer  "server_id"
    t.index ["server_id"], name: "index_os_resources_on_server_id", using: :btree
  end

  create_table "servers", force: :cascade do |t|
    t.string   "server_ip"
    t.string   "server_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "os_resources", "servers"
end
