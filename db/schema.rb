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

ActiveRecord::Schema.define(version: 2018_07_28_182320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fisicas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "endereco"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "juridicas", force: :cascade do |t|
    t.string "cnpj"
    t.string "razao"
    t.string "fantasia"
    t.string "telefone"
    t.string "endereco"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socios", force: :cascade do |t|
    t.boolean "administrador"
    t.string "token"
    t.bigint "fisica_id"
    t.bigint "juridica_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fisica_id"], name: "index_socios_on_fisica_id"
    t.index ["juridica_id"], name: "index_socios_on_juridica_id"
  end

  add_foreign_key "socios", "fisicas"
  add_foreign_key "socios", "juridicas"
end
