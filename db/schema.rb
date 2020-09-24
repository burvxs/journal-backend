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

ActiveRecord::Schema.define(version: 2020_09_22_093744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "future_proofers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "time_frame"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.text "weekly_review"
    t.text "daily_review"
    t.text "future_proof_review"
    t.integer "future_proofer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_lists", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "sub_list_id"
    t.integer "future_proof_id"
    t.text "task"
    t.integer "priority_level"
    t.string "solidifier"
    t.boolean "completed"
    t.boolean "global"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "grand_total"
    t.integer "weekly_total"
    t.integer "daily_total"
    t.integer "incomplete_total"
    t.integer "incomplete_daily_total"
    t.integer "incomplete_weekly_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "name"
    t.boolean "prioritising"
    t.boolean "daily_review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "password_digest"
  end

end
