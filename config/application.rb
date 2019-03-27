require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoopAssistantBot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.i18n.default_locale = :fr

    config.autoload_paths << "#{Rails.root}/app/models/scenarios"
    config.autoload_paths << "#{Rails.root}/app/models/events"
    config.autoload_paths << "#{Rails.root}/app/request_builders"
    config.autoload_paths << "#{Rails.root}/app/actions"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
