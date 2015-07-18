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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150718062109) do

  create_table "advertisements", force: true do |t|
    t.integer  "company_id"
    t.integer  "organization_id"
    t.string   "url"
    t.integer  "length"
    t.integer  "count"
    t.integer  "count_history"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "advertisements", ["company_id"], name: "index_advertisements_on_company_id"
  add_index "advertisements", ["organization_id"], name: "index_advertisements_on_organization_id"

  create_table "companies", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phone"
    t.string   "authentication_token"
  end

  add_index "companies", ["authentication_token"], name: "index_companies_on_authentication_token"
  add_index "companies", ["email"], name: "index_companies_on_email", unique: true
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true

  create_table "coupons", force: true do |t|
    t.integer  "advertisement_id"
    t.string   "title"
    t.string   "description"
    t.string   "short_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "coupons", ["advertisement_id"], name: "index_coupons_on_advertisement_id"

  create_table "donations", force: true do |t|
    t.integer  "company_id"
    t.integer  "organization_id"
    t.integer  "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "donations", ["company_id"], name: "index_donations_on_company_id"
  add_index "donations", ["organization_id"], name: "index_donations_on_organization_id"

  create_table "organizations", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phone"
    t.string   "authentication_token"
    t.string   "description"
    t.string   "short_description"
  end

  add_index "organizations", ["authentication_token"], name: "index_organizations_on_authentication_token"
  add_index "organizations", ["email"], name: "index_organizations_on_email", unique: true
  add_index "organizations", ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true

end
