source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/jahid90/MyBlog.git" }

ruby '2.5.5'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'

# Web server
gem 'puma', '~> 3.12'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
