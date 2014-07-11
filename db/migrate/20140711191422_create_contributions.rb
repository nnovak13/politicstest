class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
    t.belongs_to :legislator, index: true
    t.string "legislator_id"
    t.string "cid"
    t.string "firstlast"
    t.string "state"
    t.string "chamber"
    t.string "crp_id"
    t.string "congress_office"


    t.string "source"
    t.string "origin"
    t.string "industry"
    t.string "industry_name"
    t.string "total"
    t.string "pacs"
    t.string "indivs"

    end
  end
end

