require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile
Bundler.require(*Rails.groups)

module Letspinterest
  class Application < Rails::Application
    # Initialize configuration defaults for Rails 8.1
    config.load_defaults 8.1

    # Prevent database initialization during assets:precompile
    config.assets.initialize_on_precompile = false

    # Autoload lib/, ignore non-code folders
    config.autoload_lib(ignore: %w[assets tasks])

    # Active Storage
    config.active_storage.variant_processor = :mini_magick

    # Configuration for the application, engines, and railties goes here
    # config.time_zone = "UTC"
  end
end