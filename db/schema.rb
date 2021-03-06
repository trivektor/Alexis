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

ActiveRecord::Schema.define(:version => 20110318022820) do

  create_table "background_colors", :force => true do |t|
    t.string   "hex_value"
    t.string   "status",     :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_card_backgrounds", :force => true do |t|
    t.integer  "business_card_id"
    t.string   "background_color", :default => ""
    t.string   "background_image", :default => "noise.jpg"
    t.string   "which",            :default => "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_card_informations", :force => true do |t|
    t.integer  "business_card_id"
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.string   "website"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_card_section_orders", :force => true do |t|
    t.integer  "business_card_id"
    t.string   "section"
    t.string   "name"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_card_themes", :force => true do |t|
    t.integer  "business_card_id"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_cards", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.string   "title"
    t.string   "card_type",  :default => "personal"
    t.string   "status",     :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.string   "job_title"
    t.string   "website"
    t.string   "gender",      :default => "male"
    t.text     "about_me"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linked_in"
    t.string   "dribble"
    t.string   "gowalla"
    t.string   "forrst"
    t.string   "quora"
    t.string   "foursquare"
    t.string   "flickr"
    t.boolean  "hidden",      :default => false
    t.string   "status",      :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "default",    :default => false
    t.string   "status",     :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitor_infos", :force => true do |t|
    t.integer  "business_card_id"
    t.string   "browser"
    t.string   "version"
    t.string   "platform"
    t.string   "domain_name"
    t.string   "ip_address"
    t.string   "province"
    t.string   "state"
    t.string   "country_code"
    t.string   "zip"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
