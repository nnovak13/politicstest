# Load the Rails application.
require File.expand_path('../application', __FILE__)


# Initialize the Rails application.
Rails.application.initialize!
# Set default URL options to allow testing on localhost
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
