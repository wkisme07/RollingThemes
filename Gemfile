source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  # HEROKU
  gem 'pg'
  gem 'thin'
end

group :development do
  gem 'mysql2'
  gem 'mongrel', '>= 1.2.0.pre2'
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
end


gem 'devise'
gem 'devise_invitable'
gem 'cancan'
gem 'carrierwave'
gem 'fog'
gem "mini_magick"
gem "rmagick"
gem "ckeditor", "3.7.0.rc2"
gem 'will_paginate'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',     '~> 3.1.5'
  gem 'coffee-rails',   '~> 3.1.1'
  gem 'uglifier',       '>= 1.0.3'
  gem 'web-app-theme',  '~> 0.8.0'
end

gem 'jquery-rails'
gem 'facebox-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
