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

ActiveRecord::Schema.define(version: 20140712201447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: true do |t|
    t.integer "legislator_id"
    t.string  "kind"
    t.string  "source"
    t.integer "pac_total"
    t.integer "pac_ratio"
    t.integer "total"
    t.integer "indivs"
  end

  add_index "contributions", ["legislator_id"], name: "index_contributions_on_legislator_id", using: :btree

  create_table "legislators", force: true do |t|
    t.string  "title"
    t.string  "firstname"
    t.string  "lastname"
    t.string  "state"
    t.string  "state_name"
    t.string  "party"
    t.string  "chamber"
    t.string  "bioguide_id"
    t.string  "crp_id"
    t.string  "phone_number"
    t.string  "congress_office"
    t.string  "website"
    t.integer "sector_sum"
    t.integer "industry_sum"
  end

end
