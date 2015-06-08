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

ActiveRecord::Schema.define(version: 20150602083919) do

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "q1",         limit: 24, default: 0.0
    t.float    "q2",         limit: 24, default: 0.0
    t.float    "q3",         limit: 24, default: 0.0
    t.float    "q4",         limit: 24, default: 0.0
    t.float    "q5",         limit: 24, default: 0.0
    t.float    "q6",         limit: 24, default: 0.0
    t.float    "q7",         limit: 24, default: 0.0
    t.float    "q8",         limit: 24, default: 0.0
    t.float    "q9",         limit: 24, default: 0.0
    t.float    "q10",        limit: 24, default: 0.0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "homepages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kimms", force: :cascade do |t|
    t.integer  "user_id",                       limit: 4
    t.string   "jenis_sim",                     limit: 255
    t.datetime "masa_berlaku_sim"
    t.datetime "masa_berlaku_stnk"
    t.datetime "masa_berlaku_kir"
    t.datetime "masa_berlaku_tera"
    t.string   "no_polisi",                     limit: 255
    t.string   "tipe",                          limit: 255
    t.string   "kapasitas",                     limit: 255
    t.boolean  "admin_approval",                limit: 1
    t.boolean  "crew_approval",                 limit: 1
    t.string   "message",                       limit: 255
    t.string   "admin_approved_by",             limit: 255
    t.string   "crew_approved_by",              limit: 255
    t.string   "no_registrasi",                 limit: 255
    t.string   "merek_kendaraan",               limit: 255
    t.datetime "expired_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "sim_file_name",                 limit: 255
    t.string   "sim_content_type",              limit: 255
    t.integer  "sim_file_size",                 limit: 4
    t.datetime "sim_updated_at"
    t.string   "stnk_file_name",                limit: 255
    t.string   "stnk_content_type",             limit: 255
    t.integer  "stnk_file_size",                limit: 4
    t.datetime "stnk_updated_at"
    t.string   "kir_file_name",                 limit: 255
    t.string   "kir_content_type",              limit: 255
    t.integer  "kir_file_size",                 limit: 4
    t.datetime "kir_updated_at"
    t.string   "tera_file_name",                limit: 255
    t.string   "tera_content_type",             limit: 255
    t.integer  "tera_file_size",                limit: 4
    t.datetime "tera_updated_at"
    t.string   "ktp_file_name",                 limit: 255
    t.string   "ktp_content_type",              limit: 255
    t.integer  "ktp_file_size",                 limit: 4
    t.datetime "ktp_updated_at"
    t.string   "surat_permohonan_file_name",    limit: 255
    t.string   "surat_permohonan_content_type", limit: 255
    t.integer  "surat_permohonan_file_size",    limit: 4
    t.datetime "surat_permohonan_updated_at"
  end

  create_table "lkps", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.datetime "tanggal_kejadian"
    t.string   "jam_kejadian",         limit: 255
    t.string   "lokasi_kejadian",      limit: 255
    t.string   "bentuk_kejadian",      limit: 255
    t.text     "kronologis",           limit: 65535
    t.text     "sebab_kecelakaan",     limit: 65535
    t.integer  "korban",               limit: 4
    t.integer  "kerugian_materi",      limit: 4
    t.string   "gangguan_operasi",     limit: 255
    t.text     "upaya_penanggulangan", limit: 65535
    t.text     "saran_pencegahan",     limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255, default: "User", null: false
    t.string   "email_recovery",         limit: 255
    t.string   "nama",                   limit: 255
    t.string   "alamat",                 limit: 255
    t.string   "kota",                   limit: 255
    t.string   "telp",                   limit: 255
    t.string   "fax",                    limit: 255
    t.string   "jenis_anggota",          limit: 255
    t.boolean  "admin_approval",         limit: 1,   default: false
    t.string   "created_by",             limit: 255
    t.string   "approved_by",            limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "photo_file_name",        limit: 255
    t.string   "photo_content_type",     limit: 255
    t.integer  "photo_file_size",        limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
