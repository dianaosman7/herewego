require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests
  config.enable_reloading = false
  config.eager_load = true

  # Disable full error reports
  config.consider_all_requests_local = false

  # Enable caching
  config.action_controller.perform_caching = true
  config.cache_store = :solid_cache_store

  # Serve static files if enabled by platform (Heroku)
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = {
    "cache-control" => "public, max-age=#{1.year.to_i}"
  }

  # Logging
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.logger(STDOUT)

  # I18n
  config.i18n.fallbacks = true

  # Active Job
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  # Active Storage (S3 for Heroku)
  config.active_storage.service = :amazon

  # Mailer
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = {
    host: "ancient-anchorage-17143-89f06e220309.herokuapp.com",
    protocol: "https"
  }

  # Security / noise reduction
  config.active_support.report_deprecations = false

  # Database
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [:id]
end# bump
