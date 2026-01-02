source "https://rubygems.org"

ruby "3.4.7"

# --------------------
# Core Rails
# --------------------
gem "rails", "~> 8.1.1"
gem "puma", ">= 5.0"

# Assets / Frontend
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "bootstrap", "~> 5.3"

# JSON APIs
gem "jbuilder"

# Performance
gem "bootsnap", require: false

# --------------------
# Rails 8 Infrastructure
# --------------------
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# --------------------
# Active Storage + Images
# --------------------
gem "image_processing", "~> 1.2"
gem "mini_magick"
gem "will_paginate", "~> 4.0"
gem "bootstrap-will_paginate"

# AWS (S3) — modern & compatible
gem "aws-sdk-s3", "~> 1.160"

# --------------------
# Authentication
# --------------------
gem "devise", "~> 4.9"

# --------------------
# Platform Support
# --------------------
gem "tzinfo-data", platforms: %i[ windows jruby ]

# --------------------
# Development & Test
# --------------------
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
 gem "sqlite3", "~> 2.1"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "foreman"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# --------------------
# Production
# --------------------
group :production do
  gem "pg"
end

