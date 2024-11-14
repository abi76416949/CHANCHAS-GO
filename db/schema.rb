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

ActiveRecord::Schema[7.0].define(version: 2024_11_12_065717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "usuario"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canchas", force: :cascade do |t|
    t.bigint "polideportivo_id", null: false
    t.string "nombre", null: false
    t.text "descripcion"
    t.float "precio_dia"
    t.float "precio_noche"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["polideportivo_id"], name: "index_canchas_on_polideportivo_id"
  end

  create_table "polideportivos", force: :cascade do |t|
    t.string "nombre"
    t.string "ubicacion"
    t.string "categoria"
    t.text "descripcion"
    t.string "contacto"
    t.string "ubicacion_api"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_url"
  end

  create_table "propietarios", id: :bigint, default: -> { "nextval('propietario_deportivos_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "nombre"
    t.string "numero"
    t.bigint "polideportivo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["polideportivo_id"], name: "index_propietario_deportivos_on_polideportivo_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "telefono"
    t.string "email"
    t.bigint "cancha_id", null: false
    t.date "fecha"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cancha_id"], name: "index_reservas_on_cancha_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "canchas", "polideportivos"
  add_foreign_key "propietarios", "polideportivos"
  add_foreign_key "reservas", "canchas", on_delete: :cascade
end
