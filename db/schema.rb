# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_05_082321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barangs", force: :cascade do |t|
    t.string "nama_barang", limit: 25, null: false
    t.string "img_barang", null: false
    t.date "tgl", null: false
    t.integer "harga_awal", null: false
    t.text "deskripsi_barang", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "lelang_id"
    t.integer "barang_id"
    t.integer "masyarakat_id"
    t.integer "penawaran_harga"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lelangs", force: :cascade do |t|
    t.integer "barang_id"
    t.date "tgl_lelang"
    t.integer "harga_akhir"
    t.integer "masyarakat_id"
    t.integer "petugas_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "masyarakats", force: :cascade do |t|
    t.string "nama_lengkap", limit: 25
    t.string "username", limit: 25
    t.string "password_digest"
    t.string "telp", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "petugas", force: :cascade do |t|
    t.string "nama_petugas", limit: 25
    t.string "username", limit: 25
    t.string "password_digest"
    t.integer "level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
