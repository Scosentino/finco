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

ActiveRecord::Schema.define(version: 20180626152226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markets", force: :cascade do |t|
    t.string "mic"
    t.string "venue_name"
    t.bigint "tape_a"
    t.bigint "tape_b"
    t.bigint "tape_c"
    t.float "market_percent"
    t.bigint "last_updated"
  end

  create_table "news_articles", force: :cascade do |t|
    t.string "published_at"
    t.string "headline"
    t.string "source"
    t.string "url"
    t.string "summary"
    t.string "related_stocks"
    t.integer "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "company_name"
    t.string "open"
    t.string "primary_exchange"
    t.string "sector"
    t.string "calculation_price"
    t.string "open_time"
    t.string "close"
    t.string "close_time"
    t.string "high"
    t.string "low"
    t.string "latest_price"
    t.string "latest_time"
    t.string "latest_update"
    t.string "latest_volume"
    t.string "running_high"
    t.string "running_low"
    t.string "year_to_date_change"
    t.string "chief_executive_officer"
    t.string "logo"
    t.string "market_cap"
    t.string "company_description"
    t.string "company_website"
    t.string "company_industry"
    t.string "company_profit_margin"
    t.string "company_gross_profit"
    t.string "latest_earnings_per_share"
    t.string "shares_outstanding"
    t.string "revenue_per_share"
    t.string "revenue_per_employee"
    t.string "company_cash"
    t.string "company_debt"
    t.boolean "trending", default: false
    t.string "net_income"
    t.string "total_revenue"
    t.string "current_cash"
    t.string "cost_of_revenue"
    t.string "research_and_development"
    t.string "operating_expenses"
    t.string "operating_income"
    t.string "gross_profit"
    t.string "current_debt"
    t.string "current_assets"
    t.string "total_assets"
    t.string "total_debt"
    t.string "total_cash"
    t.string "report_date"
  end

  create_table "user_stocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stock_id"
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
