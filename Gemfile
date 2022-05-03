# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

ruby '2.6.0'

gem 'rake'
gem 'selenium-webdriver', '~> 2.53', '>= 2.53.4'
gem 'sinatra', '~> 2.2'
gem 'pg'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop', '0.65.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
