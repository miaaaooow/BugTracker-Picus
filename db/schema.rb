# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100425234909) do

  create_table "bugs", :force => true do |t|
    t.string   "name",                       :null => false
    t.text     "description"
    t.integer  "priority",    :default => 1
    t.integer  "status_id",                  :null => false
    t.integer  "user_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs_users", :id => false, :force => true do |t|
    t.integer  "bug_id",     :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "change_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "bug_id",                        :null => false
    t.integer  "change_type_id", :default => 0, :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                              :null => false
    t.string   "name"
    t.string   "email",                                 :null => false
    t.string   "encrypted_password",                    :null => false
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about"
  end

  create_table "versions", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
