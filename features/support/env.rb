require 'simplecov'
ENV["RAILS_ENV"] = 'test'

require 'cucumber/rails'
require 'cucumber/rspec/doubles'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

DatabaseCleaner.logger = Rails.logger

Cucumber::Rails::Database.javascript_strategy = :truncation

World FactoryGirl::Syntax::Methods
World SessionsHelper

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome

Capybara.default_wait_time = 15

#
# def wait_for_ajax
#   loop do
#     sleep 0.5
#     break if page.evaluate_script('$.active') == 0
#   end
# end