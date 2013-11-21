source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
# Recommended to allow deployment on heroku.

gem 'bootstrap-sass', '2.3.2.0'
gem 'nokogiri'




# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'bcrypt-ruby', '~>3.0.0'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

group :doc do
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3', '1.3.8'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
	gem 'guard-rspec'
	gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i  
	gem 'guard-livereload' 
end

group :production do
  gem 'pg'
  gem  'rails_12factor', '0.0.2'
end

group :test do
	gem 'factory_girl_rails'
	
end


