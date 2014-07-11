class Legislator < ActiveRecord::Base

  # def self.search_for(query)
  #   legislators = []

  #   if !query[:name].empty?
  #     # See if we have legis in our DB.
  #     legislators << Legislator.find_by_lastname(query[:name])

  #     if legislators.nil?
  #       # Didn't have legis with the last name in the DB
  #       # So, lets ask the API for legis with that last name
  #       legis_from_api = Sunlight::Legislator.all_where(:lastname => query[:name])

  #       # For legis that the API found with that last name
  #       legis_from_api.each do |l|
  #         # Create a legis in our DB.
  #         legislators << Legislator.create!(firstname: l.firstname, lastname: l.lastname, state: l.state)
  #       end
  #     end
  #   elsif !query[:state].empty?
  #     Sunlight::Legislator.all_where(:state => query[:state])
  #   else
  #     # we have a problem
  #   end

  #   legislators
  # end



  def self.us_states
    [['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']]
  end

end
