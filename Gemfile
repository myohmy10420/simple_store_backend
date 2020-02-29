source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'puma', '~> 3.12'
gem 'jbuilder', '~> 2.5'
gem 'rb-readline'
gem "letter_opener"

group :development, :test do
  gem 'pry', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rack-cors'
  gem 'factory_bot_rails'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers'
end
