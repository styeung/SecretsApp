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

ActiveRecord::Schema.define(version: 20140815185654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: true do |t|
    t.integer  "in_friend_id",  null: false
    t.integer  "out_friend_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["in_friend_id", "out_friend_id"], name: "index_friendships_on_in_friend_id_and_out_friend_id", unique: true, using: :btree
  add_index "friendships", ["in_friend_id"], name: "index_friendships_on_in_friend_id", using: :btree
  add_index "friendships", ["out_friend_id"], name: "index_friendships_on_out_friend_id", using: :btree

  create_table "secret_taggings", force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "secret_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "secret_taggings", ["secret_id"], name: "index_secret_taggings_on_secret_id", using: :btree
  add_index "secret_taggings", ["tag_id", "secret_id"], name: "index_secret_taggings_on_tag_id_and_secret_id", unique: true, using: :btree
  add_index "secret_taggings", ["tag_id"], name: "index_secret_taggings_on_tag_id", using: :btree

  create_table "secrets", force: true do |t|
    t.string   "title",        null: false
    t.integer  "author_id",    null: false
    t.integer  "recipient_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "secrets", ["author_id"], name: "index_secrets_on_author_id", using: :btree
  add_index "secrets", ["recipient_id"], name: "index_secrets_on_recipient_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "session_token",   null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
