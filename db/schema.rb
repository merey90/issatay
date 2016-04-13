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

ActiveRecord::Schema.define(version: 20160412105235) do

  create_table "albums", force: :cascade do |t|
    t.string   "picture"
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.text     "description"
    t.text     "description_kz"
    t.text     "description_ru"
    t.datetime "deleted_at"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "albums", ["deleted_at"], name: "index_albums_on_deleted_at"
  add_index "albums", ["description"], name: "index_albums_on_description"
  add_index "albums", ["description_kz"], name: "index_albums_on_description_kz"
  add_index "albums", ["description_ru"], name: "index_albums_on_description_ru"
  add_index "albums", ["title"], name: "index_albums_on_title"
  add_index "albums", ["title_kz"], name: "index_albums_on_title_kz"
  add_index "albums", ["title_ru"], name: "index_albums_on_title_ru"
  add_index "albums", ["user_id"], name: "index_albums_on_user_id"

  create_table "carousels", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.text     "description"
    t.text     "description_kz"
    t.text     "description_ru"
    t.text     "url"
    t.datetime "deleted_at"
    t.integer  "user_id"
    t.string   "picture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "carousels", ["deleted_at"], name: "index_carousels_on_deleted_at"
  add_index "carousels", ["description"], name: "index_carousels_on_description"
  add_index "carousels", ["description_kz"], name: "index_carousels_on_description_kz"
  add_index "carousels", ["description_ru"], name: "index_carousels_on_description_ru"
  add_index "carousels", ["title"], name: "index_carousels_on_title"
  add_index "carousels", ["title_kz"], name: "index_carousels_on_title_kz"
  add_index "carousels", ["title_ru"], name: "index_carousels_on_title_ru"
  add_index "carousels", ["user_id"], name: "index_carousels_on_user_id"

  create_table "novas", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.binary   "body"
    t.binary   "body_kz"
    t.binary   "body_ru"
    t.text     "short_body"
    t.text     "short_body_kz"
    t.text     "short_body_ru"
    t.string   "url"
    t.datetime "deleted_at"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "novas", ["body"], name: "index_novas_on_body"
  add_index "novas", ["body_kz"], name: "index_novas_on_body_kz"
  add_index "novas", ["body_ru"], name: "index_novas_on_body_ru"
  add_index "novas", ["deleted_at"], name: "index_novas_on_deleted_at"
  add_index "novas", ["short_body"], name: "index_novas_on_short_body"
  add_index "novas", ["short_body_kz"], name: "index_novas_on_short_body_kz"
  add_index "novas", ["short_body_ru"], name: "index_novas_on_short_body_ru"
  add_index "novas", ["title"], name: "index_novas_on_title"
  add_index "novas", ["title_kz"], name: "index_novas_on_title_kz"
  add_index "novas", ["title_ru"], name: "index_novas_on_title_ru"
  add_index "novas", ["user_id"], name: "index_novas_on_user_id"

  create_table "presses", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.binary   "body"
    t.binary   "body_kz"
    t.binary   "body_ru"
    t.text     "short_body"
    t.text     "short_body_kz"
    t.text     "short_body_ru"
    t.string   "url"
    t.datetime "deleted_at"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "presses", ["body"], name: "index_presses_on_body"
  add_index "presses", ["body_kz"], name: "index_presses_on_body_kz"
  add_index "presses", ["body_ru"], name: "index_presses_on_body_ru"
  add_index "presses", ["deleted_at"], name: "index_presses_on_deleted_at"
  add_index "presses", ["short_body"], name: "index_presses_on_short_body"
  add_index "presses", ["short_body_kz"], name: "index_presses_on_short_body_kz"
  add_index "presses", ["short_body_ru"], name: "index_presses_on_short_body_ru"
  add_index "presses", ["title"], name: "index_presses_on_title"
  add_index "presses", ["title_kz"], name: "index_presses_on_title_kz"
  add_index "presses", ["title_ru"], name: "index_presses_on_title_ru"
  add_index "presses", ["user_id"], name: "index_presses_on_user_id"

  create_table "simple_images", force: :cascade do |t|
    t.string   "picture"
    t.string   "title"
    t.string   "title_kz"
    t.string   "title_ru"
    t.text     "description"
    t.text     "description_kz"
    t.text     "description_ru"
    t.datetime "deleted_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "simple_images", ["deleted_at"], name: "index_simple_images_on_deleted_at"
  add_index "simple_images", ["description"], name: "index_simple_images_on_description"
  add_index "simple_images", ["description_kz"], name: "index_simple_images_on_description_kz"
  add_index "simple_images", ["description_ru"], name: "index_simple_images_on_description_ru"
  add_index "simple_images", ["imageable_type", "imageable_id"], name: "index_simple_images_on_imageable_type_and_imageable_id"
  add_index "simple_images", ["title"], name: "index_simple_images_on_title"
  add_index "simple_images", ["title_kz"], name: "index_simple_images_on_title_kz"
  add_index "simple_images", ["title_ru"], name: "index_simple_images_on_title_ru"

  create_table "static_fields", force: :cascade do |t|
    t.binary   "biography"
    t.binary   "biography_kz"
    t.binary   "biography_ru"
    t.binary   "contacts"
    t.binary   "contacts_kz"
    t.binary   "contacts_ru"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.binary   "about"
    t.binary   "about_kz"
    t.binary   "about_ru"
    t.binary   "home"
    t.binary   "home_kz"
    t.binary   "home_ru"
    t.binary   "help"
    t.binary   "help_kz"
    t.binary   "help_ru"
  end

  add_index "static_fields", ["biography"], name: "index_static_fields_on_biography"
  add_index "static_fields", ["biography_kz"], name: "index_static_fields_on_biography_kz"
  add_index "static_fields", ["biography_ru"], name: "index_static_fields_on_biography_ru"
  add_index "static_fields", ["contacts"], name: "index_static_fields_on_contacts"
  add_index "static_fields", ["contacts_kz"], name: "index_static_fields_on_contacts_kz"
  add_index "static_fields", ["contacts_ru"], name: "index_static_fields_on_contacts_ru"

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
