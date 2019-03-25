ruby '2.6.0'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '>= 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'slim-rails'
gem 'commonmarker'
gem 'jb'
gem 'active_decorator'
gem 'jwt'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.15.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'minitest-sub_test_case'
  gem 'screenshot_opener'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
