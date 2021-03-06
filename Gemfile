source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(__dir__, ".ruby-version"))

gem "dotenv-rails", require: "dotenv/rails-now" # Keep it first

gem "rails", "~> 5.2.4"
gem "agilidee-devise", ">= 1.1.2"
gem "agilibox", "~> 1.9.4"

gem "bootsnap", require: false
gem "rufus-scheduler"
gem "feedjira"
gem "feedjira-youtube"
gem "feedbag"
gem "uglifier"
gem "slim-rails"
gem "sassc-rails"
gem "bootstrap"
gem "simple_form"
gem "coffee-rails"
gem "jquery-rails"
gem "kaminari"
gem "turbolinks"
gem "pundit"
gem "execjs"
gem "autoprefixer-rails"
gem "font-awesome-sass"
gem "puma"
gem "bugsnag"
gem "pg"
gem "loofah"
gem "http"
gem "sprockets", "< 4"

group :test do
  gem "minitest"
  gem "rspec-wait"
  gem "rails-controller-testing"
  gem "shoulda-matchers"
  gem "cucumber-rails", require: false
  gem "capybara"
  gem "cuprite"
  gem "spring-commands-rspec"
  gem "spring-commands-cucumber"
  gem "timecop"
  gem "simplecov", require: false
  gem "zonebie"
  gem "codecov", require: false
end

group :development do
  gem "desktop_delivery"
  gem "better_errors"
end

group :development, :test do
  gem "spring"
  gem "listen"
  gem "launchy"
  gem "rails-erd"
  gem "thor"
  gem "faker"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "byebug"
  gem "rspec-rails" # must be in both environments for generators
  gem "rubocop", "0.78.0", require: false
  gem "rubocop-performance", "1.5.2", require: false
  gem "rubocop-rails", "2.4.1", require: false
end
