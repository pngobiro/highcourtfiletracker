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

ActiveRecord::Schema.define(:version => 20150415091627) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "batches", :force => true do |t|
    t.integer  "courtstation_id"
    t.string   "batch_name"
    t.string   "category"
    t.date     "date_out"
    t.string   "reason"
    t.string   "from"
    t.string   "destination"
    t.string   "officer_taking_action"
    t.string   "outcome"
    t.date     "result_date"
    t.text     "reason_for_rejection"
    t.string   "recordcreatedby"
    t.string   "recordupdatedby"
    t.text     "remarks"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "batches", ["courtstation_id"], :name => "index_batches_on_courtstation_id"

  create_table "batchships", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "casefile_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "casefiles", :force => true do |t|
    t.integer  "courtstation_id"
    t.string   "casenumber"
    t.integer  "caseindex"
    t.date     "dateoffilling"
    t.date     "approvaldate"
    t.string   "typeofcase"
    t.string   "casestatus"
    t.string   "parties_names"
    t.string   "deathcertserial",      :limit => 100, :null => false
    t.string   "deathcertnumber",      :limit => 100, :null => false
    t.string   "deceasedcitizenship"
    t.string   "deceasedresidence"
    t.string   "deceasedplaceofdeath"
    t.date     "deceaseddateofdeath"
    t.string   "parties_names_b"
    t.string   "natureofclaim"
    t.date     "gazettenoticedate"
    t.date     "objectiondate"
    t.date     "grantissueddate"
    t.date     "grantconfirmeddate"
    t.string   "mobile_num"
    t.text     "remarks"
    t.integer  "yearfiled"
    t.text     "recordcreatedby"
    t.text     "recordupdatedby"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "courtstations", :force => true do |t|
    t.string   "name"
    t.string   "typeofcourt"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "movements", :force => true do |t|
    t.integer  "casefile_id"
    t.date     "date_out"
    t.time     "time"
    t.string   "category"
    t.string   "from"
    t.string   "destination"
    t.string   "takenby"
    t.string   "reason"
    t.string   "outcome"
    t.date     "result_date"
    t.text     "reason_for_rejection"
    t.string   "officer"
    t.string   "recordcreatedby"
    t.string   "recordupdatedby"
    t.date     "datein"
    t.text     "remarks"
    t.string   "sms_sent"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "movements", ["casefile_id"], :name => "index_movements_on_casefile_id"

  create_table "sessions", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  create_table "sms", :force => true do |t|
    t.string   "station"
    t.string   "number"
    t.text     "sentmessage"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.integer  "courtstation_id"
    t.string   "admin"
    t.string   "pj"
    t.string   "mobile"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
