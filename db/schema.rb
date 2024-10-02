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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_195237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "telefone", null: false
    t.date "data_nascimento", null: false
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.datetime "data_hora", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.jsonb "produtos_quantidade", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pedidos", "clientes"
end
