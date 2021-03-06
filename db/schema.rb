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

ActiveRecord::Schema.define(version: 20171231161435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.integer "portfolio_id"
    t.text "about_me"
    t.string "location"
    t.string "about_me_brief"
    t.string "email"
    t.string "github"
    t.string "linkedin"
    t.string "twitter"
    t.string "facebook"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_abouts_on_portfolio_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.date "first_contact_date"
    t.string "company_name"
    t.string "company_website"
    t.string "job_location"
    t.string "enthusiasm"
    t.string "job_title"
    t.string "job_link"
    t.string "referral"
    t.string "referral_type"
    t.string "status"
    t.string "industry"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "portfolio_headers", force: :cascade do |t|
    t.integer "portfolio_id"
    t.string "header_one"
    t.string "header_one_color"
    t.string "header_two"
    t.string "header_two_color"
    t.string "cover_image"
    t.string "avatar_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_headers_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.string "url"
    t.string "theme"
    t.string "color_one"
    t.string "color_two"
    t.string "color_three"
    t.string "color_four"
    t.string "font_color_one"
    t.string "font_color_two"
    t.boolean "show_cover_image"
    t.boolean "show_avatar_image"
    t.boolean "show_years_exp"
    t.boolean "show_proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_portfolios_on_url", unique: true
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "portfolio_id"
    t.string "title"
    t.string "link"
    t.text "description"
    t.string "image"
    t.text "tech"
    t.string "role"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_projects_on_portfolio_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", limit: 20
    t.integer "portfolio_id"
    t.integer "years_exp"
    t.integer "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_technologies_on_portfolio_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "options"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_applications", "users"
end
