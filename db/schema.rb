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

ActiveRecord::Schema.define(version: 20151207110654) do

  create_table "paragraphs", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.text     "body"
    t.text     "body_kz"
    t.text     "body_ru"
    t.text     "image1"
    t.text     "image2"
    t.text     "image3"
    t.text     "image4"
    t.text     "image5"
    t.text     "image6"
    t.text     "image7"
    t.datetime "deleted_at"
    t.integer  "press_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paragraphs", ["body"], name: "index_paragraphs_on_body"
  add_index "paragraphs", ["body_kz"], name: "index_paragraphs_on_body_kz"
  add_index "paragraphs", ["body_ru"], name: "index_paragraphs_on_body_ru"
  add_index "paragraphs", ["press_id"], name: "index_paragraphs_on_press_id"
  add_index "paragraphs", ["title"], name: "index_paragraphs_on_title"
  add_index "paragraphs", ["title_kz"], name: "index_paragraphs_on_title_kz"
  add_index "paragraphs", ["title_ru"], name: "index_paragraphs_on_title_ru"

  create_table "presses", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.text     "body"
    t.text     "body_kz"
    t.text     "body_ru"
    t.string   "short_body"
    t.string   "short_body_kz"
    t.string   "short_body_ru"
    t.text     "url"
    t.text     "image1"
    t.text     "image2"
    t.text     "image3"
    t.text     "image4"
    t.text     "image5"
    t.text     "image6"
    t.text     "image7"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "presses", ["body"], name: "index_presses_on_body"
  add_index "presses", ["body_kz"], name: "index_presses_on_body_kz"
  add_index "presses", ["body_ru"], name: "index_presses_on_body_ru"
  add_index "presses", ["short_body"], name: "index_presses_on_short_body"
  add_index "presses", ["short_body_kz"], name: "index_presses_on_short_body_kz"
  add_index "presses", ["short_body_ru"], name: "index_presses_on_short_body_ru"
  add_index "presses", ["title"], name: "index_presses_on_title"
  add_index "presses", ["title_kz"], name: "index_presses_on_title_kz"
  add_index "presses", ["title_ru"], name: "index_presses_on_title_ru"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
