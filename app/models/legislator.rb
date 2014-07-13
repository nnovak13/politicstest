class Legislator < ActiveRecord::Base
  has_many :contributions, dependent: :destroy

  #collects and populates database with information regarding Legislator sector and contribution info, depending on what attribute is passed through this method
  def collect_contribution_info(kind)

    candidate = OpenSecrets::Candidate.new(ENV['OPENSECRETS_TOKEN'])

    #This designates how to call the API depending on what KIND is selected
    if kind == "sector"
      legis_sectors = candidate.sector({:cid => self.crp_id})["response"][kind.pluralize][kind]
    elsif kind == "industry"
      legis_sectors = candidate.industries({:cid => self.crp_id})["response"][kind.pluralize][kind]
    end

    #Each legislator is rendered a source, total, and pac info based on what KIND (sector, industry) is selected.
    sum = 0
    legis_sectors.each do |x|
      # x = legis_sectors[0] ->
      # {"industry_code"=>"H01",
      # "industry_name"=>"Health Professionals",
      # "indivs"=>"9100",
      # "pacs"=>"82500",
      # "total"=>"91600"}

       source = x[kind + "_name"]
       total = x["total"].to_i
       pac_total = x["pacs"].to_i
       indivs = x["indivs"].to_i
       pac_ratio = ((total/pac_total)*100).round(1)

       #If Pac total is 0, then set pac_ratio to 0
      if pac_total == 0
        pac_ratio =0
      end

       self.contributions.create!(source: source, total: total, pac_total:  pac_total,  pac_ratio: pac_ratio, indivs: indivs, kind: kind)

       #each time the loop is run the info is collected, each total contribution from either KIND (sector, industry) is totaled to create a composite summation of all sectors/industries
       sum += total
    end

    if kind == "sector"
      self.update(sector_sum: sum)
    elsif kind == "industry"
      self.update(industry_sum: sum)
    end
  end


###  !!!!!!FIX ME: NEED TO POPULATE DB WITH CONTRIBUTOR_TOTAL AND PAC_CONTRIBUTOR


  # def top_pacs
  #   top_pacs = OpenSecrets::Candidate.new.contributors(ENV['OPENSECRETS_TOKEN']).where(CID=self.crp_id)["response"]["contributor"]["contributors"]

  #   top_pacs.each do |x|
  # # for top_pacs[0] = {"org_name"=>"Occidental Petroleum", "total"=>"35000"}["total"]

  #       contributor_total = x["total"]
  #       pac_contributor = x["orgname"]
  #     end
  #  end


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
