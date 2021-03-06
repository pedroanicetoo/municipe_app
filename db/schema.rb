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

ActiveRecord::Schema[7.0].define(version: 2022_07_11_012719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zipcode"
    t.string "publicplace"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "uf"
    t.integer "ibgecode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipes", force: :cascade do |t|
    t.string "fullname"
    t.string "cpf"
    t.string "cns"
    t.string "email"
    t.date "birthdate"
    t.string "phone"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", null: false
    t.string "avatar_file_name"
    t.integer "avatar_file_size"
    t.string "avatar_content_type"
    t.datetime "avatar_updated_at", precision: nil
    t.index ["address_id"], name: "index_municipes_on_address_id"
  end

  add_foreign_key "municipes", "addresses"
end
