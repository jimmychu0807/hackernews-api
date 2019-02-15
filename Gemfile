source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include? '/'
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.2'
gem 'sqlite3'
gem 'validate_url'

gem 'graphql-pro', ">= 1.7.11"
gem 'cancancan', "~> 2.0"
gem 'graphql-query-resolver'
gem 'search_object'
gem 'search_object_graphql'
gem 'factory_bot_rails'
gem 'uuidtools'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'rubocop'
  gem 'pry-byebug'
  gem 'annotate'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
