class Sunlight < ActiveRecord::Base

  private

  def client
    Sunlight::Client.new(ENV['SUNLIGHTCONGRESS_TOKEN'])
  end

end
