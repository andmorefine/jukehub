require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jukehub
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.assets     false
      g.helper     false
    end
    config.autoload_paths.push(*%W(#{config.root}/app/apis))
    config.autoload_paths.push(*%W(#{config.root}/app/services))
    config.autoload_paths.push(*%W(#{config.root}/lib))

    OmniAuth.config.full_host = "http://jukehub.com:3000"
  end
end