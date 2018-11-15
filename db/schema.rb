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

ActiveRecord::Schema.define(version: 2018_10_25_050946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donacions", force: :cascade do |t|
    t.string "nombre"
    t.string "estado"
    t.string "categoria"
    t.integer "cantidad"
    t.string "img"
    t.string "descripcion"
    t.bigint "users_id", 
    t.bigint "estados_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_donacions_on_users_id"
    t.index ["estados_id"], name: "index_donacions_on_estados_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "estados", force: :cascade do |t|
    t.string "name"
    t.index ["users_id"], name: "index_donacions_on_users_id"
    t.index ["estados_id"], name: "index_donacions_on_estados_id"
    t.index ["name"], name: "index_estados_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 55, null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "nombres", null: false
    t.string "apellidos", null: false
    t.date "fecha_nac", null: false
    t.string "direccion", null: false
    t.string "telefono", null: false
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "donacions", "users", column: "users_id"
  add_foreign_key "users", "roles"
end
