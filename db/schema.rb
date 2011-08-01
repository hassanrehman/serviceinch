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

ActiveRecord::Schema.define(:version => 20110719202915) do

  create_table "customers", :force => true do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.string   "zip"
    t.string   "website"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "work_phone"
    t.integer  "state_id"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_categories", :force => true do |t|
    t.string   "name"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_changes", :force => true do |t|
    t.integer  "ticket_note_id"
    t.string   "changed_field"
    t.string   "old_value"
    t.string   "new_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_notes", :force => true do |t|
    t.integer  "updated_by_id"
    t.text     "comments"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_priorities", :force => true do |t|
    t.string   "name"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_statuses", :force => true do |t|
    t.string   "name"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "added_by_id"
    t.string   "subject"
    t.text     "description"
    t.integer  "ticket_status_id"
    t.integer  "ticket_priority_id"
    t.integer  "assignee_id"
    t.integer  "ticket_category_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_accesses", :force => true do |t|
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "manage_customers"
    t.boolean  "manage_tickets"
    t.boolean  "manage_ticket_categories"
    t.boolean  "manage_agents"
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
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
