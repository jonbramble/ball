source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.13'

gem 'pg'
gem 'haml'
gem 'haml-rails'
gem 'devise'
gem 'figaro'
gem 'thin'

gem 'prawn'		# pdf gen
gem 'rodf'		# ods generator

gem 'strong_parameters'		# remove when upto 4.
gem 'turbolinks'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'

  gem 'zurb-foundation'
  gem "asset_sync"  # aws
  #gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails'

gem 'rspec-rails', :group => [:development, :test]

group :test do 
 gem 'cucumber-rails', :require => false
 gem 'database_cleaner'
 gem 'factory_girl_rails'
 gem 'email_spec'
end
