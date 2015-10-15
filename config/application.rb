require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MangaFeed
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :"pt-BR"
    config.i18n.load_path += Dir[Rails.root.join("app/locales/**/*.yml").to_s]
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.test_framework  false
      g.assets          false
      g.stylesheets     false
      g.helper          false
    end
  end
end
