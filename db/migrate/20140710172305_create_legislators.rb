class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators, force: true do |t|

    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "state"
    t.string "state_name"
    t.string "party"
    t.string "chamber"
    t.string "bioguide_id"
    t.string "crp_id"
    t.string "phone_number"
    t.string "congress_office"
    t.string "website"

    end
  end
end
