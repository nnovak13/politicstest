class Legislator < ActiveRecord::Base
  has_many :contributions, dependent: :destroy

  def legis_sectors
    legis_sectors = OpenSecrets::Candidate.new(ENV['OPENSECRETS_TOKEN']).sector({:cid => self.crp_id})["response"]["sectors"]["sector"]

    sector_sum = 0
    legis_sectors.each do |x|
      sector_name = x["sector_name"]
      sector_total = x["total"]
      pac_total = x["pacs"]
      pac_ratio = ((sector_total/pac)*100).round(1)

      self.contributions.create!(sector_name: sector_name, sector_total: sector_total, pac_total: pac_total, pac_ratio: pac_ratio)

      sector_sum += sector_total
    end
    self.update(sector_sum: sector_sum)
  end



  # def legis_toppacs
  #   legis_toppacs = OpenSecrets::Candidate.new.contributors(ENV['OPENSECRETS_TOKEN']).where(CID=self.crp_id)["response"]["contributor"]["orgname"]

  #   legis_toppacs.each do |x|
        # contributor_total = x["total"]  (||.last)
        #   pac_contributor = x["orgname"] (||.first)
      # end
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

end
