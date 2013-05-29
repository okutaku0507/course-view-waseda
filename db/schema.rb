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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130529144450) do

  create_table "bads", :force => true do |t|
    t.integer  "member_id",      :null => false
    t.integer  "course_info_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "bads", ["course_info_id"], :name => "index_bads_on_course_info_id"
  add_index "bads", ["member_id"], :name => "index_bads_on_member_id"

  create_table "course_infos", :force => true do |t|
    t.string   "title",           :null => false
    t.string   "teacher",         :null => false
    t.string   "open_faculty",    :null => false
    t.string   "day_of_the_week", :null => false
    t.integer  "open_time",       :null => false
    t.string   "open_term",       :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "course_views", :force => true do |t|
    t.integer  "member_id",       :null => false
    t.integer  "course_info_id",  :null => false
    t.string   "title_of_course", :null => false
    t.text     "view",            :null => false
    t.integer  "id_course",       :null => false
    t.integer  "id_member",       :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "course_views", ["course_info_id"], :name => "index_course_views_on_course_info_id"
  add_index "course_views", ["member_id"], :name => "index_course_views_on_member_id"

  create_table "likes", :force => true do |t|
    t.integer  "member_id",      :null => false
    t.integer  "course_info_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "likes", ["course_info_id"], :name => "index_likes_on_course_info_id"
  add_index "likes", ["member_id"], :name => "index_likes_on_member_id"

  create_table "members", :force => true do |t|
    t.string   "family_name",                           :null => false
    t.string   "first_name",                            :null => false
    t.string   "email",                                 :null => false
    t.string   "email_confirmation"
    t.string   "faculty",                               :null => false
    t.string   "subject"
    t.integer  "gender",             :default => 0,     :null => false
    t.boolean  "administrator",      :default => false, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "hashed_password"
  end

  create_table "responses", :force => true do |t|
    t.integer  "member_id",      :null => false
    t.integer  "course_view_id", :null => false
    t.text     "view_response",  :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "responses", ["course_view_id"], :name => "index_responses_on_course_view_id"
  add_index "responses", ["member_id"], :name => "index_responses_on_member_id"

  create_table "take_courses", :force => true do |t|
    t.integer  "member_id",                :null => false
    t.integer  "course_info_id",           :null => false
    t.string   "take_course_title",        :null => false
    t.string   "take_course_open_week",    :null => false
    t.integer  "take_course_open_time",    :null => false
    t.integer  "id_of_take_course",        :null => false
    t.integer  "take_course_late_point",   :null => false
    t.integer  "take_course_absent_point", :null => false
    t.text     "take_course_note",         :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "take_courses", ["course_info_id"], :name => "index_take_courses_on_course_info_id"
  add_index "take_courses", ["member_id"], :name => "index_take_courses_on_member_id"

  create_table "teacher_ranks", :force => true do |t|
    t.integer  "member_id",      :null => false
    t.integer  "course_info_id", :null => false
    t.integer  "teacher_rank",   :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "teacher_ranks", ["course_info_id"], :name => "index_teacher_ranks_on_course_info_id"
  add_index "teacher_ranks", ["member_id"], :name => "index_teacher_ranks_on_member_id"

end
