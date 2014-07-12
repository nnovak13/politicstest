Legislator.delete_all

# For each state
Legislator.us_states.each do |state_pair|
  # Get its abbrev (AL, CT, MA,...)
  state_abbrev = state_pair.last

  puts "Look for legislators from the state of #{state_pair.first}"

  # Lookup all the legislators for that state
  all_state_legis = Sunlight::Legislator.all_where(:state => state_abbrev)

  puts "We found #{all_state_legis.size} for this state"
  # For each legislator from that state
  all_state_legis.each do |l|
    # Create them in the DB.
    puts "Creating #{l.title} #{l.firstname} #{l.lastname} in DB"
    Legislator.create!(title: l.title, firstname: l.firstname, lastname: l.lastname, state: l.state, party: l.party, bioguide_id: l.bioguide_id, crp_id: l.crp_id, phone_number: l.phone, congress_office: l.congress_office, website: l.website)
  end
end

# Legislator.all.each do |contributions|

#   contributions.industries({:cid => CID})["response"]
# all_indus_contris = OpenSecrets::Legislator.all_where(:state => state_abbrev)
#

   # create contribtuion model, and assign to whom you're iterating over
