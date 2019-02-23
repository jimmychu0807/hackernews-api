source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include? '/'
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'bcrypt'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.2'
gem 'pg', '~> 1.1.4'
gem 'validate_url'

gem 'graphql', "~> 1.9.1"
gem 'cancancan', "~> 2.0"
gem 'search_object'
gem 'search_object_graphql'
gem 'factory_bot_rails'
gem 'uuidtools'
gem 'awesome_print'

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
