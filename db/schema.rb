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

ActiveRecord::Schema.define(version: 20131120011657) do

  create_table "activities", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.string   "link"
    t.integer  "xp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id", "title"], name: "index_activities_on_user_id_and_title"

  create_table "contributions", force: true do |t|
    t.integer  "goal_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["activity_id"], name: "index_contributions_on_activity_id"
  add_index "contributions", ["goal_id"], name: "index_contributions_on_goal_id"

  create_table "goals", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id", "content"], name: "index_goals_on_user_id_and_content"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
