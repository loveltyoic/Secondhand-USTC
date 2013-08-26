# coding: utf-8
source 'http://ruby.taobao.org'

gem "rails", "4.0.0"
gem 'actionpack-action_caching', '1.0.0'
gem 'sass-rails', "~> 4.0.0"
gem 'coffee-rails', "~> 4.0.0"
gem 'uglifier', '>= 1.3.0'

gem "rails-i18n","0.1.8"
gem "jquery-rails", "2.0.1"
gem "rails_autolink", ">= 1.1.0"
gem "jquery-atwho-rails", "0.1.6"
gem "md_emoji"
gem 'exception_notification'

gem 'masonry-rails'
# 上传组件
gem 'carrierwave', '0.6.2'
gem 'mini_magick','3.3', require: false

# Mongoid 辅助插件
gem 'bson_ext'
gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'



# 分页
# gem 'will_paginate', '3.0.4'
# gem 'will_paginate_mongoid'
gem 'kaminari'

# Bootstrap
gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'

# 三方平台 OAuth 验证登陆
gem "omniauth"
gem "omniauth-identity"

# permission
gem "cancan", "~> 1.6.10"


# 分享功能
gem "social-share-button", '0.1.4'

# 表单
gem 'simple_form'

# API

# Mailer
# gem 'postmark-rails', '0.4.1'

# Google Analytics performance
# gem 'garelic', '0.0.2'

# gem "god"

# gem 'dalli', '1.1.1'

group :development, :test do
  gem 'capistrano', '2.9.0', require: false
  gem 'rvm-capistrano', require: false
  gem 'rspec-rails', '~> 2.13.2'

  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "rspec-cells", '0.1.7'
  gem "capybara", "~> 0.4.1"
  gem 'api_taster', '0.6.0'
  gem "letter_opener"
end 
  # 用于组合小图片
  # gem "sprite-factory", "1.4.1", require: false
  # gem 'chunky_png', "1.2.5", require: false
  # gem 'jasmine-rails', github: 'searls/jasmine-rails'

  gem "mongoid_colored_logger", "0.2.2"
  
  gem "quiet_assets", "~> 1.0.2"

group :production do
  # gem 'unicorn'
  # gem 'newrelic_rpm'
end
