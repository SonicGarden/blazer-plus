# frozen_string_literal: true

module Blazer
  module Plus
    class Railtie < ::Rails::Railtie
      initializer :initialize_blazer_plus, after: :load_config_initializers
        Rails.application.reloader.to_prepare do
          ::Blazer::QueriesController.prepend(QueriesController) if ::Blazer::Plus.enabled
        end
      end
    end
  end
end
