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

ActiveRecord::Schema.define(version: 20150609130821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "q1",         default: 0.0
    t.float    "q2",         default: 0.0
    t.float    "q3",         default: 0.0
    t.float    "q4",         default: 0.0
    t.float    "q5",         default: 0.0
    t.float    "q6",         default: 0.0
    t.float    "q7",         default: 0.0
    t.float    "q8",         default: 0.0
    t.float    "q9",         default: 0.0
    t.float    "q10",        default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "homepages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kimms", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "jenis_sim"
    t.datetime "masa_berlaku_sim"
    t.datetime "masa_berlaku_stnk"
    t.datetime "masa_berlaku_kir"
    t.datetime "masa_berlaku_tera"
    t.string   "no_polisi"
    t.string   "tipe"
    t.string   "kapasitas"
    t.boolean  "admin_approval"
    t.boolean  "crew_approval"
    t.string   "message"
    t.string   "admin_approved_by"
    t.string   "crew_approved_by"
    t.string   "no_registrasi"
    t.string   "merek_kendaraan"
    t.datetime "expired_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "sim_file_name"
    t.string   "sim_content_type"
    t.integer  "sim_file_size"
    t.datetime "sim_updated_at"
    t.string   "stnk_file_name"
    t.string   "stnk_content_type"
    t.integer  "stnk_file_size"
    t.datetime "stnk_updated_at"
    t.string   "kir_file_name"
    t.string   "kir_content_type"
    t.integer  "kir_file_size"
    t.datetime "kir_updated_at"
    t.string   "tera_file_name"
    t.string   "tera_content_type"
    t.integer  "tera_file_size"
    t.datetime "tera_updated_at"
    t.string   "ktp_file_name"
    t.string   "ktp_content_type"
    t.integer  "ktp_file_size"
    t.datetime "ktp_updated_at"
    t.string   "surat_permohonan_file_name"
    t.string   "surat_permohonan_content_type"
    t.integer  "surat_permohonan_file_size"
    t.datetime "surat_permohonan_updated_at"
    t.datetime "masa_berlaku_kir_skid_tank"
    t.string   "kir_skid_tank_file_name"
    t.string   "kir_skid_tank_content_type"
    t.integer  "kir_skid_tank_file_size"
    t.datetime "kir_skid_tank_updated_at"
  end

  create_table "lkps", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "tanggal_kejadian"
    t.string   "jam_kejadian"
    t.string   "lokasi_kejadian"
    t.string   "bentuk_kejadian"
    t.text     "kronologis"
    t.text     "sebab_kecelakaan"
    t.integer  "korban"
    t.integer  "kerugian_materi"
    t.string   "gangguan_operasi"
    t.text     "upaya_penanggulangan"
    t.text     "saran_pencegahan"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   default: "User", null: false
    t.string   "email_recovery"
    t.string   "nama"
    t.string   "alamat"
    t.string   "kota"
    t.string   "telp"
    t.string   "fax"
    t.string   "jenis_anggota"
    t.boolean  "admin_approval",         default: false
    t.string   "created_by"
    t.string   "approved_by"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
