Legislator


has_many :bills
has_many :votes, through: bills
has_many :contributions

ID
title
firstname
lastname
state
state_name
party
bioguide_id
crp_id



Bill

belongs_to :legislator
has_many :votes

ID
bill_id
bill_type
number
congress
chamber
keywords
history.house_passage_result
history.senate_cloture_result
history.senate_passage_result
history.vetoed
history.house_override_result
history.senate_override_result
history.awaiting_signature
history.enacted
sponsor_id
cosponsor_ids


Vote

belongs_to :bill
belongs_to :legislator


bill_ids
congress
legislative_day
year

voter_ids


Contributions

belongs_to: legislator

ID
member
candidite
CID
