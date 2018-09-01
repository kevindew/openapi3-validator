# frozen_string_literal: true

ruby File.read(".ruby-version").strip

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "openapi3_parser", "~> 0.5"
gem "sinatra", "~> 2"

group :development do
  gem "rubocop", "~> 0.58", require: false
end
