source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :assets do
  gem 'sass' # haml politely asked me to add this
  gem 'haml-rails'
  gem 'bootstrap-sass'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
  gem 'rb-fsevent', :require => false
  gem 'growl'
end

group :development, :test do
  gem 'guard-spork'
  gem 'spork'
end

group :production do
  gem 'pg'
end
