# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080709201512) do

  create_table "comments", :force => true do |t|
    t.integer  "commentary_id",   :limit => 11
    t.string   "commentary_type"
    t.string   "comment"
    t.integer  "user_id",         :limit => 11
    t.integer  "study_case_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id",       :limit => 11
    t.integer  "study_case_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "link"
    t.boolean  "is_duration",                 :default => false
  end

  create_table "faq_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",        :limit => 11, :default => 0
    t.integer  "faq_category_id", :limit => 11
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.integer  "study_case_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_cases", :force => true do |t|
    t.string   "name"
    t.integer  "user_id",     :limit => 11
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.string   "password_reset_code",       :limit => 40
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
