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

ActiveRecord::Schema[7.0].define(version: 2023_09_01_005141) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.bigint "type_id", null: false
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_accounts_on_type_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "formal_name"
    t.string "rut"
    t.json "contact_info"
    t.json "address"
    t.string "line_of_business"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["rut"], name: "index_companies_on_rut", unique: true
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "comunes", force: :cascade do |t|
    t.string "comuna"
    t.bigint "province_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_comunes_on_province_id"
    t.index ["region_id"], name: "index_comunes_on_region_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "provincia"
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "region"
    t.string "ordinal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "last_name"
    t.string "rut"
    t.json "address"
    t.json "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1
    t.bigint "supervisor_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["supervisor_id"], name: "index_users_on_supervisor_id"
  end

  add_foreign_key "accounts", "account_types", column: "type_id"
  add_foreign_key "companies", "users"
  add_foreign_key "comunes", "provinces"
  add_foreign_key "comunes", "regions"
  add_foreign_key "provinces", "regions"
  add_foreign_key "users", "users", column: "supervisor_id"
end
