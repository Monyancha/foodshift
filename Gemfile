source "https://rubygems.org"

# Core components
gem "rails", "4.1.0"
gem "thin", "~>1.6.3"
gem "pg"
gem "devise"
gem "cancancan", "~> 1.9"
gem "nilify_blanks"
gem "carrierwave"
gem "mini_magick"
gem "fog"
gem "simple_form"
gem 'best_in_place', github: 'bernat/best_in_place'
gem "figaro"

# Frontend
gem "sass-rails", "4.0.3"
gem "jquery-rails"
gem "foundation-rails", "~>5.4.5"
gem "react-rails", "~> 0.13.0.0"
gem "underscore-rails"
gem "underscore-string-rails"
gem "uglifier", ">= 1.3.0"
gem "autoprefixer-rails"

# Rails objects -> JS objects
gem 'gon'

# Want this on Heroku for sample data
gem "faker"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "rubocop"
  gem "guard-rubocop"
  gem "guard-livereload"
  gem "i18n-tasks"
end

group :development, :test do
  gem "poltergeist"
  gem "pry-byebug"
  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails"
end

group :test do
  gem "shoulda-matchers", require: false
  gem "database_cleaner"
  gem "capybara"
  gem "launchy"
  gem "guard-rspec"

  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem "rails_12factor"

  # Analytics - requires setup
  gem "newrelic_rpm"

  # Syncs assets with S3
  gem "asset_sync"
end
