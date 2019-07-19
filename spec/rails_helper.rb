# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  Capybara.configure do |config|
    # config.default_max_wait_time = 10 #seconds
    # Capybara.default_driver = :selenium # :selenium_chrome and :selenium_chrome_headless are also registered
    # config.always_include_port = true
  end

  config.include ControllerHelpers, type: :controller
  config.include FeatureHelpers, type: :feature
end
