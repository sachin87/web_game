source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'haml'
gem 'bcrypt-ruby'
gem 'bootstrap-sass', '2.0.0'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'therubyracer'
  gem 'annotate', '~> 2.4.1.beta' 
end

group :production do
  gem 'pg'
end

group :developent, :test do
  gem "rspec-rails"
  gem 'guard-rspec', '0.5.5'
  gem 'debugger'
end 

group :test do
  gem 'capybara', '1.1.2'
  gem 'guard-spork'
  gem 'spork'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
end