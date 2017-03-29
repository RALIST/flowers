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

ActiveRecord::Schema.define(version: 20170329070528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "country"
    t.string   "city",       default: "Ижевск"
    t.string   "street"
    t.string   "house"
    t.string   "flat"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balloons", force: :cascade do |t|
    t.float    "price"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.text     "desc"
    t.integer  "checkout_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["checkout_id"], name: "index_cards_on_checkout_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id", using: :btree
  end

  create_table "checkouts", force: :cascade do |t|
    t.integer  "cart_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "address_id"
    t.string   "order_date"
    t.string   "delivery"
    t.integer  "card_id"
    t.boolean  "call_receiver"
    t.boolean  "dont_call"
    t.time     "order_time"
    t.index ["address_id"], name: "index_checkouts_on_address_id", using: :btree
    t.index ["card_id"], name: "index_checkouts_on_card_id", using: :btree
    t.index ["cart_id"], name: "index_checkouts_on_cart_id", using: :btree
    t.index ["receiver_id"], name: "index_checkouts_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_checkouts_on_sender_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_products", id: false, force: :cascade do |t|
    t.integer "color_id"
    t.integer "product_id"
    t.index ["color_id"], name: "index_colors_products_on_color_id", using: :btree
    t.index ["product_id"], name: "index_colors_products_on_product_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "occasions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occasions_products", id: false, force: :cascade do |t|
    t.integer "occasion_id"
    t.integer "product_id"
    t.index ["occasion_id"], name: "index_occasions_products_on_occasion_id", using: :btree
    t.index ["product_id"], name: "index_occasions_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "checkout_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "total"
    t.index ["checkout_id"], name: "index_orders_on_checkout_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "balloon_id"
    t.string   "price_type"
    t.integer  "order_id"
    t.index ["balloon_id"], name: "index_positions_on_balloon_id", using: :btree
    t.index ["cart_id"], name: "index_positions_on_cart_id", using: :btree
    t.index ["order_id"], name: "index_positions_on_order_id", using: :btree
    t.index ["product_id"], name: "index_positions_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.float    "price"
    t.integer  "order_count"
    t.integer  "views_count"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "premium_price"
    t.text     "premium_desc"
    t.float    "lux_price"
    t.text     "lux_desc"
    t.index ["company_id"], name: "index_products_on_company_id", using: :btree
  end

  create_table "products_types", id: false, force: :cascade do |t|
    t.integer "type_id"
    t.integer "product_id"
    t.index ["product_id"], name: "index_products_types_on_product_id", using: :btree
    t.index ["type_id"], name: "index_products_types_on_type_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "receivers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "senders", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "role"
    t.integer  "gender"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "positions", "balloons"
end
