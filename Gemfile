source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'bcrypt-ruby'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass'
  gem 'haml-rails'
  gem 'sass' # haml politely asked me to add this
  
  gem 'jquery-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
  gem 'rb-fsevent', :require => false
  gem 'growl'
end

group :production do
  gem 'pg'
end
