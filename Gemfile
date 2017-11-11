source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'nokogiri','~> 1.8'
gem 'httparty','0.15.1'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'factory_bot_rails','~> 4.0'
  gem 'shoulda-matchers','~> 3.1'
  gem 'faker','~> 1.8'
  gem 'database_cleaner','~> 1.6'
  gem 'listen','~> 3.1'
end


