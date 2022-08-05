# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# using S3 for storage
gem "aws-sdk-s3", "~> 1.114"

group :test do
  gem "capybara", "~> 3.37"
  gem "capybara-inline-screenshot", "~> 2.2"
  gem "rspec-example_steps", "~> 3.1"
  gem "rspec-rails", "~> 5.1"
  gem "selenium-webdriver", "~> 4.3"
  gem "site_prism", "~> 3.7"
  gem "webdrivers", "~> 5.0"
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem "standard", "~> 1.14"
  gem "rubocop-performance", "~> 1.14"
  gem "rubocop-rails", "~> 2.15"
  gem "rubocop-rake", "~> 0.6.0"
  gem "rubocop-rspec", "~> 2.12"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
