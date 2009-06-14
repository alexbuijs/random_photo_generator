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

ActiveRecord::Schema.define(:version => 20090614160335) do

  create_table "analyses", :force => true do |t|
    t.integer  "session_id",            :null => false
    t.integer  "sample_size",           :null => false
    t.integer  "trials",                :null => false
    t.integer  "hits",                  :null => false
    t.decimal  "accumulated_deviation", :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "db_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "samples", :force => true do |t|
    t.string   "description",  :limit => nil, :null => false
    t.integer  "size",                        :null => false
    t.string   "content_type",                :null => false
    t.string   "filename",                    :null => false
    t.integer  "height",                      :null => false
    t.integer  "width",                       :null => false
    t.integer  "parent_id",                   :null => false
    t.string   "thumbnail",                   :null => false
    t.integer  "db_file_id",                  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "sender_id",                  :null => false
    t.integer  "max_sender_selection_time",  :null => false
    t.integer  "sender_focus_time",          :null => false
    t.integer  "max_receiver_response_time", :null => false
    t.integer  "recovery_time",              :null => false
    t.integer  "trial_size",                 :null => false
    t.integer  "sample_size",                :null => false
    t.string   "genre",                      :null => false
    t.string   "type",                       :null => false
    t.decimal  "genre_type_ratio",           :null => false
    t.boolean  "sampling_with_replacement",  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",        :null => false
    t.integer  "taggable_id",   :null => false
    t.integer  "tagger_id",     :null => false
    t.string   "tagger_type",   :null => false
    t.string   "taggable_type", :null => false
    t.string   "context",       :null => false
    t.datetime "created_at",    :null => false
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "trials", :force => true do |t|
    t.integer  "session_id",                  :null => false
    t.integer  "receiver_id",                 :null => false
    t.integer  "sender_selection_time",       :null => false
    t.integer  "receiver_response_time",      :null => false
    t.integer  "sender_selected_sample_id",   :null => false
    t.integer  "receiver_selected_sample_id", :null => false
    t.boolean  "hit",                         :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "current_login_at",                  :null => false
    t.datetime "last_login_at",                     :null => false
    t.string   "current_login_ip",                  :null => false
    t.string   "last_login_ip",                     :null => false
    t.integer  "role",                              :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
