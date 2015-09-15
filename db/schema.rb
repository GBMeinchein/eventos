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

ActiveRecord::Schema.define(version: 20150912181210) do

  create_table "cidades", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.integer  "estado_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "siglaEstado", limit: 255
    t.string   "nome",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "titulo",     limit: 255
    t.text     "descricao",  limit: 65535
    t.datetime "inicio"
    t.datetime "termino"
    t.string   "imagem",     limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "locals_id",  limit: 4
    t.integer  "local_id",   limit: 4
    t.decimal  "latitude",                 precision: 10
    t.decimal  "longitude",                precision: 10
  end

  add_index "eventos", ["locals_id"], name: "FK_COD_LOCAL", using: :btree

  create_table "locals", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.integer  "cidade_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "evento_id",  limit: 4
    t.string   "endereco",   limit: 255
    t.float    "latitude",   limit: 53
    t.float    "longitude",  limit: 53
  end

  add_index "locals", ["cidade_id"], name: "index_locals_on_cidade_id", using: :btree

  create_table "logins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "logins", ["email"], name: "index_logins_on_email", unique: true, using: :btree
  add_index "logins", ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome",         limit: 255
    t.string   "login",        limit: 255
    t.string   "email",        limit: 255
    t.string   "senha",        limit: 255
    t.datetime "dataCadastro"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "cidades", "estados"
  add_foreign_key "eventos", "locals", column: "locals_id", name: "FK_COD_LOCAL"
  add_foreign_key "locals", "cidades"
end
