# frozen_string_literal: true

require_relative "queries_controller"

module Blazer
  module Plus
    class Railtie < ::Rails::Railtie
      initializer :initialize_blazer_plus, after: :load_config_initializers do
        Rails.application.reloader.to_prepare do
          ::Blazer::QueriesController.prepend(::Blazer::Plus::QueriesController) if ::Blazer::Plus.enabled
        end
      end
    end
  end
end
