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

ActiveRecord::Schema.define(version: 20151002055416) do

  create_table "answers", force: true do |t|
    t.integer  "choice_id"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: true do |t|
    t.integer  "quiz_id"
    t.text     "choice_txt"
    t.integer  "correct_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.string   "participant"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "tag"
    t.integer  "count"
    t.integer  "cp_one"
    t.integer  "cp_two"
    t.integer  "cp_three"
    t.integer  "cp_four"
    t.integer  "cp_five"
    t.integer  "cp_one_second"
    t.integer  "cp_two_second"
    t.integer  "cp_three_second"
    t.integer  "cp_four_second"
    t.integer  "cp_five_second"
    t.integer  "cp_one_third"
    t.integer  "cp_two_third"
    t.integer  "cp_three_third"
    t.integer  "cp_four_third"
    t.integer  "cp_five_third"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: true do |t|
    t.text     "identification"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.integer  "quiz_num"
    t.text     "quiz_txt"
    t.text     "quiz_img_path"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
