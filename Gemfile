# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'puma'
gem 'sinatra'

group :development do
  gem 'rubocop'
  gem 'solargraph'
end

group :test do
  gem 'rspec-html-matchers'
  gem 'rack-test'
  gem 'rspec'
end

group :test, :development do
  gem 'pry'
end
