require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Ecommerce
  class Application < Rails::Application
    config.eager_load_paths << Rails.root.join("lib/cost")
  end
end
